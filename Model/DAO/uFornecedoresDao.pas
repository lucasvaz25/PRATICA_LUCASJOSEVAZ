unit uFornecedoresDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UFornecedores,
  FireDAC.Comp.Client;

type
  TFornecedoresDao = class( DAO )
  private
    Qry: TFDQuery;
    procedure FieldsToObj( var Value: TFornecedores );
    procedure ObjToFields( var Value: TFornecedores );
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
{ TFornecedoresDao }

function TFornecedoresDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TFornecedores;
  Condpgto: TCondicaoPagamento;
  CondpgtoDao: TCondicaoPagamentoDao;
begin
  Result := nil;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT F.*, C.CODIGO, C.CIDADE, C.COD_ESTADO, E.UF FROM Fornecedores F ' );
    SQL.Add( 'LEFT JOIN CIDADES C ON C.CODIGO = F.COD_CIDADE ' );
    SQL.Add( 'LEFT JOIN ESTADOS E ON E.CODIGO = C.COD_ESTADO ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE F.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE F.Fornecedor LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCCPF_CNPJ:
        begin
          SQL.Add( 'WHERE F.CPF = ' + QuotedStr( AFilter.Parametro ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY F.Fornecedor ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TFornecedores.Create;
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

constructor TFornecedoresDao.Create;
begin
  inherited;

  if not Assigned( Qry ) then
    Qry := TFDQuery.Create( nil );

  Qry.Connection := Dm.Conexao;
end;

function TFornecedoresDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM Fornecedores WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TFornecedoresDao.Destroy;
begin
  Qry.Free;
  inherited;
end;

function TFornecedoresDao.Editar( var Value: TObject ): Boolean;
var
  Fornecedor: TFornecedores;
begin

  Fornecedor := TFornecedores( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE Fornecedores SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_CAD = :DATA_CAD, DATA_ALT = :DATA_ALT, ' );
      SQL.Add( 'USER_CAD = :USER_CAD, USER_ALT = :USER_ALT, CEP = :CEP, ' );
      SQL.Add( 'NUMERO = :NUMERO, bairro = :bairro, NOME_FANTASIA = :NOME_FANTASIA, ' );
      SQL.Add( 'logradouro = :logradouro, Fornecedor = :Fornecedor, RG = :RG, ' );
      SQL.Add( 'CPF = :CPF, DATA_NASC = :DATA_NASC, ' );
      SQL.Add( 'CONTATO = :CONTATO, SITE = :SITE, TIPO_PESSOA = :TIPO_PESSOA, ' );
      SQL.Add( 'EMAIL = :EMAIL, TELEFONE = :TELEFONE, cod_condPag = :cod_condPag, ' );
      SQL.Add( ' SEXO = :SEXO, cod_cidade = :cod_cidade ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Fornecedor );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Fornecedor.Nome + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TFornecedoresDao.FieldsToObj( var Value: TFornecedores );
begin
  with Value, Qry do
  begin
    Codigo               := FieldByName( 'CODIGO' ).AsInteger;
    DataCad              := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt              := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad              := FieldByName( 'USER_CAD' ).AsString;
    UserAlt              := FieldByName( 'USER_ALT' ).AsString;
    Nome                 := FieldByName( 'Fornecedor' ).AsString;
    Endereco             := FieldByName( 'logradouro' ).AsString;
    Numero               := FieldByName( 'NUMERO' ).AsString;
    Bairro               := FieldByName( 'bairro' ).AsString;
    Apelido              := FieldByName( 'NOME_FANTASIA' ).AsString;
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
    Contato              := FieldByName( 'CONTATO' ).AsString;
    Site                 := FieldByName( 'SITE' ).AsString;
  end;
end;

function TFornecedoresDao.Inserir( var Value: TObject ): Boolean;
var
  Fornecedor: TFornecedores;
begin
  Fornecedor := TFornecedores( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO Fornecedores ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, DATA_ALT, USER_CAD, USER_ALT, ' );
      SQL.Add( 'Fornecedor, logradouro, NUMERO, bairro, NOME_FANTASIA, CEP, ' );
      SQL.Add( 'TELEFONE, EMAIL, CPF, RG, CONTATO, SITE, ' );
      SQL.Add( 'DATA_NASC, cod_CondPag, TIPO_PESSOA, SEXO, cod_cidade ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :DATA_ALT, :USER_CAD, :USER_ALT, ' );
      SQL.Add( ':Fornecedor, :logradouro, :NUMERO, :bairro, :NOME_FANTASIA, :CEP, ' );
      SQL.Add( ':TELEFONE, :EMAIL, :CPF, :RG, :CONTATO, :SITE, ' );
      SQL.Add( ':DATA_NASC, :cod_CondPag, :TIPO_PESSOA, :SEXO, :cod_cidade ' );
      SQL.Add( ')' );
      ObjToFields( Fornecedor );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Fornecedor.Nome + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TFornecedoresDao.ObjToFields( var Value: TFornecedores );
begin
  with Value, Qry do
  begin
    ParamByName( 'CODIGO' ).AsInteger       := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime    := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime    := DataAlt;
    ParamByName( 'USER_CAD' ).AsString      := UserCad;
    ParamByName( 'USER_ALT' ).AsString      := UserAlt;
    ParamByName( 'Fornecedor' ).AsString    := Nome;
    ParamByName( 'logradouro' ).AsString    := Endereco;
    ParamByName( 'NUMERO' ).AsString        := Numero;
    ParamByName( 'bairro' ).AsString        := Bairro;
    ParamByName( 'NOME_FANTASIA' ).AsString := Apelido;
    ParamByName( 'CEP' ).AsString           := CEP;
    ParamByName( 'TELEFONE' ).AsString      := Telefone;
    ParamByName( 'EMAIL' ).AsString         := Email;
    ParamByName( 'CPF' ).AsString           := CPF;
    ParamByName( 'RG' ).AsString            := RG;
    ParamByName( 'SEXO' ).AsInteger         := Integer( Sexo );
    ParamByName( 'cod_cidade' ).AsInteger   := Cidade.Codigo;
    ParamByName( 'DATA_NASC' ).AsDateTime   := DataNasc;
    ParamByName( 'cod_condPag' ).AsInteger  := CondPagamento.Codigo;
    ParamByName( 'TIPO_PESSOA' ).AsInteger  := Integer( TpPessoa );
    ParamByName( 'CONTATO' ).AsString       := Contato;
    ParamByName( 'SITE' ).AsString          := Site;
  end;
end;

function TFornecedoresDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TFornecedores( Obj ).CopiarDados( TFornecedores( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TFornecedoresDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TFornecedores( List[ I ] ).Nome ) then
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

function TFornecedoresDao.VerificaExisteCPF_CNPJ( Str: string ): Boolean;
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
        if ( Str = TFornecedores( List[ I ] ).CPF ) then
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
