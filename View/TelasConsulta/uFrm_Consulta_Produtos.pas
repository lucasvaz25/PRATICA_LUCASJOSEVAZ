unit uFrm_Consulta_Produtos;

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
  TFrm_Consulta_Produtos = class( TFrm_Consulta )
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
  Frm_Consulta_Produtos: TFrm_Consulta_Produtos;

implementation

uses
  UFrm_cad_Produtos;
{$R *.dfm}

{ TFrm_Consulta_Produtos }

procedure TFrm_Consulta_Produtos.Alterar;
begin
  inherited;

end;

procedure TFrm_Consulta_Produtos.Consultar;
begin
  inherited;

end;

procedure TFrm_Consulta_Produtos.Excluir;
begin
  inherited;

end;

procedure TFrm_Consulta_Produtos.Novo;
var
  Frm: TFrm_Cad_Produto;
begin
  inherited;

  Frm := TFrm_Cad_Produto.Create( Self );
  try
    Frm.EdCodigo.Text := IntToStr( 0 );
    Frm.ShowModal;
    if Frm.Salvou then
      Self.Consultar;
  finally
    Frm.Free;
  end;
end;

procedure TFrm_Consulta_Produtos.Sair;
begin
  inherited;

end;

procedure TFrm_Consulta_Produtos.SelecionaRegistro;
begin

end;

end.
