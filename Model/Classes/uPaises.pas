unit uPaises;

interface

uses
  UGeral;

type
  TPais = class( TGeral )
  private
    FSigla: string;
    FNome: string;
    FDDI: string;
    procedure SetDDI( const Value: string );
    procedure SetNome( const Value: string );
    procedure SetSigla( const Value: string );
  protected
  public
    constructor Create;
    destructor Destroy;

    property Nome: string read FNome write SetNome;
    property Sigla: string read FSigla write SetSigla;
    property DDI: string read FDDI write SetDDI;

    procedure CopiarDados( Value: TPais );

  end;

implementation

{ TPais }

procedure TPais.CopiarDados( Value: TPais );
begin
  inherited CopiarDados( Value );
  FSigla := Value.Sigla;
  FNome  := Value.Nome;
  FDDI   := Value.DDI;
end;

constructor TPais.Create;
begin
  inherited Create;
  FSigla := '';
  FNome  := '';
  FDDI   := '';
end;

destructor TPais.Destroy;
begin
  if Assigned( Self ) then
    inherited Destroy;
end;

procedure TPais.SetDDI( const Value: string );
begin
  FDDI := Value;
end;

procedure TPais.SetNome( const Value: string );
begin
  FNome := Value;
end;

procedure TPais.SetSigla( const Value: string );
begin
  FSigla := Value;
end;

end.
