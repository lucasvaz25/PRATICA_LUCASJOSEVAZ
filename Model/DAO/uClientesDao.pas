unit uClientesDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UClientes,
  FireDAC.Comp.Client;

type
  TClientesDao = class( DAO )
  private
    Qry: TFDQuery;
    procedure FieldsToObj( var Value: TClientes );
    procedure ObjToFields( var Value: TClientes );
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
    function VerificaExisteCPF_CNPJ( Str: string ): Boolean;
  end;

implementation

uses
  UEnum,
  UCondicaoPagamento,
  UCondicaoPagamentoDao,
  Vcl.Dialogs;
{ TClientesDao }

function TClientesDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TClientes;
  Condpgto: TCondicaoPagamento;
  CondpgtoDao: TCondicaoPagamentoDao;
begin
  Result := nil;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT C.*, CI.CODIGO, CI.CIDADE, E.CODIGO, E.UF FROM Clientes C ' );
    SQL.Add( 'LEFT JOIN CIDADES CI ON CI.CODIGO = C.COD_CIDADE ' );
    SQL.Add( 'LEFT JOIN ESTADOS E ON E.CODIGO = CI.COD_ESTADO ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE C.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE C.Cliente LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCCPF_CNPJ:
        begin
          SQL.Add( 'WHERE C.CPF = ' + QuotedStr( AFilter.Parametro ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY C.Cliente ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TClientes.Create;
        Self.FieldsToObj( Aux );
        Aux.Cidade.Cidade    := FieldByName( 'CIDADE' ).AsString;
        Aux.Cidade.Estado.UF := FieldByName( 'UF' ).AsString;

        if Afilter.RecuperarObj then
        begin
          if Aux.CondPagamento.Codigo > 0 then
          begin
            CondpgtoDao := TCondicaoPagamentoDao.Create;
            try
              Condpgto := Aux.CondPagamento;
              CondpgtoDao.Recuperar( Condpgto.Codigo, TObject( Condpgto ) );
            finally
              CondpgtoDao.Free;
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

constructor TClientesDao.Create;
begin
  inherited;

  if not Assigned( Qry ) then
    Qry := TFDQuery.Create( nil );

  Qry.Connection := Dm.Conexao;
end;

function TClientesDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM Clientes WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TClientesDao.Destroy;
begin
  Qry.Free;
  inherited;
end;

function TClientesDao.Editar( var Value: TObject ): Boolean;
var
  Cliente: TClientes;
begin

  Cliente := TClientes( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE CLIENTES SET ' );
      SQL.Add( 'CODIGO	= :CODIGO, DATA_CAD = :DATA_CAD, DATA_ALT = :DATA_ALT, ' );
      SQL.Add( 'USER_CAD = :USER_CAD, USER_ALT = :USER_ALT, CLIENTE = :CLIENTE, ' );
      SQL.Add( 'APELIDO = :APELIDO, CEP = :CEP, LOGRADOURO = :LOGRADOURO, NUMERO = :NUMERO, ' );
      SQL.Add( 'BAIRRO = :BAIRRO, COD_CIDADE = :COD_CIDADE, TELEFONE = :TELEFONE, ' );
      SQL.Add( 'EMAIL = :EMAIL, CPF = :CPF, RG = :RG, SEXO = :SEXO, DATA_NASC = :DATA_NASC, ' );
      SQL.Add( 'TIPO_PESSOA = :TIPO_PESSOA, COD_CONDPAG = :COD_CONDPAG ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Cliente );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Cliente.Nome + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TClientesDao.FieldsToObj( var Value: TClientes );
begin
  with Value, Qry do
  begin
    Codigo               := FieldByName( 'CODIGO' ).AsInteger;
    DataCad              := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt              := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad              := FieldByName( 'USER_CAD' ).AsString;
    UserAlt              := FieldByName( 'USER_ALT' ).AsString;
    Nome                 := FieldByName( 'Cliente' ).AsString;
    Endereco             := FieldByName( 'logradouro' ).AsString;
    Numero               := FieldByName( 'numero' ).AsString;
    Bairro               := FieldByName( 'bairro' ).AsString;
    Apelido              := FieldByName( 'APELIDO' ).AsString;
    CEP                  := FieldByName( 'CEP' ).AsString;
    Telefone             := FieldByName( 'TELEFONE' ).AsString;
    Email                := FieldByName( 'EMAIL' ).AsString;
    CPF                  := FieldByName( 'CPF' ).AsString;
    RG                   := FieldByName( 'RG' ).AsString;
    Sexo                 := TSexo( FieldByName( 'SEXO' ).AsInteger );
    Cidade.Codigo        := FieldByName( 'cod_cidade' ).AsInteger;
    DataNasc             := FieldByName( 'DATA_NASC' ).AsDateTime;
    CondPagamento.Codigo := FieldByName( 'cod_condPag' ).AsInteger;
    TpPessoa             := TTipoPessoa( FieldByName( 'TIPO_PESSOA' ).AsInteger );
  end;
end;

function TClientesDao.Inserir( var Value: TObject ): Boolean;
var
  Cliente: TClientes;
begin
  Cliente := TClientes( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO CLIENTES ( ' );
      SQL.Add( 'CODIGO,	DATA_CAD, DATA_ALT, USER_CAD, ' );
      SQL.Add( 'USER_ALT, CLIENTE, APELIDO, CEP, ' );
      SQL.Add( 'LOGRADOURO, NUMERO, BAIRRO, COD_CIDADE, ' );
      SQL.Add( 'TELEFONE, EMAIL, CPF, RG, SEXO, DATA_NASC, ' );
      SQL.Add( 'TIPO_PESSOA, COD_CONDPAG ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :DATA_ALT, :USER_CAD, ' );
      SQL.Add( ':USER_ALT, :CLIENTE, :APELIDO, :CEP, ' );
      SQL.Add( ':LOGRADOURO, :NUMERO, :BAIRRO, :COD_CIDADE, ' );
      SQL.Add( ':TELEFONE, :EMAIL, :CPF, :RG, :SEXO, :DATA_NASC, ' );
      SQL.Add( ':TIPO_PESSOA, :COD_CONDPAG ' );
      SQL.Add( ')' );
      ObjToFields( Cliente );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Cliente.Nome + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TClientesDao.ObjToFields( var Value: TClientes );
begin
  with Value, Qry do
  begin
    ParamByName( 'CODIGO' ).AsInteger      := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime   := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime   := DataAlt;
    ParamByName( 'USER_CAD' ).AsString     := UserCad;
    ParamByName( 'USER_ALT' ).AsString     := UserAlt;
    ParamByName( 'CLIENTE' ).AsString      := Nome;
    ParamByName( 'APELIDO' ).AsString      := Apelido;
    ParamByName( 'CEP' ).AsString          := CEP;
    ParamByName( 'LOGRADOURO' ).AsString   := Endereco;
    ParamByName( 'BAIRRO' ).AsString       := Bairro;
    ParamByName( 'COD_CIDADE' ).AsInteger  := Cidade.Codigo;
    ParamByName( 'TELEFONE' ).AsString     := Telefone;
    ParamByName( 'EMAIL' ).AsString        := Email;
    ParamByName( 'CPF' ).AsString          := CPF;
    ParamByName( 'RG' ).AsString           := RG;
    ParamByName( 'SEXO' ).AsInteger        := Integer( Sexo );
    ParamByName( 'DATA_NASC' ).AsDateTime  := DataNasc;
    ParamByName( 'TIPO_PESSOA' ).AsInteger := Integer( TpPessoa );
    ParamByName( 'COD_CONDPAG' ).AsInteger := CondPagamento.Codigo;

    if not( Numero = '' ) then
      ParamByName( 'NUMERO' ).AsInteger := Numero.ToInteger
    else
      ParamByName( 'NUMERO' ).IsNull;

  end;
end;

function TClientesDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TClientes( Obj ).CopiarDados( TClientes( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TClientesDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TClientes( List[ I ] ).Nome ) then
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

function TClientesDao.VerificaExisteCPF_CNPJ( Str: string ): Boolean;
var
  List: Tobjectlist;
  Afilter: TFilterSearch;
  I: Integer;
begin
  Result  := False;
  List    := Tobjectlist.Create;
  Afilter := TFilterSearch.Create;
  try
    Afilter.TipoConsulta := TpCCPF_CNPJ;
    Afilter.Parametro    := Str;
    List                 := Self.Consulta( Afilter );
    if List <> nil then
    begin
      for I := 0 to List.Count - 1 do
        if ( Str = TClientes( List[ I ] ).CPF ) then
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
