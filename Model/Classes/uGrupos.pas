unit uGrupos;

interface

uses
  UGeral;

type
  TGrupos = class( TGeral )
  private
    FObs: string;
    FGrupo: string;
    procedure SetGrupo( const Value: string );
    procedure SetObs( const Value: string );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Grupo: string read FGrupo write SetGrupo;
    property Obs: string read FObs write SetObs;

    procedure CopiarDados( Value: TGrupos );
  end;

implementation

{ TGrupos }

procedure TGrupos.CopiarDados( Value: TGrupos );
begin
  inherited CopiarDados( Value );
  FGrupo := Value.Grupo;
  FObs   := Value.Obs;
end;

constructor TGrupos.Create;
begin
  inherited Create;
  FGrupo := '';
  FObs   := '';
end;

destructor TGrupos.Destroy;
begin
  inherited;
end;

procedure TGrupos.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TGrupos.SetGrupo( const Value: string );
begin
  FGrupo := Value;
end;

procedure TGrupos.SetObs( const Value: string );
begin
  FObs := Value;
end;

end.
