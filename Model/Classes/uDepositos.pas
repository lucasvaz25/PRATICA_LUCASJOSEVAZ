unit uDepositos;

interface

uses UGeral,
  UCidades;

type
  TDepositos = class( TGeral )
  private
    FObs: string;
    FDeposito: string;
    FCidade: TCidade;
    FBairro: string;
    FNumero: string;
    FLogradouro: string;
    FCEP: string;
    procedure SetCidade( const Value: TCidade );
    procedure SetDeposito( const Value: string );
    procedure SetObs( const Value: string );
    procedure SetBairro( const Value: string );
    procedure SetLogradouro( const Value: string );
    procedure SetNumero( const Value: string );
    procedure SetCEP( const Value: string );
  protected
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Deposito: string read FDeposito write SetDeposito;
    property Obs: string read FObs write SetObs;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Numero: string read FNumero write SetNumero;
    property Bairro: string read FBairro write SetBairro;
    property CEP: string read FCEP write SetCEP;
    property Cidade: TCidade read FCidade write SetCidade;

    procedure CopiarDados( Value: TDepositos );
  end;

implementation

{ TDepositos }

procedure TDepositos.CopiarDados( Value: TDepositos );
begin
  inherited CopiarDados( Value );
  FDeposito   := Value.Deposito;
  FObs        := Value.Obs;
  FLogradouro := Value.Logradouro;
  FNumero     := Value.Numero;
  FBairro     := Value.Bairro;
  FCEP        := Value.CEP;
  FCidade.CopiarDados( Value.Cidade );
end;

constructor TDepositos.Create;
begin
  inherited Create;
  FDeposito   := '';
  FObs        := '';
  FLogradouro := '';
  FNumero     := '';
  FBairro     := '';
  FCEP        := '';
  FCidade     := TCidade.Create;
end;

destructor TDepositos.Destroy;
begin
  FCidade.Free;
  inherited Destroy;
end;

procedure TDepositos.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TDepositos.SetBairro( const Value: string );
begin
  FBairro := Value;
end;

procedure TDepositos.SetCEP( const Value: string );
begin
  FCEP := Value;
end;

procedure TDepositos.SetCidade( const Value: TCidade );
begin
  FCidade := Value;
end;

procedure TDepositos.SetDeposito( const Value: string );
begin
  FDeposito := Value;
end;

procedure TDepositos.SetLogradouro( const Value: string );
begin
  FLogradouro := Value;
end;

procedure TDepositos.SetNumero( const Value: string );
begin
  FNumero := Value;
end;

procedure TDepositos.SetObs( const Value: string );
begin
  FObs := Value;
end;

end.
