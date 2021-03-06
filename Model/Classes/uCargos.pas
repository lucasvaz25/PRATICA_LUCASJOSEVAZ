unit uCargos;

interface

uses
  UGeral,
  UDepartamentos;

type
  TCargos = class( TGeral )
  private
    FDepartamento: TDepartamentos;
    FCargo: string;
    FIsObrigatorioCNH: Boolean;
    procedure SetCargo( const Value: string );
    procedure SetDepartamento( const Value: TDepartamentos );
    procedure SetIsObrigatorioCNH( const Value: Boolean );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Cargo: string read FCargo write SetCargo;
    property Departamento: TDepartamentos read FDepartamento write SetDepartamento;
    property IsObrigatorioCNH: Boolean read FIsObrigatorioCNH write SetIsObrigatorioCNH;

    procedure CopiarDados( Value: TCargos );
  end;

implementation

{ TCargos }

procedure TCargos.CopiarDados( Value: TCargos );
begin
  inherited CopiarDados( Value );
  FCargo            := Value.Cargo;
  FIsObrigatorioCNH := Value.IsObrigatorioCNH;
  FDepartamento.CopiarDados( Value.Departamento );
end;

constructor TCargos.Create;
begin
  inherited Create;
  FCargo            := '';
  FDepartamento     := TDepartamentos.Create;
  FIsObrigatorioCNH := False;
end;

destructor TCargos.Destroy;
begin
  FDepartamento.Free;
  inherited;
end;

procedure TCargos.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TCargos.SetCargo( const Value: string );
begin
  FCargo := Value;
end;

procedure TCargos.SetDepartamento( const Value: TDepartamentos );
begin
  FDepartamento := Value;
end;

procedure TCargos.SetIsObrigatorioCNH( const Value: Boolean );
begin
  FIsObrigatorioCNH := Value;
end;

end.
