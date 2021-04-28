unit uUnidades;

interface

uses
  UGeral;

type
  TUnidades = class( TGeral )
  private
    FUnidade: string;
    procedure SetUnidade( const Value: string );
  protected
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Unidade: string read FUnidade write SetUnidade;

    procedure CopiarDados( Value: TUnidades );
  end;

implementation

{ TUnidades }

procedure TUnidades.CopiarDados( Value: TUnidades );
begin
  inherited CopiarDados( Value );
  FUnidade := Value.Unidade;
end;

constructor TUnidades.Create;
begin
  inherited Create;
  FUnidade := '';
end;

destructor TUnidades.Destroy;
begin
  inherited Destroy;
end;

procedure TUnidades.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TUnidades.SetUnidade( const Value: string );
begin
  FUnidade := Value;
end;

end.
