unit VazMaskEdit;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.Graphics;

type
  TTypeMask = ( TtmData, TtmCPF, TtmCNPJ, TtmCEP, TtmTelefone, TtmCelular );

  TVazMaskEdit = class( TMaskEdit )
  private
    FChangeColor: TColor;
    FTypeMask: TTypeMask;
    procedure SetChangeColor( const Value: TColor );
    procedure SetTypeMask( const Value: TTypeMask );
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
    property TypeMask: TTypeMask read FTypeMask write SetTypeMask;
    property ChangeColor: TColor read FChangeColor write SetChangeColor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents( 'Vaz', [ TVazMaskEdit ] );
end;

{ TVazMaskEdit }

constructor TVazMaskEdit.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  FChangeColor   := $E0FFFF;
  Self.Height    := 24;
  Self.Font.Size := 10;
end;

procedure TVazMaskEdit.DoEnter;
begin
  inherited;
  Color := FChangeColor;
end;

procedure TVazMaskEdit.DoExit;
begin
  inherited;
  Color := ClWindow;
end;

procedure TVazMaskEdit.SetChangeColor( const Value: TColor );
begin
  FChangeColor := Value;
end;

procedure TVazMaskEdit.SetTypeMask( const Value: TTypeMask );
begin
  FTypeMask := Value;

  case Value of
    TtmData:
      EditMask := '99/99/9999;0;_';

    TtmCPF:
      EditMask := '999.999.999-99;0;_';

    TtmCNPJ:
      EditMask := '99.999.999/9999-99;0;_';

    TtmCEP:
      EditMask := '99.999-999;0;_';

    TtmTelefone:
      EditMask := '(99) 9999-9999;0;_';

    TtmCelular:
      EditMask := '(99) 9 9999-9999;0;_';

  end;
end;

end.
