unit uFrm_Cad_Cidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_Cadastro, Vcl.Buttons,
  Vcl.StdCtrls, VazEdit, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFrm_Cad_Cidades = class(TFrm_Cadastro)
    edCidade: TVazEdit;
    lblCidade: TLabel;
    edDDD: TVazEdit;
    lblDDD: TLabel;
    edEstado: TVazEdit;
    lblEstado: TLabel;
    pnlPesquisar: TPanel;
    imgPesquisar: TImage;
    BalloonHint1: TBalloonHint;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cad_Cidades: TFrm_Cad_Cidades;

implementation

{$R *.dfm}

end.
