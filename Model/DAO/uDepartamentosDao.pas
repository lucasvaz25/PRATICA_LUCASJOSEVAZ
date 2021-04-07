unit uDepartamentosDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UDepartamentos,
  Datasnap.DBClient,
  Vcl.StdCtrls;

type
  TDepartamentosDao = class( DAO )
  private
    procedure FieldsToObj( var Value: TDepartamentos );
    procedure ObjToFields( var Value: TDepartamentos );
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
{ TDepartamentosDao }

function TDepartamentosDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TDepartamentos;
begin
  Result := nil;

  with DM.QryDepartamentos do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT * FROM DEPARTAMENTOS ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE DEPARTAMENTO LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY DEPARTAMENTO ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TDepartamentos.Create;
        Self.FieldsToObj( Aux );
        Result.Add( Aux );

        Next;
      end;
    finally
      Close;
    end;

  end;
end;

constructor TDepartamentosDao.Create;
begin
  inherited;
end;

function TDepartamentosDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with DM.QryDepartamentos do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM DEPARTAMENTOS WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TDepartamentosDao.Destroy;
begin
  inherited;
end;

function TDepartamentosDao.Editar( var Value: TObject ): Boolean;
var
  Dept: TDepartamentos;
begin

  Dept := TDepartamentos( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryDepartamentos do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE DEPARTAMENTOS SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'DEPARTAMENTO = :DEPARTAMENTO, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Dept );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Dept.Departamento + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TDepartamentosDao.FieldsToObj( var Value: TDepartamentos );
begin
  with Value, DM.QryDepartamentos do
  begin
    Codigo       := FieldByName( 'CODIGO' ).AsInteger;
    DataCad      := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt      := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad      := FieldByName( 'USER_CAD' ).AsString;
    UserAlt      := FieldByName( 'USER_ALT' ).AsString;
    Departamento := FieldByName( 'DEPARTAMENTO' ).AsString;
  end;
end;

function TDepartamentosDao.Inserir( var Value: TObject ): Boolean;
var
  Dept: TDepartamentos;
begin
  Dept := TDepartamentos( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryGrupos do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO GRUPOS ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'DEPARTAMENTO, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':DEPARTAMENTO, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ')' );
      ObjToFields( Dept );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Dept.Departamento + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TDepartamentosDao.ObjToFields( var Value: TDepartamentos );
begin
  with Value, DM.QryDepartamentos do
  begin
    ParamByName( 'CODIGO' ).AsInteger      := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime   := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime   := DataAlt;
    ParamByName( 'USER_CAD' ).AsString     := UserCad;
    ParamByName( 'USER_ALT' ).AsString     := UserAlt;
    ParamByName( 'DEPARTAMENTO' ).AsString := Departamento;
  end;
end;

function TDepartamentosDao.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
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
    // AFilter.RecuperarObj := True;
    List := Self.Consulta( Afilter );
    if List <> nil then
    begin
      Result := True;
      TDepartamentos( Obj ).CopiarDados( TDepartamentos( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TDepartamentosDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TDepartamentos( List[ I ] ).Departamento ) then
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
