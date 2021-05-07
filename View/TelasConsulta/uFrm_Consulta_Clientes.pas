unit uFrm_Consulta_Clientes;

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
  TFrm_Consulta_Cliente = class( TFrm_Consulta )
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
  Frm_Consulta_Cliente: TFrm_Consulta_Cliente;

implementation

uses
  UFrm_Cad_Clientes;
{$R *.dfm}

{ TFrm_Consulta_Cliente }

procedure TFrm_Consulta_Cliente.Alterar;
begin
  inherited;

end;

procedure TFrm_Consulta_Cliente.Consultar;
begin
  inherited;

end;

procedure TFrm_Consulta_Cliente.Excluir;
begin
  inherited;

end;

procedure TFrm_Consulta_Cliente.Novo;
var
  Frm: TFrm_Cad_Clientes;
begin
  inherited;

  Frm := TFrm_Cad_Clientes.Create( Self );
  try
    Frm.EdCodigo.Text := IntToStr( 0 );
    Frm.ShowModal;
    if Frm.Salvou then
      Self.Consultar;
  finally
    Frm.Free;
  end;
end;

procedure TFrm_Consulta_Cliente.Sair;
begin
  inherited;

end;

procedure TFrm_Consulta_Cliente.SelecionaRegistro;
begin

end;

end.
