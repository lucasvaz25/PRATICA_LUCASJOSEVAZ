unit uFrm_Cad_Grupo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_Cadastro, Vcl.StdCtrls,
  Vcl.Buttons, VazEdit, Vcl.ExtCtrls;

type
  TFrm_Cad_Grupo = class(TFrm_Cadastro)
    edCargo: TVazEdit;
    lblGrupo: TLabel;
    edObs: TMemo;
    lblObs: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cad_Grupo: TFrm_Cad_Grupo;

implementation

{$R *.dfm}

end.
