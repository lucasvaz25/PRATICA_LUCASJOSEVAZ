unit uFrm_Cad_CondicaoPagamento;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Datasnap.DBClient,
  Vcl.Imaging.Pngimage,
  UCondicaoPagamentoController;

type
  TFrm_Cad_CondicaoPagamento = class( TFrm_Cadastro )
    EdCondPag: TVazEdit;
    LblCondPag: TLabel;
    EdParcelas: TVazEdit;
    LblParcelas: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    TDset_Parcelas: TClientDataSet;
    DsParcelas: TDataSource;
    TDset_Parcelasnumero: TIntegerField;
    TDset_Parcelasdias: TIntegerField;
    TDset_Parcelasporcentagem: TIntegerField;
    TDset_ParcelasFormaPagamento: TStringField;
    LbltxJuros: TLabel;
    EdTxJuros: TVazEdit;
    LblMulta: TLabel;
    EdMulta: TVazEdit;
    LblDesconto: TLabel;
    EdDesconto: TVazEdit;
    EdDias: TVazEdit;
    LblDias: TLabel;
    Panel3: TPanel;
    LblParcela: TLabel;
    LblPorcentagem: TLabel;
    EdPorcentagem: TVazEdit;
    EdFormaPagamento: TVazEdit;
    LblFormaPagamento: TLabel;
    EdCodFormaPagamento: TVazEdit;
    LblCodFormaPagamento: TLabel;
    PnlPesquisar: TPanel;
    ImgPesquisar: TImage;
    PnlInserirLista: TPanel;
    BtnInserirLista: TSpeedButton;
    PnlEditar: TPanel;
    BtnEditar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
    CondPagControl: TCondicaoPagamentoController;
  end;

var
  Frm_Cad_CondicaoPagamento: TFrm_Cad_CondicaoPagamento;

implementation

{$R *.dfm}

end.
