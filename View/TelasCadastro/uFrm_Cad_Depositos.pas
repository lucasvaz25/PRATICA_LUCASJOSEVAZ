unit uFrm_Cad_Depositos;

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
  UFrm_Cadastro,
  Vcl.Buttons,
  Vcl.StdCtrls,
  VazEdit,
  Vcl.ExtCtrls,
  Vcl.Imaging.Pngimage,
  UDepositosController,
  Vcl.Mask,
  VazMaskEdit;

type
  TFrm_Cad_Depositos = class( TFrm_Cadastro )
    EdDeposito: TVazEdit;
    LblDeposito: TLabel;
    LblEndereco: TLabel;
    EdEndereco: TVazEdit;
    LblNum: TLabel;
    EdNum: TVazEdit;
    EdBairro: TVazEdit;
    LblBairro: TLabel;
    EdCidade: TVazEdit;
    EdUF: TVazEdit;
    LblCidade: TLabel;
    LblUF: TLabel;
    PnlPesquisar: TPanel;
    ImgPesquisar: TImage;
    EdObs: TMemo;
    LblObs: TLabel;
    EdCEP: TVazMaskEdit;
    LblCEP: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    DepositoControl: TDepositosController;
  end;

var
  Frm_Cad_Depositos: TFrm_Cad_Depositos;

implementation

{$R *.dfm}

end.
