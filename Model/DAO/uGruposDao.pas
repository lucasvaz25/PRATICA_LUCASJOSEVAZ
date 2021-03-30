unit uGruposDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UGrupos,
  Datasnap.DBClient,
  Vcl.StdCtrls;

type
  TGruposDao = class( DAO )
  private
    procedure FieldsToObj( var Value: TGrupos );
    procedure ObjToFields( var Value: TGrupos );
  public
    constructor Create;
    destructor Destroy;

    function Inserir( const Value: TObject ): Boolean; override;
    function Editar( const Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;

    procedure PopularLkpGrupo( DataSet: TClientDataSet );
    procedure PopularCbGrupo( Cb: TCombobox );
  end;

implementation

uses
  Vcl.Dialogs;
{ TGruposDao }

function TGruposDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TGrupos;
begin
  Result := nil;

  with DM.QryGrupos do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT * FROM GRUPOS ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE GRUPO LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY GRUPO ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TGrupos.Create;
        Self.FieldsToObj( Aux );
        Result.Add( Aux );

        Next;
      end;
    finally
      Close;
    end;

  end;
end;

constructor TGruposDao.Create;
begin
  inherited;
end;

function TGruposDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with DM.QryGrupos do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM GRUPOS WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TGruposDao.Destroy;
begin
  inherited;
end;

function TGruposDao.Editar( const Value: TObject ): Boolean;
var
  Grupo: TGrupos;
begin

  Grupo := TGrupos( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryGrupos do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE GRUPOS SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'GRUPO = :GRUPO, OBS = :OBS, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Grupo );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Grupo.Grupo + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TGruposDao.FieldsToObj( var Value: TGrupos );
begin
  with Value, DM.QryGrupos do
  begin
    Codigo  := FieldByName( 'CODIGO' ).AsInteger;
    DataCad := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad := FieldByName( 'USER_CAD' ).AsString;
    UserAlt := FieldByName( 'USER_ALT' ).AsString;
    Grupo   := FieldByName( 'GRUPO' ).AsString;
    Obs     := FieldByName( 'OBS' ).AsString;
  end;
end;

function TGruposDao.Inserir( const Value: TObject ): Boolean;
var
  Grupo: TGrupos;
begin
  Grupo := TGrupos( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryGrupos do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO GRUPOS ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'GRUPO, OBS, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':GRUPO, :OBS, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ')' );
      ObjToFields( Grupo );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Grupo.Grupo + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TGruposDao.ObjToFields( var Value: TGrupos );
begin
  with Value, DM.QryGrupos do
  begin
    ParamByName( 'CODIGO' ).AsInteger    := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime := DataAlt;
    ParamByName( 'USER_CAD' ).AsString   := UserCad;
    ParamByName( 'USER_ALT' ).AsString   := UserAlt;
    ParamByName( 'GRUPO' ).AsString      := Grupo;
    ParamByName( 'OBS' ).AsString        := Obs;
  end;
end;

procedure TGruposDao.PopularCbGrupo( Cb: TCombobox );
begin
  with DM.QryGrupos do
  begin
    SQL.Clear;

    SQL.Add( 'SELECT CODIGO, GRUPO FROM GRUPOS ' );
    SQL.Add( ' ORDER BY GRUPO ' );
    Open;
    while ( not Eof ) do
    begin
      Cb.Items.Add( FieldByName( 'grupo' ).AsString );
      // DataSet.FieldByName( 'codigo' ).AsInteger := FieldByName( 'codigo' ).AsInteger;

      Next;
    end;

  end;
end;

procedure TGruposDao.PopularLkpGrupo( DataSet: TClientDataSet );
begin
  DataSet.EmptyDataSet;
  with DM.QryGrupos do
  begin
    SQL.Clear;

    SQL.Add( 'SELECT CODIGO, GRUPO FROM GRUPOS ' );
    SQL.Add( ' ORDER BY GRUPO ' );
    Open;
    while ( not Eof ) do
    begin
      DataSet.Append;
      DataSet.FieldByName( 'codigo' ).AsInteger := FieldByName( 'codigo' ).AsInteger;
      DataSet.FieldByName( 'grupo' ).AsString   := FieldByName( 'grupo' ).AsString;
      DataSet.Post;

      Next;
    end;
    DataSet.EnableControls;
  end;

end;

function TGruposDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TGrupos( Obj ).CopiarDados( TGrupos( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TGruposDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TGrupos( List[ I ] ).Grupo ) then
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
