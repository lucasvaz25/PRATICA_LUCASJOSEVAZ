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
    FEndereco: string;
    procedure SetCidade( const Value: TCidade );
    procedure SetDeposito( const Value: string );
    procedure SetObs( const Value: string );
    procedure SetBairro( const Value: string );
    procedure SetEndereco( const Value: string );
    procedure SetNumero( const Value: string );
  protected
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Deposito: string read FDeposito write SetDeposito;
    property Obs: string read FObs write SetObs;
    property Endereco: string read FEndereco write SetEndereco;
    property Numero: string read FNumero write SetNumero;
    property Bairro: string read FBairro write SetBairro;
    property Cidade: TCidade read FCidade write SetCidade;

    procedure CopiarDados( Value: TDepositos );
  end;

implementation

{ TDepositos }

procedure TDepositos.CopiarDados( Value: TDepositos );
begin
  inherited CopiarDados( Value );
  FDeposito := Value.Deposito;
  FObs      := Value.Obs;
  FEndereco := Value.Endereco;
  FNumero   := Value.Numero;
  FBairro   := Value.Bairro;
  FCidade.CopiarDados( Value.Cidade );
end;

constructor TDepositos.Create;
begin
  inherited Create;
  FDeposito := '';
  FObs      := '';
  FEndereco := '';
  FNumero   := '';
  FBairro   := '';
  FCidade   := TCidade.Create;
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

procedure TDepositos.SetCidade( const Value: TCidade );
begin
  FCidade := Value;
end;

procedure TDepositos.SetDeposito( const Value: string );
begin
  FDeposito := Value;
end;

procedure TDepositos.SetEndereco( const Value: string );
begin
  FEndereco := Value;
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
