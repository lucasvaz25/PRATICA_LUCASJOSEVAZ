unit uCargosDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UCargos,
  UDepartamentos,
  UDepartamentosDao;

type
  TCargosDao = class( DAO )
  private
    procedure FieldsToObj( var Value: TCargos );
    procedure ObjToFields( var Value: TCargos );
  public
    constructor Create;
    destructor Destroy;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;
{ TCargosDao }

function TCargosDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TCargos;
  Dept: TDepartamentos;
  DeptDao: TDepartamentosDao;
begin
  Result := nil;

  with DM.QryCargos do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT C.*, D.DEPARTAMENTO FROM CARGOS C ' );
    SQL.Add( 'LEFT JOIN DEPARTAMENTOS D ON D.CODIGO = C.COD_DEPARTAMENTO ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE C.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE C.CARGO LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY C.CARGO ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TCargos.Create;
        Self.FieldsToObj( Aux );
        Result.Add( Aux );
        Aux.Departamento.Departamento := FieldByName( 'DEPARTAMENTO' ).AsString;

        if AFilter.RecuperarObj then
        begin
          if Aux.Departamento.Codigo > 0 then
          begin
            DeptDao := TDepartamentosDao.Create;
            Dept    := TDepartamentos.Create;
            try
              if DeptDao.Recuperar( Aux.Departamento.Codigo, TObject( Dept ) ) then
                Aux.Departamento.CopiarDados( Dept );
            finally
              Dept.Free;
              DeptDao.Destroy;
            end;
          end;
        end;
        Next;
      end;
    finally
      Close;
    end;

  end;
end;

constructor TCargosDao.Create;
begin
  inherited;
end;

function TCargosDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with DM.QryCargos do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM CARGOS WHERE CODIGO = ' + IntToStr( VID ) );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Deletar o registro.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

destructor TCargosDao.Destroy;
begin
  inherited;
end;

function TCargosDao.Editar( var Value: TObject ): Boolean;
var
  Cargo: TCargos;
begin

  Cargo := TCargos( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryCargos do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE CARGOS SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'CARGO = :CARGO, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD, ' );
      SQL.Add( 'COD_DEPARTAMENTO = :COD_DEPARTAMENTO, ' );
      SQL.Add( 'IS_CNH_OBRIGATORIO = :IS_CNH_OBRIGATORIO ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Cargo );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Cargo.Cargo + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TCargosDao.FieldsToObj( var Value: TCargos );
begin
  with Value, DM.QryCargos do
  begin
    Codigo              := FieldByName( 'CODIGO' ).AsInteger;
    DataCad             := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt             := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad             := FieldByName( 'USER_CAD' ).AsString;
    UserAlt             := FieldByName( 'USER_ALT' ).AsString;
    Departamento.Codigo := FieldByName( 'COD_DEPARTAMENTO' ).AsInteger;
    Cargo               := FieldByName( 'CARGO' ).AsString;
    IsObrigatorioCNH    := Boolean( FieldByName( 'IS_CNH_OBRIGATORIO' ).AsInteger );
  end;
end;

function TCargosDao.Inserir( var Value: TObject ): Boolean;
var
  Cargo: TCargos;
begin
  Cargo := TCargos( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryCargos do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO CARGOS ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'CARGO, COD_DEPARTAMENTO, ' );
      SQL.Add( 'IS_CNH_OBRIGATORIO, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':CARGO, :COD_DEPARTAMENTO, ' );
      SQL.Add( ':IS_CNH_OBRIGATORIO, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ')' );
      ObjToFields( Cargo );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Cargo.Cargo + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TCargosDao.ObjToFields( var Value: TCargos );
begin
  with Value, DM.QryCargos do
  begin
    ParamByName( 'CODIGO' ).AsInteger             := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime          := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime          := DataAlt;
    ParamByName( 'USER_CAD' ).AsString            := UserCad;
    ParamByName( 'USER_ALT' ).AsString            := UserAlt;
    ParamByName( 'CARGO' ).AsString               := Cargo;
    ParamByName( 'COD_DEPARTAMENTO' ).AsInteger   := Departamento.Codigo;
    ParamByName( 'IS_CNH_OBRIGATORIO' ).AsInteger := IsObrigatorioCNH.ToInteger;
  end;
end;

function TCargosDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
var
  List: TObjectList;
  Afilter: TFilterSearch;
begin
  Result  := False;
  List    := TObjectList.Create;
  Afilter := TFilterSearch.Create;
  try
    Afilter.TipoConsulta := TpCCodigo;
    Afilter.Codigo       := VID;
    AFilter.RecuperarObj := True;
    List                 := Self.Consulta( Afilter );
    if List <> nil then
    begin
      Result := True;
      TCargos( Obj ).CopiarDados( TCargos( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TCargosDao.VerificaExiste( Str: string ): Boolean;
var
  List: Tobjectlist;
  Afilter: TFilterSearch;
  I: Integer;
begin
  Result  := False;
  List    := Tobjectlist.Create;
  Afilter := TFilterSearch.Create;
  try
    Afilter.TipoConsulta := TpCParam;
    Afilter.Parametro    := Str;
    List                 := Self.Consulta( Afilter );
    if List <> nil then
    begin
      for I := 0 to List.Count - 1 do
        if ( Str = TCargos( List[ I ] ).Cargo ) then
        begin
          Result := True;
          Break;
        end;
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

end.
