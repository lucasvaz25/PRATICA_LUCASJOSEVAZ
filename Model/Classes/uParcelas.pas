unit uParcelas;

interface

uses
  UGeral,
  UFormasPagamentos;

type
  TParcelas = class( TGeral )
  private
    FFormaPagamento: TFormasPagamentos;
    FNumero: Integer;
    FDias: Integer;
    FPorcentagem: Real;
    FCodCondPgto: Integer;
    procedure SetDias( const Value: Integer );
    procedure SetFormaPagamento( const Value: TFormasPagamentos );
    procedure SetNumero( const Value: Integer );
    procedure SetPorcentagem( const Value: Real );
    procedure SetCodCondPgto( const Value: Integer );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Numero: Integer read FNumero write SetNumero;
    property Dias: Integer read FDias write SetDias;
    property Porcentagem: Real read FPorcentagem write SetPorcentagem;
    property FormaPagamento: TFormasPagamentos read FFormaPagamento write SetFormaPagamento;
    property CodCondPgto: Integer read FCodCondPgto write SetCodCondPgto;

    procedure CopiarDados( Value: TParcelas );

  end;

implementation

{ TParcelas }

procedure TParcelas.CopiarDados( Value: TParcelas );
begin
  inherited CopiarDados( Value );
  Fnumero      := Value.Numero;
  Fdias        := Value.Dias;
  FPorcentagem := Value.Porcentagem;
  FCodCondPgto := Value.CodCondPgto;
  FFormaPagamento.CopiarDados( Value.FormaPagamento );
end;

constructor TParcelas.Create;
begin
  inherited Create;
  FCodCondPgto    := 0;
  Fnumero         := 0;
  Fdias           := 0;
  FPorcentagem    := 0;
  FFormaPagamento := TFormasPagamentos.Create;
end;

destructor TParcelas.Destroy;
begin
  FFormaPagamento.Free;
  inherited;
end;

procedure TParcelas.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TParcelas.SetCodCondPgto( const Value: Integer );
begin
  FCodCondPgto := Value;
end;

procedure TParcelas.SetDias( const Value: Integer );
begin
  FDias := Value;
end;

procedure TParcelas.SetFormaPagamento( const Value: TFormasPagamentos );
begin
  FFormaPagamento := Value;
end;

procedure TParcelas.SetNumero( const Value: Integer );
begin
  FNumero := Value;
end;

procedure TParcelas.SetPorcentagem( const Value: Real );
begin
  FPorcentagem := Value;
end;

end.
