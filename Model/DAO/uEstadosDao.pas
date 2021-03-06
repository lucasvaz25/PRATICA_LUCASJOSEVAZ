unit uEstadosDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UEstados,
  UPaises,
  UPaisesDao;

type
  TEstadosDao = class( DAO )
  private
    procedure FieldsToObj( var Value: TEstado );
    procedure ObjToFields( var Value: TEstado );
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

{ TEstadosDao }

function TEstadosDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TEstado;
  Pais: TPais;
  PaisDao: TPaisesDao;
begin
  Result := nil;

  with DM.QryEstados do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT E.*, P.NOME FROM ESTADOS E ' );
    SQL.Add( 'LEFT JOIN PAISES P ON P.CODIGO = E.COD_PAIS ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE E.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE E.ESTADO LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY E.ESTADO ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TEstado.Create;
        Self.FieldsToObj( Aux );
        Aux.Pais.Nome := FieldByName( 'NOME' ).AsString;

        if AFilter.RecuperarObj then
        begin
          if Aux.Pais.Codigo > 0 then
          begin
            PaisDao := TPaisesDao.Create;
            Pais    := TPais.Create;
            try
              if PaisDao.Recuperar( Aux.Pais.Codigo, TObject( Pais ) ) then
                Aux.Pais.CopiarDados( Pais );
            finally
              Pais.Free;
              PaisDao.Destroy;
            end;
          end;
        end;

        Result.Add( Aux );

        Next;
      end;
    finally
      Close;
    end;

  end;
end;

constructor TEstadosDao.Create;
begin
  inherited;
end;

function TEstadosDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with DM.QryEstados do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM ESTADOS WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TEstadosDao.Destroy;
begin
  inherited;
end;

function TEstadosDao.Editar( var Value: TObject ): Boolean;
var
  Estado: TEstado;
begin

  Estado := TEstado( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryEstados do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE ESTADOS SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'ESTADO = :ESTADO, UF = :UF, COD_PAIS = :COD_PAIS, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Estado );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Estado.Estado + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TEstadosDao.FieldsToObj( var Value: TEstado );
begin
  with Value, DM.QryEstados do
  begin
    Codigo      := FieldByName( 'CODIGO' ).AsInteger;
    DataCad     := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt     := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad     := FieldByName( 'USER_CAD' ).AsString;
    UserAlt     := FieldByName( 'USER_ALT' ).AsString;
    Estado      := FieldByName( 'ESTADO' ).AsString;
    UF          := FieldByName( 'UF' ).AsString;
    Pais.Codigo := FieldByName( 'COD_PAIS' ).AsInteger;
  end;
end;

function TEstadosDao.Inserir( var Value: TObject ): Boolean;
var
  Estado: TEstado;
begin
  Estado := TEstado( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryEstados do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO ESTADOS ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'ESTADO, UF, COD_PAIS, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':ESTADO, :UF, :COD_PAIS, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ')' );
      ObjToFields( Estado );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Estado.Estado + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TEstadosDao.ObjToFields( var Value: TEstado );
begin
  with Value, DM.QryEstados do
  begin
    ParamByName( 'CODIGO' ).AsInteger    := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime := DataAlt;
    ParamByName( 'USER_CAD' ).AsString   := UserCad;
    ParamByName( 'USER_ALT' ).AsString   := UserAlt;
    ParamByName( 'ESTADO' ).AsString     := Estado;
    ParamByName( 'UF' ).AsString         := UF;
    ParamByName( 'COD_PAIS' ).AsInteger  := Pais.Codigo;
  end;
end;

function TEstadosDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TEstado( Obj ).CopiarDados( TEstado( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TEstadosDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TEstado( List[ I ] ).Estado ) then
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
