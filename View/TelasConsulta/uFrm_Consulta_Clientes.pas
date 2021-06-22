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
  Vcl.Buttons,
  Datasnap.DBClient,

  UClientesController;

type
  TFrm_Consulta_Cliente = class( TFrm_Consulta )
    TDset_Clientes: TClientDataSet;
    DsClientes: TDataSource;
    TDset_Clientescodigo: TIntegerField;
    TDset_Clientescliente: TStringField;
    TDset_Clientescpf: TStringField;
    TDset_Clientestelefone: TStringField;
    procedure FormCreate( Sender: TObject );
    procedure FormDestroy( Sender: TObject );
    procedure FormShow( Sender: TObject );
    procedure DBGrid1DblClick( Sender: TObject );
  private
    { Private declarations }
    ClienteControl: TClientesController;
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
  UFrm_Cad_Clientes,
  Uclientes,
  UFilterSearch,
  System.Contnrs;
{$R *.dfm}

{ TFrm_Consulta_Cliente }

procedure TFrm_Consulta_Cliente.Alterar;
var
  Frm: TFrm_Cad_Clientes;
  Aux: TClientes;
begin
  inherited;

  if TDset_Clientes.IsEmpty then
  begin
    MessageDlg( 'Nenhum registro selecionado!!', MtInformation, [ MbOK ], 0 );
    Exit;
  end;
  Aux := TClientes.Create;
  try
    if ClienteControl.Recuperar( TDset_Clientescodigo.Value, TObject( Aux ) ) then
    begin
      Frm := TFrm_Cad_Clientes.Create( Self );
      try
        Frm.EdCodigo.Text := IntToStr( Aux.Codigo );
        Frm.ClienteControl.GetEntity.CopiarDados( Aux );
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

procedure TFrm_Consulta_Cliente.Consultar;
var
  Lista: TObjectlist;
  I: Integer;
  VFilter: TFilterSearch;
begin
  TDset_Clientes.EmptyDataSet;

  VFilter := TFilterSearch.Create;
  Lista   := TObjectList.Create;
  try
    case RgFiltro.ItemIndex of
      0:
        begin
          if EdPesquisar.Text = '' then
          begin
            MessageDlg( 'Informe um código válido!!', MtInformation, [ MbOK ], 0 );
            EdPesquisar.SetFocus;
            Exit;
          end;

          VFilter.TipoConsulta := TpCCodigo;
          VFilter.Codigo       := StrToInt( EdPesquisar.Text );
        end;
      1:
        begin
          if Length( EdPesquisar.Text ) < 3 then
          begin
            MessageDlg( 'Digite ao menos 3 caracteres para consulta!!', MtInformation, [ MbOK ], 0 );
            EdPesquisar.SetFocus;
            Exit;
          end;
          VFilter.TipoConsulta := TpCParam;
          VFilter.Parametro    := Uppercase( EdPesquisar.Text );
        end;
      2:
        begin
          VFilter.TipoConsulta := TpCTODOS;
        end;
    end;

    Lista := ClienteControl.Consulta( VFilter );
    if Lista <> nil then
    begin
      for I := 0 to Lista.Count - 1 do
      begin
        TDset_Clientes.Append;
        TDset_Clientescodigo.Value      := TClientes( Lista.Items[ I ] ).Codigo;
        TDset_ClientesTelefone.AsString := TClientes( Lista.Items[ I ] ).Telefone;
        TDset_ClientesCPF.AsString      := TClientes( Lista.Items[ I ] ).CPF;
        TDset_ClientesCliente.AsString  := TClientes( Lista.Items[ I ] ).Nome;
        TDset_Clientes.Post;
      end;
    end;
    TDset_Clientes.EnableControls;
  finally
    VFilter.Free;
    Lista.Free;
  end;
end;

procedure TFrm_Consulta_Cliente.DBGrid1DblClick( Sender: TObject );
begin
  inherited;
  if IsSelecionar then
    Self.SelecionaRegistro;
end;

procedure TFrm_Consulta_Cliente.Excluir;
begin
  inherited;
  if TDset_Clientes.IsEmpty then
  begin
    MessageDlg( 'Nenhum registro selecionado!!', MtInformation, [ MbOK ], 0 );
    Exit;
  end;
  if MessageDlg( 'Tem certeza que deseja Excluir o registro: ' +
              IntToStr( TDset_Clientescodigo.AsInteger ) + ' - '
              + TDset_Clientescliente.AsString + '?', MtInformation, [ MbNo, MbYes ], 0 ) = MrYes then
  begin
    if ClienteControl.Deletar( TDset_Clientescodigo.AsInteger ) then
      Self.Consultar;
  end;

end;

procedure TFrm_Consulta_Cliente.FormCreate( Sender: TObject );
begin
  inherited;
  ClienteControl := nil;
  ClienteControl.GetInstance( ClienteControl, Self );

  TDset_Clientes.AfterScroll := nil;
  if ( not TDset_Clientes.IsEmpty ) then
    TDset_Clientes.EmptyDataSet;
  TDset_Clientes.Active := False;
  TDset_Clientes.DisableControls;
  TDset_Clientes.CreateDataSet;

  TDset_Clientes.Open;
end;

procedure TFrm_Consulta_Cliente.FormDestroy( Sender: TObject );
begin
  ClienteControl.Destroy;
  inherited;

end;

procedure TFrm_Consulta_Cliente.FormShow( Sender: TObject );
begin
  inherited;
  Self.Consultar;
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
var
  Aux: TClientes;
begin
  Aux := TClientes.Create;
  try
    ClienteControl.Recuperar( TDset_Clientescodigo.Value, TObject( Aux ) );
    ClienteControl.GetEntity.CopiarDados( Aux );
    Self.Close;
  finally
    Aux.Free;
  end;
end;

end.
