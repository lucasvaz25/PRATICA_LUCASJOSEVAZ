unit uFuncionarios;

interface

uses
  UCargos,
  UCidades,
  UEnum,
  UPessoa;

type
  TFuncionarios = class( TPessoa )
  private
    FValidadeCNH: TDateTime;
    FCNH: string;
    FSalario: Currency;
    FData_Admissao: TDateTime;
    FCategoria: TCategoriaCNH;
    FData_Demissao: TDateTime;
    FCargo: TCargos;
    FStatus: TStatus;
    procedure SetCargo( const Value: TCargos );
    procedure SetCategoria( const Value: TCategoriaCNH );
    procedure SetCNH( const Value: string );
    procedure SetData_Admissao( const Value: TDateTime );
    procedure SetData_Demissao( const Value: TDateTime );
    procedure SetSalario( const Value: Currency );
    procedure SetValidadeCNH( const Value: TDateTime );
    procedure SetStatus( const Value: TStatus );
  protected
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Salario: Currency read FSalario write SetSalario;
    property Data_Admissao: TDateTime read FData_Admissao write SetData_Admissao;
    property Data_Demissao: TDateTime read FData_Demissao write SetData_Demissao;
    property CNH: string read FCNH write SetCNH;
    property Categoria: TCategoriaCNH read FCategoria write SetCategoria;
    property ValidadeCNH: TDateTime read FValidadeCNH write SetValidadeCNH;
    property Cargo: TCargos read FCargo write SetCargo;
    property Status: TStatus read FStatus write SetStatus;

    procedure CopiarDados( Value: TFuncionarios );
  end;

implementation

{ TFuncionarios }

procedure TFuncionarios.CopiarDados( Value: TFuncionarios );
begin
  inherited CopiarDados( Value );
  FSalario       := Value.Salario;
  FData_Admissao := Value.Data_Admissao;
  FData_Demissao := Value.Data_Demissao;
  FCNH           := Value.CNH;
  FCategoria     := Value.Categoria;
  FValidadeCNH   := Value.ValidadeCNH;
  FStatus        := Value.Status;
  FCargo.CopiarDados( Value.Cargo );
end;

constructor TFuncionarios.Create;
begin
  inherited Create;
  FSalario       := 0;
  FData_Admissao := 0;
  FData_Demissao := 0;
  FCNH           := '';
  FCategoria     := TCCNH_Indefinido;
  FValidadeCNH   := 0;
  FStatus        := TSIndefinido;
  FCargo         := TCargos.Create;
end;

destructor TFuncionarios.Destroy;
begin
  FCargo.Free;
  inherited;
end;

procedure TFuncionarios.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TFuncionarios.SetStatus( const Value: TStatus );
begin
  FStatus := Value;
end;

procedure TFuncionarios.SetCargo( const Value: TCargos );
begin
  FCargo := Value;
end;

procedure TFuncionarios.SetCategoria( const Value: TCategoriaCNH );
begin
  FCategoria := Value;
end;

procedure TFuncionarios.SetCNH( const Value: string );
begin
  FCNH := Value;
end;

procedure TFuncionarios.SetData_Admissao( const Value: TDateTime );
begin
  FData_Admissao := Value;
end;

procedure TFuncionarios.SetData_Demissao( const Value: TDateTime );
begin
  FData_Demissao := Value;
end;

procedure TFuncionarios.SetSalario( const Value: Currency );
begin
  FSalario := Value;
end;

procedure TFuncionarios.SetValidadeCNH( const Value: TDateTime );
begin
  FValidadeCNH := Value;
end;

end.
