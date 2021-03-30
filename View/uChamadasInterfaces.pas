unit uChamadasInterfaces;

interface

uses
  UFrm_Consulta_Paises,
  UFrm_Consulta_Estados,
  UFrm_Consulta_Cidades,
  UFrm_Consulta_Grupos,
  UFrm_Consulta_SubGrupos,
  System.Classes;

type
  TchamadasInterfaces = class
  private
  protected
    ConsultaPaises: TFrm_ConsultaPaises;
    ConsultaEstados: TFrm_Consulta_Estados;
    ConsultaCidades: TFrm_Consulta_Cidades;
    ConsultaGrupos: TFrm_Consulta_Grupos;
    ConsultaSubGrupos: TFrm_Consulta_SubGrupos;
  public
    constructor Create( Owner: TComponent );
    destructor Destroy;
    procedure Free;

    procedure ChamadaConsultaPaises( Parent: TObject ); overload;
    procedure ChamadaConsultaPaises; overload;

    procedure ChamadaConsultaEstados( Parent: TObject ); overload;
    procedure ChamadaConsultaEstados; overload;

    procedure ChamadaConsultaCidades( Parent: TObject ); overload;
    procedure ChamadaConsultaCidades; overload;

    procedure ChamadaConsultaGrupos( Parent: TObject ); overload;
    procedure ChamadaConsultaGrupos; overload;

    procedure ChamadaConsultaSubGrupos( Parent: TObject ); overload;
    procedure ChamadaConsultaSubGrupos; overload;
  end;

implementation

uses
  Vcl.ExtCtrls,
  Vcl.Controls,
  Vcl.Forms;

{ TchamadasInterfaces }

procedure TchamadasInterfaces.ChamadaConsultaEstados( Parent: TObject );
begin
  ConsultaEstados.Parent      := TPanel( Parent );
  ConsultaEstados.Align       := Alclient;
  ConsultaEstados.BorderStyle := BsNone;
  TPanel( Parent ).Tag        := 1;
  ConsultaEstados.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaPaises( Parent: TObject );
begin
  ConsultaPaises.Parent      := TPanel( Parent );
  ConsultaPaises.Align       := Alclient;
  ConsultaPaises.BorderStyle := BsNone;
  TPanel( Parent ).Tag       := 0;
  ConsultaPaises.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaPaises;
begin
  ConsultaPaises.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaSubGrupos;
begin
  ConsultaSubGrupos.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaSubGrupos( Parent: TObject );
begin
  ConsultaSubGrupos.Parent      := TPanel( Parent );
  ConsultaSubGrupos.Align       := Alclient;
  ConsultaSubGrupos.BorderStyle := BsNone;
  TPanel( Parent ).Tag          := 0;
  ConsultaSubGrupos.Show;
end;

constructor TchamadasInterfaces.Create( Owner: TComponent );
begin
  ConsultaPaises    := TFrm_ConsultaPaises.Create( Owner );
  ConsultaEstados   := TFrm_Consulta_Estados.Create( Owner );
  ConsultaCidades   := TFrm_Consulta_Cidades.Create( Owner );
  ConsultaGrupos    := TFrm_Consulta_Grupos.Create( Owner );
  ConsultaSubGrupos := TFrm_Consulta_SubGrupos.Create( Owner );
end;

destructor TchamadasInterfaces.Destroy;
begin
  ConsultaPaises.Release;
  ConsultaEstados.Release;
  ConsultaCidades.Release;
  ConsultaGrupos.Release;
  ConsultaSubGrupos.Release;
end;

procedure TchamadasInterfaces.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TchamadasInterfaces.ChamadaConsultaCidades;
begin
  ConsultaCidades.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaCidades( Parent: TObject );
begin
  ConsultaCidades.Parent      := TPanel( Parent );
  ConsultaCidades.Align       := Alclient;
  ConsultaCidades.BorderStyle := BsNone;
  TPanel( Parent ).Tag        := 1;
  ConsultaCidades.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaEstados;
begin
  ConsultaEstados.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaGrupos;
begin
  ConsultaGrupos.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaGrupos( Parent: TObject );
begin
  ConsultaGrupos.Parent      := TPanel( Parent );
  ConsultaGrupos.Align       := Alclient;
  ConsultaGrupos.BorderStyle := BsNone;
  TPanel( Parent ).Tag       := 1;
  ConsultaGrupos.Show;
end;

end.