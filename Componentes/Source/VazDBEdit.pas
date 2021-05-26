unit VazDBEdit;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.Graphics;

type
  TVazDBEdit = class( TDBEdit )
  private
    FChangeColor: TColor;
    procedure SetChangeColor( const Value: TColor );
    { Private declarations }
  protected
    { Protected declarations }
    procedure DoEnter; override;
    procedure DoExit; override;
  public
    { Public declarations }
    constructor Create( AOwner: TComponent ); override;
  published
    { Published declarations }
    property ChangeColor: TColor read FChangeColor write SetChangeColor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents( 'Vaz', [ TVazDBEdit ] );
end;

{ TVazDBEdit }

constructor TVazDBEdit.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  FChangeColor := $E0FFFF;
end;

procedure TVazDBEdit.DoEnter;
begin
  inherited;
  Color := FChangeColor;
end;

procedure TVazDBEdit.DoExit;
begin
  inherited;
  Color := ClWindow;
end;

procedure TVazDBEdit.SetChangeColor( const Value: TColor );
begin
  FChangeColor := Value;
end;

end.
