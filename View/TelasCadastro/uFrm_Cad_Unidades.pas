unit uFrm_Cad_Unidades;

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
  UUnidadesController;

type
  TFrm_Cad_Unidades = class( TFrm_Cadastro )
    EdUnidade: TVazEdit;
    LblPais: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    UnidadeControl: TUnidadesController;
  end;

var
  Frm_Cad_Unidades: TFrm_Cad_Unidades;

implementation

{$R *.dfm}

end.
