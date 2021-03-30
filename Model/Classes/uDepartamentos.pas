unit uDepartamentos;

interface

uses
  UGeral;

type
  TDepartamentos = class( TGeral )
  private
    FDepartamento: string;
    procedure SetDepartamento( const Value: string );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Departamento: string read FDepartamento write SetDepartamento;

    procedure CopiarDados( Value: TDepartamentos );
  end;

implementation

{ TDepartamentos }

procedure TDepartamentos.CopiarDados( Value: TDepartamentos );
begin
  inherited CopiarDados( Value );
  FDepartamento := Value.Departamento;
end;

constructor TDepartamentos.Create;
begin
  inherited Create;
end;

destructor TDepartamentos.Destroy;
begin
  inherited;
end;

procedure TDepartamentos.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TDepartamentos.SetDepartamento( const Value: string );
begin
  FDepartamento := Value;
end;

end.
