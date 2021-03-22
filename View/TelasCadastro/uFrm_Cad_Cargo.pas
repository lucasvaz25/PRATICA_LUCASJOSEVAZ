unit uFrm_Cad_Cargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_Cadastro, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.StdCtrls, VazEdit;

type
  TFrm_Cad_Cargo = class(TFrm_Cadastro)
    lblCargo: TLabel;
    edCargo: TVazEdit;
    lkpDepartamento: TDBLookupComboBox;
    lblDepartamento: TLabel;
    pnlbotoes: TPanel;
    pnlNovoCad: TPanel;
    imgNovoCad: TImage;
    btnNovoCad: TSpeedButton;
    pnlAlterarCad: TPanel;
    imgAlterarCad: TImage;
    btnAlterarCad: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cad_Cargo: TFrm_Cad_Cargo;

implementation

{$R *.dfm}

end.
