unit uSubGruposDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  USubGrupos,
  UGrupos,
  UGruposDao;

type
  TSubGruposDao = class( DAO )
  private
    procedure FieldsToObj( var Value: TSubGrupos );
    procedure ObjToFields( var Value: TSubGrupos );
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
{ TSubGruposDao }

function TSubGruposDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TSubGrupos;
  Grupo: TGrupos;
  GrupoDao: TGruposDao;
begin
  Result := nil;

  with DM.QrySubgrupos do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT S.*, G.GRUPO FROM SUBGRUPOS S ' );
    SQL.Add( 'LEFT JOIN GRUPOS G ON G.CODIGO = S.COD_GRUPO ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE S.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE S.SUBGRUPO LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY S.SUBGRUPO ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TSubGrupos.Create;
        Self.FieldsToObj( Aux );
        Result.Add( Aux );
        Aux.Grupo.Grupo := FieldByName( 'GRUPO' ).AsString;

        if AFilter.RecuperarObj then
        begin
          if Aux.Grupo.Codigo > 0 then
          begin
            GrupoDao := TGruposDao.Create;
            Grupo    := TGrupos.Create;
            try
              if GrupoDao.Recuperar( Aux.Grupo.Codigo, TObject( Grupo ) ) then
                Aux.Grupo.CopiarDados( Grupo );
            finally
              Grupo.Free;
              GrupoDao.Destroy;
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

constructor TSubGruposDao.Create;
begin
  inherited;
end;

function TSubGruposDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with DM.QrySubgrupos do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM SUBGRUPOS WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TSubGruposDao.Destroy;
begin
  inherited;
end;

function TSubGruposDao.Editar( var Value: TObject ): Boolean;
var
  SubGrupo: TSubGrupos;
begin

  SubGrupo := TSubGrupos( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QrySubgrupos do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE SUBGRUPOS SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'SUBGRUPO = :SUBGRUPO, OBS = :OBS, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD, ' );
      SQL.Add( 'COD_GRUPO = :COD_GRUPO ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( SubGrupo );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + SubGrupo.SubGrupo + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TSubGruposDao.FieldsToObj( var Value: TSubGrupos );
begin
  with Value, DM.QrySubgrupos do
  begin
    Codigo       := FieldByName( 'CODIGO' ).AsInteger;
    DataCad      := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt      := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad      := FieldByName( 'USER_CAD' ).AsString;
    UserAlt      := FieldByName( 'USER_ALT' ).AsString;
    Grupo.Codigo := FieldByName( 'COD_GRUPO' ).AsInteger;
    Subgrupo     := FieldByName( 'SUBGRUPO' ).AsString;
    Obs          := FieldByName( 'OBS' ).AsString;
  end;
end;

function TSubGruposDao.Inserir( var Value: TObject ): Boolean;
var
  SubGrupo: TSubGrupos;
begin
  SubGrupo := TSubGrupos( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QrySubgrupos do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO SUBGRUPOS ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'SUBGRUPO, OBS, COD_GRUPO, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':SUBGRUPO, :OBS, :COD_GRUPO, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ')' );
      ObjToFields( SubGrupo );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + SubGrupo.SubGrupo + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TSubGruposDao.ObjToFields( var Value: TSubGrupos );
begin
  with Value, DM.QrySubgrupos do
  begin
    ParamByName( 'CODIGO' ).AsInteger    := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime := DataAlt;
    ParamByName( 'USER_CAD' ).AsString   := UserCad;
    ParamByName( 'USER_ALT' ).AsString   := UserAlt;
    ParamByName( 'SUBGRUPO' ).AsString   := Subgrupo;
    ParamByName( 'COD_GRUPO' ).AsInteger := Grupo.Codigo;
    ParamByName( 'OBS' ).AsString        := Obs;
  end;
end;

function TSubGruposDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TSubGrupos( Obj ).CopiarDados( TSubGrupos( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TSubGruposDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TSubGrupos( List[ I ] ).Subgrupo ) then
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
