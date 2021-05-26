unit uFrm_Consulta_CondicaoPagamento;

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
  UFrm_Consulta,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  VazEdit,
  Vcl.Imaging.Pngimage,
  Vcl.Buttons,

  UCondicaoPagamentoController;

type
  TFrm_Consulta_CondicaoPagamento = class( TFrm_Consulta )
  private
    { Private declarations }
  public
    { Public declarations }
    CondPagControl: TCondicaoPagamentoController;
  end;

var
  Frm_Consulta_CondicaoPagamento: TFrm_Consulta_CondicaoPagamento;

implementation

{$R *.dfm}

end.