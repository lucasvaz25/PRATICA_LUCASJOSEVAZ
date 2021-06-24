unit uFrm_Cad_FormasPagamentos;

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
  UFormasPagamentosController;

type
  TFrm_Cad_FormasPagamentos = class( TFrm_Cadastro )
    LblFormaPgto: TLabel;
    EdFormaPagamento: TVazEdit;
    LblObs: TLabel;
    EdObs: TMemo;
    procedure FormCreate( Sender: TObject );
  private
    { Private declarations }
    procedure PopulaObj;
    procedure PopulaForm; override;
    function ValidaForm: Boolean;
  public
    { Public declarations }
    FormaPgtoControl: TFormasPagamentosController;
    procedure Salvar; override;
    procedure Sair; override;
  end;

var
  Frm_Cad_FormasPagamentos: TFrm_Cad_FormasPagamentos;

implementation

uses
  UFilterSearch,
  UFormasPagamentos;
{$R *.dfm}

{ TFrm_Cad_FormasPagamentos }

procedure TFrm_Cad_FormasPagamentos.FormCreate( Sender: TObject );
begin
  inherited;
  FormaPgtoControl := nil;
  FormaPgtoControl.GetInstance( FormaPgtoControl, Self );
end;

procedure TFrm_Cad_FormasPagamentos.PopulaForm;
begin
  inherited;
  with FormaPgtoControl.GetEntity do
  begin
    EdCodigo.Text         := IntToStr( Codigo );
    EdFormaPagamento.Text := FormaPagamento;
    EdObs.Text            := Obs;
  end;
end;

procedure TFrm_Cad_FormasPagamentos.PopulaObj;
begin
  with FormaPgtoControl.GetEntity do
  begin
    Codigo         := StrToInt( EdCodigo.Text );
    FormaPagamento := EdFormaPagamento.Text;
    Obs            := EdObs.Text;
    DataCad        := Date;
    UserCad        := UpperCase( 'lucas' );
  end;
end;

procedure TFrm_Cad_FormasPagamentos.Sair;
begin
  inherited;

end;

procedure TFrm_Cad_FormasPagamentos.Salvar;
var
  Aux: TObject;
begin
  inherited;
  if ValidaForm then
  begin

    PopulaObj;
    Aux := FormaPgtoControl.GetEntity;
    if EdCodigo.Text = '0' then
      Salvou := FormaPgtoControl.Inserir( Aux )
    else
      Salvou := FormaPgtoControl.Editar( Aux );

    if Salvou then
      Self.Sair;
  end;
end;

function TFrm_Cad_FormasPagamentos.ValidaForm: Boolean;
begin
  Result := False;

  if Length( EdFormaPagamento.Text ) < 3 then
  begin
    MessageDlg( 'Insira uma Forma de Pagamento v�lida!!', MtInformation, [ MbOK ], 0 );
    EdFormaPagamento.SetFocus;
    Exit;
  end;

  if EdCodigo.Text = '0' then
    if FormaPgtoControl.VerificaExiste( UpperCase( EdFormaPagamento.Text ) ) then
    begin
      MessageDlg( 'J� existe uma Forma de Pagamento com esse nome!!', MtInformation, [ MbOK ], 0 );
      EdFormaPagamento.SetFocus;
      Exit;
    end;

  Result := True;
end;

end.
