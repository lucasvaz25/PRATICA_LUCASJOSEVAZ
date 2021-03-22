unit uFrame_Consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TFrame_Consulta = class(TFrame)
    pnlFundo: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    pnlbotoes: TPanel;
    pnlNovoCad: TPanel;
    imgNovoCad: TImage;
    btnNovoCad: TSpeedButton;
    pnlAlterarCad: TPanel;
    imgAlterarCad: TImage;
    btnAlterarCad: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
