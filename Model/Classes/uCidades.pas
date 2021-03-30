unit uCidades;

interface

uses
  UGeral,
  UEstados;

type
  TCidade = class( TGeral )
  private
    FDDD: string;
    FCidade: string;
    FEstado: TEstado;
    procedure SetDDD( const Value: string );
    procedure SetEstado( const Value: TEstado );
    procedure SetCidade( const Value: string );
  protected
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Cidade: string read FCidade write SetCidade;
    property DDD: string read FDDD write SetDDD;
    property Estado: TEstado read FEstado write SetEstado;

    procedure CopiarDados( Value: TCidade );
  end;

implementation

{ TCidade }

procedure TCidade.CopiarDados( Value: TCidade );
begin
  inherited CopiarDados( Value );
  FCidade := Value.Cidade;
  FDDD    := Value.DDD;
  FEstado.CopiarDados( Value.Estado );
end;

constructor TCidade.Create;
begin
  inherited Create;
  FCidade := '';
  FDDD    := '';
  FEstado := TEstado.Create;
end;

destructor TCidade.Destroy;
begin
  FEstado.Destroy;
  inherited Destroy;
end;

procedure TCidade.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TCidade.SetDDD( const Value: string );
begin
  FDDD := Value;
end;

procedure TCidade.SetEstado( const Value: TEstado );
begin
  FEstado := Value;
end;

procedure TCidade.SetCidade( const Value: string );
begin
  FCidade := Value;
end;

end.
