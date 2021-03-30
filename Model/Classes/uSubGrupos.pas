unit uSubGrupos;

interface

uses
  UGeral,
  UGrupos;

type
  TSubGrupos = class( TGeral )
  private
    FObs: string;
    FSubgrupo: string;
    FGrupo: TGrupos;
    procedure SetGrupo( const Value: TGrupos );
    procedure SetObs( const Value: string );
    procedure SetSubgrupo( const Value: string );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Subgrupo: string read FSubgrupo write SetSubgrupo;
    property Obs: string read FObs write SetObs;
    property Grupo: TGrupos read FGrupo write SetGrupo;

    procedure CopiarDados( Value: TSubGrupos );
  end;

implementation

{ TSubGrupos }

procedure TSubGrupos.CopiarDados( Value: TSubGrupos );
begin
  inherited CopiarDados( Value );
  FSubgrupo := Value.Subgrupo;
  FObs      := Value.Obs;
  FGrupo.CopiarDados( Value.Grupo );
end;

constructor TSubGrupos.Create;
begin
  inherited Create;
  FGrupo.Create;
end;

destructor TSubGrupos.Destroy;
begin
  FGrupo.Free;
  inherited;
end;

procedure TSubGrupos.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TSubGrupos.SetGrupo( const Value: TGrupos );
begin
  FGrupo := Value;
end;

procedure TSubGrupos.SetObs( const Value: string );
begin
  FObs := Value;
end;

procedure TSubGrupos.SetSubgrupo( const Value: string );
begin
  FSubgrupo := Value;
end;

end.
