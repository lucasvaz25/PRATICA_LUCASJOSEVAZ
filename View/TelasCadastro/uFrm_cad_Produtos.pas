unit uFrm_cad_Produtos;

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
  UFornecedoresController,
  UUnidadesController,
  USubGruposController,
  UProdutosController;

type
  TFrm_Cad_Produto = class( TFrm_Cadastro )
    LblDescricao: TLabel;
    EdDescricao: TVazEdit;
    LblVlrCusto: TLabel;
    EdVlrCusto: TVazEdit;
    EdVlrVenda: TVazEdit;
    LblVlrVenda: TLabel;
    LblUnidade: TLabel;
    PnlImage: TPanel;
    PnlInserirImagem: TPanel;
    PnlRemoverImage: TPanel;
    BtnInserirImagem: TSpeedButton;
    BtnRemoverImage: TSpeedButton;
    ImgProduto: TImage;
    LblImageProduto: TLabel;
    EdEstoque: TVazEdit;
    LblEstoque: TLabel;
    EdFornecedor: TVazEdit;
    LblFornecedor: TLabel;
    PnlPesquisar: TPanel;
    ImgPesquisar: TImage;
    EdSubGrupo: TVazEdit;
    LblSubGrupo: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    EdGrupo: TVazEdit;
    LblGrupo: TLabel;
    EdObs: TMemo;
    LblObs: TLabel;
    VazEdit1: TVazEdit;
    Panel2: TPanel;
    Image2: TImage;
    EdCodFormaPagamento: TVazEdit;
    LblCodFormaPagamento: TLabel;
    VazEdit2: TVazEdit;
    Label1: TLabel;
    VazEdit3: TVazEdit;
    Label2: TLabel;
  private
    { Private declarations }
    FornecedorControl: TFornecedoresController;
    UnidadeControl: TUnidadesController;
    SubgrupoControl: TSubGruposController;

    procedure PopulaObj;
    procedure PopulaForm; override;
    function ValidaForm: Boolean;

    procedure ConsultaFornecedor;
    procedure ConsultaUnidade;
    procedure ConsultaSubgrupo;

    procedure PesquisaFornecedor;
    procedure PesquisaUnidade;
    procedure PesquisaSubgrupo;

    function ValidarParcela: Boolean;
  public
    { Public declarations }
    ProdutoControl: TProdutosController;
    procedure Salvar; override;
    procedure Sair; override;
  end;

var
  Frm_Cad_Produto: TFrm_Cad_Produto;

implementation

uses
  UFornecedores,
  UUnidades,
  USubGrupos,
  UFilterSearch,
  UFrm_Consulta_Fornecedores,
  UFrm_Consulta_Unidades,
  UFrm_Consulta_SubGrupos;
{$R *.dfm}

{ TFrm_Cad_Produto }

procedure TFrm_Cad_Produto.ConsultaFornecedor;
begin

end;

procedure TFrm_Cad_Produto.ConsultaSubgrupo;
begin

end;

procedure TFrm_Cad_Produto.ConsultaUnidade;
begin

end;

procedure TFrm_Cad_Produto.PesquisaFornecedor;
begin

end;

procedure TFrm_Cad_Produto.PesquisaSubgrupo;
begin

end;

procedure TFrm_Cad_Produto.PesquisaUnidade;
begin

end;

procedure TFrm_Cad_Produto.PopulaForm;
begin
  inherited;

end;

procedure TFrm_Cad_Produto.PopulaObj;
begin

end;

procedure TFrm_Cad_Produto.Sair;
begin
  inherited;

end;

procedure TFrm_Cad_Produto.Salvar;
begin
  inherited;

end;

function TFrm_Cad_Produto.ValidaForm: Boolean;
begin

end;

function TFrm_Cad_Produto.ValidarParcela: Boolean;
begin

end;

end.
