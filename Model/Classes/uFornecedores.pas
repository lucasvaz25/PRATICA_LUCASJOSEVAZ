unit uFornecedores;

interface

uses
  UPessoa,
  UCondicaoPagamento,
  UEnum;

type
  TFornecedores = class( TPessoa )
  private
    FTpPessoa: TTipoPessoa;
    FCondPagamento: TCondicaoPagamento;
    procedure SetTpPessoa( const Value: TTipoPessoa );
    procedure SetCondPagamento( const Value: TCondicaoPagamento );
  protected
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property TpPessoa: TTipoPessoa read FTpPessoa write SetTpPessoa;
    property CondPagamento: TCondicaoPagamento read FCondPagamento write SetCondPagamento;

    procedure CopiarDados( Value: TFornecedores );
  end;

implementation

{ TFornecedores }

procedure TFornecedores.CopiarDados( Value: TFornecedores );
begin
  inherited CopiarDados( Value );
  FTpPessoa := Value.TpPessoa;
  FCondPagamento.CopiarDados( Value.CondPagamento );
end;

constructor TFornecedores.Create;
begin
  inherited Create;
  FTpPessoa      := TTpPIndefinido;
  FCondPagamento := TCondicaoPagamento.Create;
end;

destructor TFornecedores.Destroy;
begin
  FCondPagamento.Free;
  inherited Free;
end;

procedure TFornecedores.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TFornecedores.SetCondPagamento( const Value: TCondicaoPagamento );
begin
  FCondPagamento := Value;
end;

procedure TFornecedores.SetTpPessoa( const Value: TTipoPessoa );
begin
  FTpPessoa := Value;
end;

end.
