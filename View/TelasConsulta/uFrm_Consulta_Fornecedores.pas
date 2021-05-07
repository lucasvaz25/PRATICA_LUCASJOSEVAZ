unit uFrm_Consulta_Fornecedores;

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
  TFrm_Consulta_Fornecedores = class( TFrm_Consulta )
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
  Frm_Consulta_Fornecedores: TFrm_Consulta_Fornecedores;

implementation

uses
  UFrm_Cad_Fornecedor;
{$R *.dfm}

{ TFrm_Consulta1 }

procedure TFrm_Consulta_Fornecedores.Alterar;
begin
  inherited;

end;

procedure TFrm_Consulta_Fornecedores.Consultar;
begin
  inherited;

end;

procedure TFrm_Consulta_Fornecedores.Excluir;
begin
  inherited;

end;

procedure TFrm_Consulta_Fornecedores.Novo;
var
  Frm: TFrm_Cad_Fornecedor;
begin
  inherited;

  Frm := TFrm_Cad_Fornecedor.Create( Self );
  try
    Frm.EdCodigo.Text := IntToStr( 0 );
    Frm.ShowModal;
    if Frm.Salvou then
      Self.Consultar;
  finally
    Frm.Free;
  end;
end;

procedure TFrm_Consulta_Fornecedores.Sair;
begin
  inherited;

end;

procedure TFrm_Consulta_Fornecedores.SelecionaRegistro;
begin

end;

end.
