unit uFrm_Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_Base, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, VazEdit,
  Vcl.Imaging.pngimage, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TFrm_Venda = class(TFrm_Base)
    pnlRodape: TPanel;
    pnlCabecario: TPanel;
    pnlGrid: TPanel;
    GridVenda: TDBGrid;
    pnlSubTotal: TPanel;
    lblSubtotal: TLabel;
    lblrealsubtotal: TLabel;
    lblVlrSubtotal: TLabel;
    pnlDesconto: TPanel;
    lblDesconto: TLabel;
    lblrealDesconto: TLabel;
    lblValorDesconto: TLabel;
    pnlTotal: TPanel;
    lblTotal: TLabel;
    lblrealTotal: TLabel;
    lblVlrTotal: TLabel;
    pnlTotais: TPanel;
    pnlReceber: TPanel;
    btnReceber: TSpeedButton;
    pnlLimpar: TPanel;
    btnLimpar: TSpeedButton;
    pnlSair: TPanel;
    btnSair: TSpeedButton;
    edCodigo: TVazEdit;
    lblVenda: TLabel;
    lblUsuarioDataCad: TLabel;
    lkpClientes: TDBLookupComboBox;
    lblCliente: TLabel;
    pnlbotoes: TPanel;
    pnlNovoCad: TPanel;
    imgNovoCad: TImage;
    btnNovoCad: TSpeedButton;
    pnlAlterarCad: TPanel;
    imgAlterarCad: TImage;
    btnAlterarCad: TSpeedButton;
    lblProduto: TLabel;
    lkpProduto: TDBLookupComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    Image2: TImage;
    SpeedButton2: TSpeedButton;
    lblQtd: TLabel;
    edQtd: TVazEdit;
    UpDown1: TUpDown;
    pnlAdicionar: TPanel;
    btnAdicionar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Venda: TFrm_Venda;

implementation

{$R *.dfm}

end.
