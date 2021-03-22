unit uFrm_Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TFrm_Base = class(TForm)
    pnlFundo: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Base: TFrm_Base;

implementation

{$R *.dfm}

end.
