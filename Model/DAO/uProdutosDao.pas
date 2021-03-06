unit uProdutosDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  Uprodutos,
  FireDAC.Comp.Client;

type
  TprodutosDao = class( DAO )
  private
    Qry: TFDQuery;
    procedure FieldsToObj( var Value: Tprodutos );
    procedure ObjToFields( var Value: Tprodutos );
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
  UFornecedoresDao,
  UUnidadesDao,
  USubGruposDao,
  UFornecedores,
  UUnidades,
  USubGrupos,

  Data.DB,
  Vcl.Dialogs;
{ TprodutosDao }

function TprodutosDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: Tprodutos;
  Fornecedor: TFornecedores;
  Unidade: TUnidades;
  Subgrupo: TSubGrupos;
  FornecedorDao: TFornecedoresDao;
  UnidadeDao: TUnidadesDao;
  SubgrupoDao: TSubGruposDao;
begin
  Result := nil;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT P.* FROM PRODUTOS P ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE P.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE P.produto LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY P.produto ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := Tprodutos.Create;
        Self.FieldsToObj( Aux );

        if AFilter.RecuperarObj then
        begin

          if Aux.Fornecedor.Codigo > 0 then
          begin
            FornecedorDao := TFornecedoresDao.Create;
            try
              Fornecedor := Aux.Fornecedor;
              FornecedorDao.Recuperar( Aux.Fornecedor.Codigo, TObject( Fornecedor ) );
            finally
              FornecedorDao.Free;
            end;
          end;

          if Aux.Unidade.Codigo > 0 then
          begin
            UnidadeDao := TUnidadesDao.Create;
            try
              Unidade := Aux.Unidade;
              UnidadeDao.Recuperar( Aux.Unidade.Codigo, TObject( Unidade ) );
            finally
              UnidadeDao.Free;
            end;
          end;

          if Aux.SubGrupo.Codigo > 0 then
          begin
            SubGrupoDao := TSubGruposDao.Create;
            try
              SubGrupo := Aux.SubGrupo;
              SubGrupoDao.Recuperar( Aux.SubGrupo.Codigo, TObject( SubGrupo ) );
            finally
              SubGrupoDao.Free;
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

constructor TprodutosDao.Create;
begin
  inherited;

  if not Assigned( Qry ) then
    Qry := TFDQuery.Create( nil );

  Qry.Connection := Dm.Conexao;
end;

function TprodutosDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM produtos WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TprodutosDao.Destroy;
begin
  Qry.Free;
  inherited;
end;

function TprodutosDao.Editar( var Value: TObject ): Boolean;
var
  Produto: Tprodutos;
begin

  Produto := Tprodutos( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE produtos SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD, ' );
      SQL.Add( 'PRODUTO = :PRODUTO, ESTOQUE = :ESTOQUE, PRECO_VENDA = :PRECO_VENDA, ' );
      SQL.Add( 'PRECO_CUSTO = :PRECO_CUSTO, IMAGEM = :IMAGEM, COD_FORNECEDOR = :COD_FORNECEDOR, ' );
      SQL.Add( 'COD_UNIDADE = :COD_UNIDADE, COD_SUBGRUPO = :COD_SUBGRUPO, OBS = :OBS ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Produto );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Produto.Produto + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TprodutosDao.FieldsToObj( var Value: Tprodutos );
begin
  with Value, Qry do
  begin
    Codigo     := FieldByName( 'CODIGO' ).AsInteger;
    DataCad    := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt    := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad    := FieldByName( 'USER_CAD' ).AsString;
    UserAlt    := FieldByName( 'USER_ALT' ).AsString;
    Produto    := FieldByName( 'PRODUTO' ).AsString;
    Obs        := FieldByName( 'OBS' ).AsString;
    PrecoCusto := FieldByName( 'PRECO_CUSTO' ).AsCurrency;
    PrecoVenda := FieldByName( 'PRECO_VENDA' ).AsCurrency;
    Estoque    := FieldByName( 'ESTOQUE' ).AsInteger;

    if FieldByName( 'COD_FORNECEDOR' ).IsNull then
      Fornecedor.Codigo := 0
    else
      Fornecedor.Codigo := FieldByName( 'COD_FORNECEDOR' ).AsInteger;

    if FieldByName( 'COD_UNIDADE' ).IsNull then
      Unidade.Codigo := 0
    else
      Unidade.Codigo := FieldByName( 'COD_UNIDADE' ).AsInteger;

    if FieldByName( 'COD_SUBGRUPO' ).IsNull then
      SubGrupo.Codigo := 0
    else
      SubGrupo.Codigo := FieldByName( 'COD_SUBGRUPO' ).AsInteger;

    if ( FieldByName( 'IMAGEM' ).IsBlob ) then
      ( FieldByName( 'IMAGEM' ) as TBlobField ).SaveToStream( Imagem );

    // Imagem.LoadFromStream( TMemoryStream( FieldByName( 'IMAGEM' ).AsString ) );
  end;
end;

function TprodutosDao.Inserir( var Value: TObject ): Boolean;
var
  Produto: Tprodutos;
begin
  Produto := Tprodutos( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO PRODUTOS ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, USER_ALT, DATA_ALT, ' );
      SQL.Add( 'produto, estoque, preco_venda, PRECO_CUSTO, obs, ' );
      SQL.Add( 'cod_fornecedor, cod_unidade, cod_subgrupo, imagem ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, :USER_ALT, :DATA_ALT, ' );
      SQL.Add( ':produto, :estoque, :preco_venda, :PRECO_CUSTO, :obs, ' );
      SQL.Add( ':cod_fornecedor, :cod_unidade, :cod_subgrupo, :imagem ' );
      SQL.Add( ')' );
      ObjToFields( Produto );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Produto.Produto + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TprodutosDao.ObjToFields( var Value: Tprodutos );
begin
  with Value, Qry do
  begin
    ParamByName( 'CODIGO' ).AsInteger       := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime    := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime    := DataAlt;
    ParamByName( 'USER_CAD' ).AsString      := UserCad;
    ParamByName( 'USER_ALT' ).AsString      := UserAlt;
    ParamByName( 'produto' ).AsString       := Produto;
    ParamByName( 'OBS' ).AsString           := Obs;
    ParamByName( 'PRECO_VENDA' ).AsCurrency := PrecoVenda;
    ParamByName( 'PRECO_CUSTO' ).AsCurrency := PrecoCusto;
    ParamByName( 'ESTOQUE' ).AsInteger      := Estoque;
    ParamByName( 'IMAGEM' ).LoadFromStream( Imagem, FtBlob );

    if Fornecedor.Codigo = 0 then
      ParamByName( 'COD_FORNECEDOR' ).IsNull
    else
      ParamByName( 'COD_FORNECEDOR' ).AsInteger := Fornecedor.Codigo;

    if Unidade.Codigo = 0 then
      ParamByName( 'COD_UNIDADE' ).IsNull
    else
      ParamByName( 'COD_UNIDADE' ).AsInteger := Unidade.Codigo;

    if SubGrupo.Codigo = 0 then
      ParamByName( 'COD_SUBGRUPO' ).IsNull
    else
      ParamByName( 'COD_SUBGRUPO' ).AsInteger := SubGrupo.Codigo;

  end;
end;

function TprodutosDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      Tprodutos( Obj ).CopiarDados( Tprodutos( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TprodutosDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = Tprodutos( List[ I ] ).Produto ) then
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
