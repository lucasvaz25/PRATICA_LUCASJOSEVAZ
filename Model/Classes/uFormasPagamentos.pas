unit uFormasPagamentos;

interface

uses
  UGeral;

type
  TFormasPagamentos = class( TGeral )
  private
    FFormaPagamento: string;
    procedure SetFormaPagamento( const Value: string );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property FormaPagamento: string read FFormaPagamento write SetFormaPagamento;

    procedure CopiarDados( Value: TFormasPagamentos );
  end;

implementation

{ TFormasPagamentos }

procedure TFormasPagamentos.CopiarDados( Value: TFormasPagamentos );
begin
  inherited CopiarDados( Value );
  FFormaPagamento := Value.FormaPagamento;
end;

constructor TFormasPagamentos.Create;
begin
  inherited Create;
end;

destructor TFormasPagamentos.Destroy;
begin
  inherited;
end;

procedure TFormasPagamentos.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TFormasPagamentos.SetFormaPagamento( const Value: string );
begin
  FFormaPagamento := Value;
end;

end.