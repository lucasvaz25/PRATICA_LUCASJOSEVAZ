unit uFrm_Cad_Ordem_Producao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_Cadastro, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.StdCtrls, VazEdit, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.WinXPanels,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage;

type
  TFrm_Cad_Ordem_Producao = class(TFrm_Cadastro)
    DsItensProducao: TDataSource;
    TDset_ItensProducao: TClientDataSet;
    pnlGriid: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    edQtd: TVazEdit;
    Label1: TLabel;
    Label2: TLabel;
    pnlPesquisar: TPanel;
    imgPesquisar: TImage;
    btnPesquisar: TSpeedButton;
    pnlInserirLista: TPanel;
    btnInserirLista: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    pnlCaptionGrid: TPanel;
    pnlTop: TPanel;
    pnlCaptionMateriaPrima: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cad_Ordem_Producao: TFrm_Cad_Ordem_Producao;

implementation

{$R *.dfm}

end.
