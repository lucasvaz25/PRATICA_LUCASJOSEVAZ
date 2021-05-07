unit uFrm_Consulta_OrdemProducao;

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
  Vcl.Buttons;

type
  TFrm_Consulta_OrdemProducao = class( TFrm_Consulta )
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Novo; override;
    procedure Alterar; override;
    procedure Excluir; override;
    procedure Sair; override;
    procedure Consultar; override;

    procedure SelecionaRegistro;
  end;

var
  Frm_Consulta_OrdemProducao: TFrm_Consulta_OrdemProducao;

implementation

uses
  UFrm_Cad_Ordem_Producao;
{$R *.dfm}

{ TFrm_Consulta_OrdemProducao }

procedure TFrm_Consulta_OrdemProducao.Alterar;
begin
  inherited;

end;

procedure TFrm_Consulta_OrdemProducao.Consultar;
begin
  inherited;

end;

procedure TFrm_Consulta_OrdemProducao.Excluir;
begin
  inherited;

end;

procedure TFrm_Consulta_OrdemProducao.Novo;
var
  Frm: TFrm_Cad_Ordem_Producao;
begin
  inherited;

  Frm := TFrm_Cad_Ordem_Producao.Create( Self );
  try
    Frm.EdCodigo.Text := IntToStr( 0 );
    Frm.ShowModal;
    if Frm.Salvou then
      Self.Consultar;
  finally
    Frm.Free;
  end;
end;

procedure TFrm_Consulta_OrdemProducao.Sair;
begin
  inherited;

end;

procedure TFrm_Consulta_OrdemProducao.SelecionaRegistro;
begin

end;

end.
