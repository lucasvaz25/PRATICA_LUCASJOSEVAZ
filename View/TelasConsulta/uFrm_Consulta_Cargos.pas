unit uFrm_Consulta_Cargos;

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
  Datasnap.DBClient,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  VazEdit,
  Vcl.Imaging.Pngimage,
  Vcl.Buttons,
  UCargosController;

type
  TFrm_Consulta_Cargos = class( TFrm_Consulta )
    TDset_Cargos: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    CargoControl: TCargosController;

    procedure Novo; override;
    procedure Alterar; override;
    procedure Excluir; override;
    procedure Sair; override;
    procedure Consultar; override;

    procedure SelecionaRegistro;
  end;

var
  Frm_Consulta_Cargos: TFrm_Consulta_Cargos;

implementation

uses
  UCargos,
  UFrm_Cad_Cargo;
{$R *.dfm}

{ TFrm_Consulta_Cargos }

procedure TFrm_Consulta_Cargos.Alterar;
begin
  inherited;

end;

procedure TFrm_Consulta_Cargos.Consultar;
begin
  inherited;

end;

procedure TFrm_Consulta_Cargos.Excluir;
begin
  inherited;

end;

procedure TFrm_Consulta_Cargos.Novo;
var
  Frm: TFrm_Cad_Cargo;
begin
  inherited;

  Frm := TFrm_Cad_Cargo.Create( Self );
  try
    Frm.EdCodigo.Text := IntToStr( 0 );
    Frm.ShowModal;
    if Frm.Salvou then
      Self.Consultar;
  finally
    Frm.Free;
  end;
end;

procedure TFrm_Consulta_Cargos.Sair;
begin
  inherited;

end;

procedure TFrm_Consulta_Cargos.SelecionaRegistro;
begin

end;

end.