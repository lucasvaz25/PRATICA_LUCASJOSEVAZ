unit uDepositosDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UDepositos,
  FireDAC.Comp.Client;

type
  TDepositosDao = class( DAO )
  private
    Qry: TFDQuery;
    procedure FieldsToObj( var Value: TDepositos );
    procedure ObjToFields( var Value: TDepositos );
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
{ TDepositosDao }

function TDepositosDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TDepositos;
begin
  Result := nil;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT D.*, C.CIDADE, C.COD_ESTADO, E.UF FROM Depositos D ' );
    SQL.Add( 'LEFT JOIN CIDADES C ON C.CODIGO = D.COD_CIDADE ' );
    SQL.Add( 'LEFT JOIN ESTADOS E ON E.CODIGO = C.COD_ESTADO ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE D.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE D.Deposito LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY D.Deposito ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TDepositos.Create;
        Self.FieldsToObj( Aux );
        Aux.Cidade.Cidade    := FieldByName( 'CIDADE' ).AsString;
        Aux.Cidade.Estado.UF := FieldByName( 'UF' ).AsString;
        Result.Add( Aux );

        Next;
      end;
    finally
      Close;
    end;

  end;
end;

constructor TDepositosDao.Create;
begin
  inherited;

  if not Assigned( Qry ) then
    Qry := TFDQuery.Create( nil );

  Qry.Connection := Dm.Conexao;
end;

function TDepositosDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM Depositos WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TDepositosDao.Destroy;
begin
  Qry.Free;
  inherited;
end;

function TDepositosDao.Editar( var Value: TObject ): Boolean;
var
  Deposito: TDepositos;
begin

  Deposito := TDepositos( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE Depositos SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'logradouro = :logradouro, num = :num, bairro = :bairro, obs = :obs, cod_cidade = :cod_cidade, ' );
      SQL.Add( 'Deposito = :Deposito, CEP = :CEP,DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Deposito );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Deposito.Deposito + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TDepositosDao.FieldsToObj( var Value: TDepositos );
begin
  with Value, Qry do
  begin
    Codigo        := FieldByName( 'CODIGO' ).AsInteger;
    DataCad       := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt       := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad       := FieldByName( 'USER_CAD' ).AsString;
    UserAlt       := FieldByName( 'USER_ALT' ).AsString;
    Deposito      := FieldByName( 'Deposito' ).AsString;
    Logradouro    := FieldByName( 'logradouro' ).AsString;
    Numero        := FieldByName( 'num' ).AsString;
    Bairro        := FieldByName( 'bairro' ).AsString;
    CEP           := FieldByName( 'CEP' ).AsString;
    Cidade.Codigo := FieldByName( 'cod_cidade' ).AsInteger;
    Obs           := FieldByName( 'OBS' ).AsString;
  end;
end;

function TDepositosDao.Inserir( var Value: TObject ): Boolean;
var
  Deposito: TDepositos;
begin
  Deposito := TDepositos( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO Depositos ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'Deposito, logradouro, num, bairro, cod_cidade, obs, CEP, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':Deposito, :logradouro, :num, :bairro, :cod_cidade, :obs, :CEP, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ')' );
      ObjToFields( Deposito );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Deposito.Deposito + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TDepositosDao.ObjToFields( var Value: TDepositos );
begin
  with Value, Qry do
  begin
    ParamByName( 'CODIGO' ).AsInteger     := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime  := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime  := DataAlt;
    ParamByName( 'USER_CAD' ).AsString    := UserCad;
    ParamByName( 'USER_ALT' ).AsString    := UserAlt;
    ParamByName( 'Deposito' ).AsString    := Deposito;
    ParamByName( 'logradouro' ).AsString  := Logradouro;
    ParamByName( 'num' ).AsString         := Numero;
    ParamByName( 'bairro' ).AsString      := Bairro;
    ParamByName( 'Obs' ).AsString         := Obs;
    ParamByName( 'CEP' ).AsString         := CEP;
    ParamByName( 'cod_cidade' ).AsInteger := Cidade.Codigo;
  end;
end;

function TDepositosDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TDepositos( Obj ).CopiarDados( TDepositos( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TDepositosDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TDepositos( List[ I ] ).Deposito ) then
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
