unit VazEdit;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Graphics;

type
  TVazEdit = class( TEdit )
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
  RegisterComponents( 'Vaz', [ TVazEdit ] );
end;

{ TVazEdit }

constructor TVazEdit.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  FChangeColor   := $E0FFFF;
  Self.Height    := 24;
  Self.Font.Size := 10;
end;

procedure TVazEdit.DoEnter;
begin
  inherited;
  Color := FChangeColor;
end;

procedure TVazEdit.DoExit;
begin
  inherited;
  Color := ClWindow;
end;

procedure TVazEdit.SetChangeColor( const Value: TColor );
begin
  FChangeColor := Value;
end;

end.
