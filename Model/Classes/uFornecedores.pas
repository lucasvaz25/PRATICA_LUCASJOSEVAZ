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
    FSite: string;
    FContato: string;
    procedure SetTpPessoa( const Value: TTipoPessoa );
    procedure SetCondPagamento( const Value: TCondicaoPagamento );
    procedure SetContato( const Value: string );
    procedure SetSite( const Value: string );
  protected
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property TpPessoa: TTipoPessoa read FTpPessoa write SetTpPessoa;
    property CondPagamento: TCondicaoPagamento read FCondPagamento write SetCondPagamento;
    property Contato: string read FContato write SetContato;
    property Site: string read FSite write SetSite;

    procedure CopiarDados( Value: TFornecedores );
  end;

implementation

{ TFornecedores }

procedure TFornecedores.CopiarDados( Value: TFornecedores );
begin
  inherited CopiarDados( Value );
  FContato  := Value.Contato;
  FSite     := Value.Site;
  FTpPessoa := Value.TpPessoa;
  FCondPagamento.CopiarDados( Value.CondPagamento );
end;

constructor TFornecedores.Create;
begin
  inherited Create;
  FContato       := '';
  FSite          := '';
  FTpPessoa      := TTpPIndefinido;
  FCondPagamento := TCondicaoPagamento.Create;
end;

destructor TFornecedores.Destroy;
begin
  FCondPagamento.Free;
  inherited;
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

procedure TFornecedores.SetContato( const Value: string );
begin
  FContato := Value;
end;

procedure TFornecedores.SetSite( const Value: string );
begin
  FSite := Value;
end;

procedure TFornecedores.SetTpPessoa( const Value: TTipoPessoa );
begin
  FTpPessoa := Value;
end;

end.
