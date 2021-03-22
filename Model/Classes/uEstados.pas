unit uestados;

interface

uses
  UGeral,
  UPaises;

type
  TEstado = class( TGeral )
  private
    FUF: string;
    Festado: string;
    FPais: TPais;
    procedure Setestado( const Value: string );
    procedure SetPais( const Value: TPais );
    procedure SetUF( const Value: string );
  protected
  public
    constructor Create;
    destructor Destroy;

    property Estado: string read Festado write Setestado;
    property UF: string read FUF write SetUF;
    property Pais: TPais read FPais write SetPais;

    procedure CopiarDados( Value: TEstado );
  end;

implementation

{ TEstado }

procedure TEstado.CopiarDados( Value: TEstado );
begin
  inherited CopiarDados( Value );
  FUF     := Value.UF;
  Festado := Value.Estado;
  FPais.CopiarDados( Value.Pais );
end;

constructor TEstado.Create;
begin
  inherited Create;
  FUF     := '';
  Festado := '';
  FPais   := Tpais.Create;
end;

destructor TEstado.Destroy;
begin
  if Assigned( Self ) then
  begin
    FPais.Destroy;
    inherited Destroy;
  end;
end;

procedure TEstado.Setestado( const Value: string );
begin
  Festado := Value;
end;

procedure TEstado.SetPais( const Value: TPais );
begin
  FPais := Value;
end;

procedure TEstado.SetUF( const Value: string );
begin
  FUF := Value;
end;

end.
