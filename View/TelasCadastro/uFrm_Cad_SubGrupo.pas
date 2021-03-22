unit uFrm_Cad_SubGrupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_Cadastro, Vcl.Buttons,
  Vcl.StdCtrls, VazEdit, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Imaging.pngimage;

type
  TFrm_Cad_SubGrupo = class(TFrm_Cadastro)
    lblSubGrupo: TLabel;
    edSubGrupo: TVazEdit;
    lblObs: TLabel;
    edObs: TMemo;
    lblGrupo: TLabel;
    lkpGrupo: TDBLookupComboBox;
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
  Frm_Cad_SubGrupo: TFrm_Cad_SubGrupo;

implementation

{$R *.dfm}

end.
