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
    LblCodDept: TLabel;
    EdCodEstado: TVazEdit;
    procedure FormCreate( Sender: TObject );
    procedure EdCodEstadoExit( Sender: TObject );
    procedure EdCodEstadoKeyPress( Sender: TObject; var Key: Char );
    procedure BtnPesquisarEstadosClick( Sender: TObject );
    procedure EdDDDEnter( Sender: TObject );

  private
    EstadoControl: TEstadosController;
    procedure PopulaObj;
    procedure PopulaForm; override;
    function ValidaForm: Boolean;
    procedure ConsultarEstado;
    procedure PesquisaBtnEstado;
  public
    { Public declarations }
    CidadeControl: TCidadesController;

    procedure Salvar; override;
    procedure Sair; override;

  end;

var
  Frm_Cad_Cidades: TFrm_Cad_Cidades;

implementation

uses
  System.Contnrs,
  UEnum,
  UFilterSearch,
  UEstados,
  UFrm_Consulta_Estados;
{$R *.dfm}

{ TFrm_Cad_Cidades }

procedure TFrm_Cad_Cidades.BtnPesquisarEstadosClick( Sender: TObject );
begin
  inherited;
  Self.PesquisaBtnEstado;
end;

procedure TFrm_Cad_Cidades.ConsultarEstado;
var
  Filtro: TFilterSearch;
  List: TObjectlist;
begin
  if EdCodEstado.Text <> '' then
  begin
    Filtro := TFilterSearch.Create;
    try
      Filtro.TipoConsulta := TpCCodigo;
      Filtro.RecuperarObj := True;
      Filtro.Codigo       := StrToInt( EdCodEstado.Text );
      List                := EstadoControl.Consulta( Filtro );
      if List.Count > 0 then
      begin
        EdEstado.Text := TEstado( List[ 0 ] ).Estado;
        CidadeControl.GetEntity.Estado.CopiarDados( TEstado( List[ 0 ] ) );
      end
      else
      begin
        ShowMessage( 'Estado não encontrado!!' );
        EdCodEstado.Clear;
        EdEstado.SetFocus;
      end;
    finally
      Filtro.Free;
    end;
  end;
end;

procedure TFrm_Cad_Cidades.EdCodEstadoExit( Sender: TObject );
begin
  inherited;
  Self.ConsultarEstado;
end;

procedure TFrm_Cad_Cidades.EdCodEstadoKeyPress( Sender: TObject; var Key: Char );
begin
  inherited;
  if Key = #13 then
    Self.ConsultarEstado;
end;

procedure TFrm_Cad_Cidades.EdDDDEnter( Sender: TObject );
begin
  inherited;
  Self.FormatDDD( Sender );
end;

procedure TFrm_Cad_Cidades.FormCreate( Sender: TObject );
begin
  inherited;
  CidadeControl := nil;
  CidadeControl.GetInstance( CidadeControl, Self );

  EstadoControl := nil;
  EstadoControl.GetInstance( EstadoControl, Self );
end;

procedure TFrm_Cad_Cidades.PesquisaBtnEstado;
var
  Frm: TFrm_Consulta_Estados;
begin
  inherited;
  Frm := TFrm_Consulta_Estados.Create( Self );
  try
    Frm.IsSelecionar := True;
    Frm.ShowModal;
    EdEstado.Text    := Frm.EstadoControl.GetEntity.Estado;
    EdCodEstado.Text := IntToStr( Frm.EstadoControl.GetEntity.Codigo );
    CidadeControl.GetEntity.Estado.CopiarDados
                ( Frm.EstadoControl.GetEntity );
  finally
    Frm.Release;
  end;
end;

procedure TFrm_Cad_Cidades.PopulaForm;
begin
  with CidadeControl.GetEntity do
  begin
    EdCodigo.Text             := IntToStr( Codigo );
    EdEstado.Text             := Estado.Estado;
    EdCidade.Text             := Cidade;
    EdCodEstado.Text          := Estado.Codigo.ToString;
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

    if Salvou then
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
