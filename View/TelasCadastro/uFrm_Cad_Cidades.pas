unit uFrm_Cad_Cidades;

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
  Vcl.Imaging.Pngimage,
  UCidades,
  UCidadesController,
  UEstadosController;

type
  TFrm_Cad_Cidades = class( TFrm_Cadastro )
    EdCidade: TVazEdit;
    LblCidade: TLabel;
    EdDDD: TVazEdit;
    LblDDD: TLabel;
    EdEstado: TVazEdit;
    LblEstado: TLabel;
    PnlPesquisar: TPanel;
    ImgPesquisar: TImage;
    BalloonHint1: TBalloonHint;
    BtnPesquisarEstados: TSpeedButton;
    procedure FormCreate( Sender: TObject );
    procedure FormShow( Sender: TObject );
    procedure BtnPesquisarEstadosClick( Sender: TObject );

  private
    procedure PopulaObj;
    procedure PopulaForm;
    function ValidaForm: Boolean;
  public
    { Public declarations }
    CidadeControl: TCidadesController;
    EstadoControl: TEstadosController;

    procedure Salvar; override;
    procedure Sair; override;

  end;

var
  Frm_Cad_Cidades: TFrm_Cad_Cidades;

implementation

uses
  UFrm_Consulta_Estados;
{$R *.dfm}

{ TFrm_Cad_Cidades }

procedure TFrm_Cad_Cidades.BtnPesquisarEstadosClick( Sender: TObject );
var
  Frm: TFrm_Consulta_Estados;
begin
  inherited;
  //
  Frm := TFrm_Consulta_Estados.Create( Self );
  Frm.ShowModal;
  EdEstado.Text := Frm.EstadoControl.GetEntity.Estado;
  CidadeControl.GetEntity.Estado.CopiarDados( Frm.EstadoControl.GetEntity );
  Frm.Release;
end;

procedure TFrm_Cad_Cidades.FormCreate( Sender: TObject );
begin
  inherited;
  CidadeControl := nil;
  CidadeControl.GetInstance( CidadeControl, Self );

  EstadoControl := nil;
  EstadoControl.GetInstance( EstadoControl, Self );
end;

procedure TFrm_Cad_Cidades.FormShow( Sender: TObject );
begin
  inherited;
  if not( EdCodigo.Text = '0' ) then
    PopulaForm;
end;

procedure TFrm_Cad_Cidades.PopulaForm;
begin
  with CidadeControl.GetEntity do
  begin
    EdCodigo.Text             := IntToStr( Codigo );
    EdEstado.Text             := Estado.Estado;
    EdCidade.Text             := Cidade;
    EdDDD.Text                := DDD;
    LblUsuarioDataCad.Caption := 'Usuário: ' + Usercad + ' - Data Cadastro :' + Datetostr( DataCad );
  end;
end;

procedure TFrm_Cad_Cidades.PopulaObj;
begin
  with CidadeControl.GetEntity do
  begin
    Codigo  := StrToInt( EdCodigo.Text );
    Cidade  := UpperCase( EdCidade.Text );
    DDD     := UpperCase( EdDDD.Text );
    DataCad := Date;
    UserCad := UpperCase( 'lucas' );
  end;
end;

procedure TFrm_Cad_Cidades.Sair;
begin
  inherited;

end;

procedure TFrm_Cad_Cidades.Salvar;
var
  Aux: TObject;
begin
  inherited;
  if ValidaForm then
  begin

    PopulaObj;
    Aux := CidadeControl.GetEntity;
    if EdCodigo.Text = '0' then
      Salvou := CidadeControl.Inserir( Aux )
    else
      Salvou := CidadeControl.Editar( Aux );

    Self.Sair;
  end;
end;

function TFrm_Cad_Cidades.ValidaForm: Boolean;
begin
  Result := False;

  if Length( EdCidade.Text ) < 3 then
  begin
    MessageDlg( 'Insira uma Cidade válida!!', MtInformation, [ MbOK ], 0 );
    EdCidade.SetFocus;
    Exit;
  end;

  if Length( EdEstado.Text ) < 3 then
  begin
    MessageDlg( 'Insira um Estado válido!!', MtInformation, [ MbOK ], 0 );
    EdEstado.SetFocus;
    Exit;
  end;

  if EdCodigo.Text = '0' then
    if CidadeControl.VerificaExiste( UpperCase( EdCidade.Text ) ) then
    begin
      MessageDlg( 'Já existe uma Cidade com esse nome!!', MtInformation, [ MbOK ], 0 );
      EdCidade.SetFocus;
      Exit;
    end;

  Result := True;
end;

end.
