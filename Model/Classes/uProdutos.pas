unit uProdutos;

interface

uses
  System.Classes,

  UGeral,
  UFornecedores,
  UUnidades,
  USubGrupos;

type
  TProdutos = class( TGeral )
  private
    FProduto: string;
    FObs: string;
    FPrecoCusto: Currency;
    FEstoque: Integer;
    FPrecoVenda: Currency;
    FImagem: TMemoryStream;
    FUnidade: TUnidades;
    FFornecedor: TFornecedores;
    FSubGrupo: TSubGrupos;
    procedure SetEstoque( const Value: Integer );
    procedure SetFornecedor( const Value: TFornecedores );
    procedure SetImagem( const Value: TMemoryStream );
    procedure SetObs( const Value: string );
    procedure SetPrecoCusto( const Value: Currency );
    procedure SetPrecoVenda( const Value: Currency );
    procedure SetProduto( const Value: string );
    procedure SetSubGrupo( const Value: TSubGrupos );
    procedure SetUnidade( const Value: TUnidades );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Produto: string read FProduto write SetProduto;
    property PrecoVenda: Currency read FPrecoVenda write SetPrecoVenda;
    property PrecoCusto: Currency read FPrecoCusto write SetPrecoCusto;
    property Estoque: Integer read FEstoque write SetEstoque;
    property Obs: string read FObs write SetObs;
    property Imagem: TMemoryStream read FImagem write SetImagem;

    property Fornecedor: TFornecedores read FFornecedor write SetFornecedor;
    property SubGrupo: TSubGrupos read FSubGrupo write SetSubGrupo;
    property Unidade: TUnidades read FUnidade write SetUnidade;

    procedure CopiarDados( Value: TProdutos );

  end;

implementation

{ TProdutos }

procedure TProdutos.CopiarDados( Value: TProdutos );
begin
  inherited CopiarDados( Value );

  FProduto    := Value.Produto;
  FObs        := Value.Obs;
  FPrecoCusto := Value.PrecoCusto;
  FEstoque    := Value.Estoque;
  FPrecoVenda := Value.PrecoVenda;
  FImagem     := Value.Imagem;

  FUnidade.CopiarDados( Value.Unidade );
  FFornecedor.CopiarDados( Value.Fornecedor );
  FSubGrupo.CopiarDados( Value.SubGrupo );

end;

constructor TProdutos.Create;
begin
  inherited;
  FProduto    := '';
  FObs        := '';
  FPrecoCusto := 0;
  FEstoque    := 0;
  FPrecoVenda := 0;

  FImagem     := TMemoryStream.Create;
  FUnidade    := TUnidades.Create;
  FFornecedor := TFornecedores.Create;
  FSubGrupo   := TSubGrupos.Create;
end;

destructor TProdutos.Destroy;
begin
  FImagem.Free;
  FUnidade.Free;
  FFornecedor.Free;
  FSubGrupo.Free;
  inherited;
end;

procedure TProdutos.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TProdutos.SetEstoque( const Value: Integer );
begin
  FEstoque := Value;
end;

procedure TProdutos.SetFornecedor( const Value: TFornecedores );
begin
  FFornecedor := Value;
end;

procedure TProdutos.SetImagem( const Value: TMemoryStream );
begin
  FImagem := Value;
end;

procedure TProdutos.SetObs( const Value: string );
begin
  FObs := Value;
end;

procedure TProdutos.SetPrecoCusto( const Value: Currency );
begin
  FPrecoCusto := Value;
end;

procedure TProdutos.SetPrecoVenda( const Value: Currency );
begin
  FPrecoVenda := Value;
end;

procedure TProdutos.SetProduto( const Value: string );
begin
  FProduto := Value;
end;

procedure TProdutos.SetSubGrupo( const Value: TSubGrupos );
begin
  FSubGrupo := Value;
end;

procedure TProdutos.SetUnidade( const Value: TUnidades );
begin
  FUnidade := Value;
end;

end.
