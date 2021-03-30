unit uFrm_cad_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_Cadastro, Vcl.Buttons,
  Vcl.StdCtrls, VazEdit, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFrm_Cad_Produto = class(TFrm_Cadastro)
    lblDescricao: TLabel;
    edDescricao: TVazEdit;
    lblVlrCusto: TLabel;
    edVlrCusto: TVazEdit;
    edVlrVenda: TVazEdit;
    lblVlrVenda: TLabel;
    cbUnidade: TComboBox;
    lblUnidade: TLabel;
    pnlImage: TPanel;
    pnlInserirImagem: TPanel;
    pnlRemoverImage: TPanel;
    btnInserirImagem: TSpeedButton;
    btnRemoverImage: TSpeedButton;
    imgProduto: TImage;
    lblImageProduto: TLabel;
    edEstoque: TVazEdit;
    lblEstoque: TLabel;
    edFornecedor: TVazEdit;
    lblFornecedor: TLabel;
    pnlPesquisar: TPanel;
    imgPesquisar: TImage;
    edSubGrupo: TVazEdit;
    lblSubGrupo: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    edGrupo: TVazEdit;
    lblGrupo: TLabel;
    edObs: TMemo;
    lblObs: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cad_Produto: TFrm_Cad_Produto;

implementation

{$R *.dfm}

end.
