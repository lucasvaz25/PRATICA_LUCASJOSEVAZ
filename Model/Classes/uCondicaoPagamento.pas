unit uCondicaoPagamento;

interface

uses
  System.Generics.Collections,
  UGeral,
  UParcelas;

type
  TCondicaoPagamento = class( TGeral )
  private
    FCondPag: string;
    FDesconto: Real;
    FMulta: Real;
    FParcelas: Integer;
    FListaParcelas: TObjectList<TParcelas>;
    FTxJuros: Real;
    procedure SetCondPag( const Value: string );
    procedure SetDesconto( const Value: Real );
    procedure SetListaParcelas( const Value: TObjectList<TParcelas> );
    procedure SetMulta( const Value: Real );
    procedure SetParcelas( const Value: Integer );
    procedure SetTxJuros( const Value: Real );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property CondPag: string read FCondPag write SetCondPag;
    property Parcelas: Integer read FParcelas write SetParcelas;
    property TxJuros: Real read FTxJuros write SetTxJuros;
    property Multa: Real read FMulta write SetMulta;
    property Desconto: Real read FDesconto write SetDesconto;
    property ListaParcelas: TObjectList<TParcelas> read FListaParcelas write SetListaParcelas;

    procedure CopiarDados( Value: TCondicaoPagamento );
  end;

implementation

{ TCondicaoPagamento }

procedure TCondicaoPagamento.CopiarDados( Value: TCondicaoPagamento );
begin
  inherited CopiarDados( Value );
  FCondPag       := Value.CondPag;
  FParcelas      := Value.Parcelas;
  FTxJuros       := Value.TxJuros;
  FDesconto      := Value.Desconto;
  FMulta         := Value.Multa;
  FListaParcelas := Value.ListaParcelas;
end;

constructor TCondicaoPagamento.Create;
begin
  inherited Create;
  FCondPag       := '';
  FParcelas      := 0;
  FTxJuros       := 0;
  FDesconto      := 0;
  FMulta         := 0;
  FListaParcelas := TObjectList<TParcelas>.Create;
end;

destructor TCondicaoPagamento.Destroy;
begin
  FListaParcelas.Free;
  inherited;
end;

procedure TCondicaoPagamento.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TCondicaoPagamento.SetCondPag( const Value: string );
begin
  FCondPag := Value;
end;

procedure TCondicaoPagamento.SetDesconto( const Value: Real );
begin
  FDesconto := Value;
end;

procedure TCondicaoPagamento.SetListaParcelas(
            const Value: TObjectList<TParcelas> );
begin
  FListaParcelas := Value;
end;

procedure TCondicaoPagamento.SetMulta( const Value: Real );
begin
  FMulta := Value;
end;

procedure TCondicaoPagamento.SetParcelas( const Value: Integer );
begin
  FParcelas := Value;
end;

procedure TCondicaoPagamento.SetTxJuros( const Value: Real );
begin
  FTxJuros := Value;
end;

end.
