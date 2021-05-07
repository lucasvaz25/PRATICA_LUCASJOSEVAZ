unit uFrm_Consulta_Depositos;

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
  Vcl.Buttons,
  UDepositosController,
  Datasnap.DBClient;

type
  TFrm_Consulta_Depositos = class( TFrm_Consulta )
    TDset_Depositos: TClientDataSet;
    TDset_Depositoscodigo: TIntegerField;
    procedure FormCreate( Sender: TObject );
  private
    { Private declarations }
  public
    { Public declarations }
    DepositoControl: TDepositosController;
    procedure Novo; override;
    procedure Alterar; override;
    procedure Excluir; override;
    procedure Sair; override;
    procedure Consultar; override;

    procedure SelecionaRegistro;
  end;

var
  Frm_Consulta_Depositos: TFrm_Consulta_Depositos;

implementation

uses
  UDepositos,
  UFrm_Cad_Depositos;
{$R *.dfm}

{ TFrm_Consulta_Depositos }

procedure TFrm_Consulta_Depositos.Alterar;
var
  Frm: TFrm_Cad_Depositos;
  Aux: TDepositos;
begin
  inherited;

  if TDset_Depositos.IsEmpty then
  begin
    MessageDlg( 'Nenhum registro selecionado!!', MtInformation, [ MbOK ], 0 );
    Exit;
  end;
  Aux := TDepositos.Create;
  try
    if DepositoControl.Recuperar( TDset_Depositoscodigo.Value, TObject( Aux ) ) then
    begin
      Frm := TFrm_Cad_Depositos.Create( Self );
      try
        Frm.EdCodigo.Text := IntToStr( Aux.Codigo );
        Frm.DepositoControl.GetEntity.CopiarDados( Aux );
        Frm.ShowModal;
        if Frm.Salvou then
          Self.Consultar;
      finally
        Frm.Free;
      end;
    end;
  finally
    Aux.Free;
  end;
end;

procedure TFrm_Consulta_Depositos.Consultar;
begin
  inherited;

end;

procedure TFrm_Consulta_Depositos.Excluir;
begin
  inherited;

end;

procedure TFrm_Consulta_Depositos.FormCreate( Sender: TObject );
begin
  inherited;
  DepositoControl := nil;
  DepositoControl.GetInstance( DepositoControl, Self )
end;

procedure TFrm_Consulta_Depositos.Novo;
var
  Frm: TFrm_Cad_Depositos;
begin
  inherited;

  Frm := TFrm_Cad_Depositos.Create( Self );
  try
    Frm.EdCodigo.Text := IntToStr( 0 );
    Frm.ShowModal;
    if Frm.Salvou then
      Self.Consultar;
  finally
    Frm.Free;
  end;
end;

procedure TFrm_Consulta_Depositos.Sair;
begin
  inherited;

end;

procedure TFrm_Consulta_Depositos.SelecionaRegistro;
begin

end;

end.
