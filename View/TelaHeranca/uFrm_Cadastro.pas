unit uFrm_Cadastro;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UFrm_Base,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  VazEdit,
  Vcl.Buttons;

type
  TFrm_Cadastro = class( TFrm_Base )
    EdCodigo: TVazEdit;
    LblCodigo: TLabel;
    LblUsuarioDataCad: TLabel;
    LblUsuarioDataAlteracao: TLabel;
    BtnSalvar: TSpeedButton;
    PnlSalvar: TPanel;
    PnlSair: TPanel;
    BtnSair: TSpeedButton;
    procedure BtnSalvarMouseLeave( Sender: TObject );
    procedure BtnSalvarMouseMove( Sender: TObject; Shift: TShiftState; X,
                Y: Integer );
    procedure BtnSairClick( Sender: TObject );
    procedure BtnSalvarClick( Sender: TObject );
    procedure FormShow( Sender: TObject );
  private
    { Private declarations }
  public
    { Public declarations }
    Salvou: Boolean;
    procedure LimparCampos;
    procedure Salvar; virtual;
    procedure Sair; virtual;
    procedure ConhecaObj( Obj: TObject; Objcontrol: TObject ); virtual;
  end;

var
  Frm_Cadastro: TFrm_Cadastro;

implementation

uses
  VazMaskEdit,
  Vcl.DBCtrls,
  Vcl.ComCtrls;

{$R *.dfm}


procedure TFrm_Cadastro.BtnSairClick( Sender: TObject );
begin
  inherited;
  Self.Sair;
end;

procedure TFrm_Cadastro.BtnSalvarClick( Sender: TObject );
begin
  inherited;
  Self.Salvar;
end;

procedure TFrm_Cadastro.BtnSalvarMouseLeave( Sender: TObject );
begin
  inherited;
  PnlSalvar.Color := $00FF8000;
end;

procedure TFrm_Cadastro.BtnSalvarMouseMove( Sender: TObject; Shift: TShiftState;
            X, Y: Integer );
begin
  inherited;
  PnlSalvar.Color := $00FFB164;
end;

procedure TFrm_Cadastro.ConhecaObj( Obj, Objcontrol: TObject );
begin

end;

procedure TFrm_Cadastro.FormShow( Sender: TObject );
begin
  inherited;
  if EdCodigo.Text = '0' then
    Self.LimparCampos;
end;

procedure TFrm_Cadastro.LimparCampos;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if ( Components[ I ] is TVazEdit ) then
    begin
      if not( Components[ I ].Name = 'edCodigo' ) then
        TVazEdit( Components[ I ] ).Clear
    end
    else if ( Components[ I ] is TVazMaskEdit ) then
      TVazMaskEdit( Components[ I ] ).Clear
    else if ( Components[ I ] is TEdit ) then
      TEdit( Components[ I ] ).Clear
    else if ( Components[ I ] is TMemo ) then
      TMemo( Components[ I ] ).Clear
    else if ( Components[ I ] is TDateTimePicker ) then
      TDateTimePicker( Components[ I ] ).Date := Date
    else if ( Components[ I ] is TDBLookupComboBox ) then
      TDBLookupComboBox( Components[ I ] ).KeyValue := Null;
  end;
end;

procedure TFrm_Cadastro.Sair;
begin
  Close;
end;

procedure TFrm_Cadastro.Salvar;
begin

end;

end.
