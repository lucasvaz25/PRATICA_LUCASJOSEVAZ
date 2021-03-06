unit uPaisesDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UPaises,
  FireDAC.Comp.Client;

type
  TPaisesDao = class( DAO )
  private
    Qry: TFDQuery;
    procedure FieldsToObj( var Value: TPais );
    procedure ObjToFields( var Value: TPais );
  public
    constructor Create;
    destructor Destroy;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;

{ TPaisesDao }

function TPaisesDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TPais;
begin
  Result := nil;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT * FROM PAISES ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE NOME LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY NOME ' );
    Open;
    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TPais.Create;
        Self.FieldsToObj( Aux );
        Result.Add( Aux );

        Next;
      end;
    finally
      Close;
    end;

  end;
end;

constructor TPaisesDao.Create;
begin
  inherited;
  if not Assigned( Qry ) then
    Qry := TFDQuery.Create( nil );

  Qry.Connection := Dm.Conexao;
end;

function TPaisesDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM PAISES WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TPaisesDao.Destroy;
begin
  Qry.Free;
  inherited;
end;

function TPaisesDao.Editar( var Value: TObject ): Boolean;
var
  Pais: TPais;
begin

  Pais := TPais( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE PAISES SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'NOME = :NOME, SIGLA = :SIGLA, DDI = :DDI, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Pais );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Pais.Nome + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TPaisesDao.ObjToFields( var Value: TPais );
begin
  with Value, Qry do
  begin
    ParamByName( 'CODIGO' ).AsInteger    := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime := DataAlt;
    ParamByName( 'USER_CAD' ).AsString   := UserCad;
    ParamByName( 'USER_ALT' ).AsString   := UserAlt;
    ParamByName( 'NOME' ).AsString       := Nome;
    ParamByName( 'SIGLA' ).AsString      := Sigla;
    ParamByName( 'DDI' ).AsString        := DDI;
  end;
end;

function TPaisesDao.Inserir( var Value: TObject ): Boolean;
var
  Pais: TPais;
begin
  Pais := TPais( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO PAISES ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'NOME, SIGLA, DDI, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':NOME, :SIGLA, :DDI, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ')' );
      ObjToFields( Pais );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Pais.Nome + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TPaisesDao.FieldsToObj( var Value: TPais );
begin
  with Value, Qry do
  begin
    Codigo  := FieldByName( 'CODIGO' ).AsInteger;
    DataCad := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad := FieldByName( 'USER_CAD' ).AsString;
    UserAlt := FieldByName( 'USER_ALT' ).AsString;
    Nome    := FieldByName( 'NOME' ).AsString;
    Sigla   := FieldByName( 'SIGLA' ).AsString;
    DDI     := FieldByName( 'DDI' ).AsString;
  end;
end;

function TPaisesDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
    List                 := Self.Consulta( Afilter );
    if List <> nil then
    begin
      Result := True;
      TPais( Obj ).CopiarDados( TPais( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

procedure TPaisesDao.SetDM( Value: TObject );
begin
  inherited;

end;

function TPaisesDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TPais( List[ I ] ).Nome ) then
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
