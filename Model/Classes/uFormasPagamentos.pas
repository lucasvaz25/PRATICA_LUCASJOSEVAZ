unit uFormasPagamentos;

interface

uses
  UGeral;

type
  TFormasPagamentos = class( TGeral )
  private
    FFormaPagamento: string;
    FObs: string;
    procedure SetFormaPagamento( const Value: string );
    procedure SetObs( const Value: string );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property FormaPagamento: string read FFormaPagamento write SetFormaPagamento;
    property Obs: string read FObs write SetObs;

    procedure CopiarDados( Value: TFormasPagamentos );
  end;

implementation

{ TFormasPagamentos }

procedure TFormasPagamentos.CopiarDados( Value: TFormasPagamentos );
begin
  inherited CopiarDados( Value );
  FFormaPagamento := Value.FormaPagamento;
  FObs            := Value.Obs;
end;

constructor TFormasPagamentos.Create;
begin
  inherited Create;
  FFormaPagamento := '';
  FObs            := '';
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

procedure TFormasPagamentos.SetObs( const Value: string );
begin
  FObs := Value;
end;

end.
