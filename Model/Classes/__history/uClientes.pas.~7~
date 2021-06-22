unit uClientes;

interface

uses
  UPessoa,
  UCondicaoPagamento,
  UEnum;

type
  TClientes = class( TPessoa )
  private
    FCondPagamento: TCondicaoPagamento;
    FTpPessoa: TTipoPessoa;
    procedure SetCondPagamento( const Value: TCondicaoPagamento );
    procedure SetTpPessoa( const Value: TTipoPessoa );
  protected
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property TpPessoa: TTipoPessoa read FTpPessoa write SetTpPessoa;
    property CondPagamento: TCondicaoPagamento read FCondPagamento write SetCondPagamento;

    procedure CopiarDados( Value: TClientes );
  end;

implementation

{ TClientes }

procedure TClientes.CopiarDados( Value: TClientes );
begin
  inherited CopiarDados( Value );
  FTpPessoa := Value.TpPessoa;
  FCondPagamento.CopiarDados( Value.CondPagamento );
end;

constructor TClientes.Create;
begin
  inherited Create;
  FTpPessoa      := TTpPIndefinido;
  FCondPagamento := TCondicaoPagamento.Create;
end;

destructor TClientes.Destroy;
begin
  FCondPagamento.Free;
  inherited Free;
end;

procedure TClientes.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TClientes.SetCondPagamento( const Value: TCondicaoPagamento );
begin
  FCondPagamento := Value;
end;

procedure TClientes.SetTpPessoa( const Value: TTipoPessoa );
begin
  FTpPessoa := Value;
end;

end.
