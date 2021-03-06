unit uChamadasInterfaces;

interface

uses
  UFrm_Consulta_Paises,
  UFrm_Consulta_Estados,
  UFrm_Consulta_Cidades,
  UFrm_Consulta_Grupos,
  UFrm_Consulta_SubGrupos,
  UFrm_Consulta_Departamentos,
  UFrm_Consulta_Unidades,
  UFrm_Consulta_Depositos,
  UFrm_Consulta_Cargos,
  UFrm_Consulta_Clientes,
  UFrm_Consulta_Fornecedores,
  UFrm_Consulta_Funcionarios,
  UFrm_Consulta_Produtos,
  UFrm_Consulta_OrdemProducao,
  UFrm_Consulta_CondicaoPagamento,
  UFrm_Consulta_FormasPagamentos,
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
    ConsultaDepartamentos: TFrm_Consulta_Departamentos;
    ConsultaUnidades: TFrm_Consulta_Unidades;
    ConsultaDepositos: TFrm_Consulta_Depositos;
    ConsultaCargos: TFrm_Consulta_Cargos;
    ConsultaClientes: TFrm_Consulta_Cliente;
    ConsultaFornecedores: TFrm_Consulta_Fornecedores;
    ConsultaFuncionarios: TFrm_Consulta_Funcionario;
    ConsultaProdutos: TFrm_Consulta_Produtos;
    ConsultaOrdemProducao: TFrm_Consulta_OrdemProducao;
    ConsultaCondPagamento: TFrm_Consulta_CondicaoPagamento;
    ConsultaFormaPgto: TFrm_Consulta_FormasPagamentos;

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

    procedure ChamadaConsultaDepartamentos( Parent: TObject ); overload;
    procedure ChamadaConsultaDepartamentos; overload;

    procedure ChamadaConsultaUnidades( Parent: TObject ); overload;
    procedure ChamadaConsultaUnidades; overload;

    procedure ChamadaConsultaDepositos( Parent: TObject ); overload;
    procedure ChamadaConsultaDepositos; overload;

    procedure ChamadaConsultaCargos( Parent: TObject ); overload;
    procedure ChamadaConsultaCargos; overload;

    procedure ChamadaConsultaClientes( Parent: TObject ); overload;
    procedure ChamadaConsultaClientes; overload;

    procedure ChamadaConsultaFornecedores( Parent: TObject ); overload;
    procedure ChamadaConsultaFornecedores; overload;

    procedure ChamadaConsultaFuncionarios( Parent: TObject ); overload;
    procedure ChamadaConsultaFuncionarios; overload;

    procedure ChamadaConsultaProdutos( Parent: TObject ); overload;
    procedure ChamadaConsultaProdutos; overload;

    procedure ChamadaConsultaOrdemProducao( Parent: TObject ); overload;
    procedure ChamadaConsultaOrdemProducao; overload;

    procedure ChamadaConsultaCondPagamento( Parent: TObject ); overload;
    procedure ChamadaConsultaCondPagamento; overload;

    procedure ChamadaConsultaFormaPgto( Parent: TObject ); overload;
    procedure ChamadaConsultaFormaPgto; overload;
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

procedure TchamadasInterfaces.ChamadaConsultaProdutos;
begin
  ConsultaProdutos.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaProdutos( Parent: TObject );
begin
  ConsultaProdutos.Parent      := TPanel( Parent );
  ConsultaProdutos.Align       := Alclient;
  ConsultaProdutos.BorderStyle := BsNone;
  TPanel( Parent ).Tag         := 0;
  ConsultaProdutos.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaSubGrupos;
begin
  ConsultaSubGrupos.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaUnidades;
begin
  ConsultaUnidades.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaUnidades( Parent: TObject );
begin
  ConsultaUnidades.Parent      := TPanel( Parent );
  ConsultaUnidades.Align       := Alclient;
  ConsultaUnidades.BorderStyle := BsNone;
  TPanel( Parent ).Tag         := 0;
  ConsultaUnidades.Show;
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
  ConsultaPaises        := TFrm_ConsultaPaises.Create( Owner );
  ConsultaEstados       := TFrm_Consulta_Estados.Create( Owner );
  ConsultaCidades       := TFrm_Consulta_Cidades.Create( Owner );
  ConsultaGrupos        := TFrm_Consulta_Grupos.Create( Owner );
  ConsultaSubGrupos     := TFrm_Consulta_SubGrupos.Create( Owner );
  ConsultaDepartamentos := TFrm_Consulta_Departamentos.Create( Owner );
  ConsultaUnidades      := TFrm_Consulta_Unidades.Create( Owner );
  ConsultaDepositos     := TFrm_Consulta_Depositos.Create( Owner );
  ConsultaCargos        := TFrm_Consulta_Cargos.Create( Owner );
  ConsultaClientes      := TFrm_Consulta_Cliente.Create( Owner );
  ConsultaFornecedores  := TFrm_Consulta_Fornecedores.Create( Owner );
  ConsultaFuncionarios  := TFrm_Consulta_Funcionario.Create( Owner );
  ConsultaProdutos      := TFrm_Consulta_Produtos.Create( Owner );
  ConsultaOrdemProducao := TFrm_Consulta_OrdemProducao.Create( Owner );
  ConsultaCondPagamento := TFrm_Consulta_CondicaoPagamento.Create( Owner );
  ConsultaFormaPgto     := TFrm_Consulta_FormasPagamentos.Create( Owner );
end;

destructor TchamadasInterfaces.Destroy;
begin
  ConsultaPaises.Release;
  ConsultaEstados.Release;
  ConsultaCidades.Release;
  ConsultaGrupos.Release;
  ConsultaSubGrupos.Release;
  ConsultaDepartamentos.Release;
  ConsultaUnidades.Release;
  ConsultaDepositos.Release;
  ConsultaCargos.Release;
  ConsultaClientes.Release;
  ConsultaFornecedores.Release;
  ConsultaFuncionarios.Release;
  ConsultaProdutos.Release;
  ConsultaOrdemProducao.Release;
  ConsultaCondPagamento.Release;
  ConsultaFormaPgto.Release;
end;

procedure TchamadasInterfaces.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TchamadasInterfaces.ChamadaConsultaCargos;
begin
  ConsultaCargos.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaCargos( Parent: TObject );
begin
  ConsultaCargos.Parent      := TPanel( Parent );
  ConsultaCargos.Align       := Alclient;
  ConsultaCargos.BorderStyle := BsNone;
  TPanel( Parent ).Tag       := 1;
  ConsultaCargos.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaCidades;
begin
  ConsultaCidades.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaClientes;
begin
  ConsultaClientes.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaCondPagamento;
begin
  ConsultaCondPagamento.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaCondPagamento( Parent: TObject );
begin
  ConsultaCondPagamento.Parent      := TPanel( Parent );
  ConsultaCondPagamento.Align       := Alclient;
  ConsultaCondPagamento.BorderStyle := BsNone;
  TPanel( Parent ).Tag              := 1;
  ConsultaCondPagamento.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaClientes( Parent: TObject );
begin
  ConsultaClientes.Parent      := TPanel( Parent );
  ConsultaClientes.Align       := Alclient;
  ConsultaClientes.BorderStyle := BsNone;
  TPanel( Parent ).Tag         := 1;
  ConsultaClientes.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaDepartamentos;
begin
  ConsultaDepartamentos.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaDepositos;
begin
  ConsultaDepositos.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaDepositos( Parent: TObject );
begin
  ConsultaDepositos.Parent      := TPanel( Parent );
  ConsultaDepositos.Align       := Alclient;
  ConsultaDepositos.BorderStyle := BsNone;
  TPanel( Parent ).Tag          := 1;
  ConsultaDepositos.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaDepartamentos( Parent: TObject );
begin
  ConsultaDepartamentos.Parent      := TPanel( Parent );
  ConsultaDepartamentos.Align       := Alclient;
  ConsultaDepartamentos.BorderStyle := BsNone;
  TPanel( Parent ).Tag              := 1;
  ConsultaDepartamentos.Show;
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

procedure TchamadasInterfaces.ChamadaConsultaFormaPgto;
begin
  ConsultaFormaPgto.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaFormaPgto( Parent: TObject );
begin
  ConsultaFormaPgto.Parent      := TPanel( Parent );
  ConsultaFormaPgto.Align       := Alclient;
  ConsultaFormaPgto.BorderStyle := BsNone;
  TPanel( Parent ).Tag          := 1;
  ConsultaFormaPgto.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaFornecedores;
begin
  ConsultaFornecedores.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaFuncionarios;
begin
  ConsultaFuncionarios.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaFuncionarios( Parent: TObject );
begin
  ConsultaFuncionarios.Parent      := TPanel( Parent );
  ConsultaFuncionarios.Align       := Alclient;
  ConsultaFuncionarios.BorderStyle := BsNone;
  TPanel( Parent ).Tag             := 1;
  ConsultaFuncionarios.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaFornecedores( Parent: TObject );
begin
  ConsultaFornecedores.Parent      := TPanel( Parent );
  ConsultaFornecedores.Align       := Alclient;
  ConsultaFornecedores.BorderStyle := BsNone;
  TPanel( Parent ).Tag             := 1;
  ConsultaFornecedores.Show;
end;

procedure TchamadasInterfaces.ChamadaConsultaGrupos;
begin
  ConsultaGrupos.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaOrdemProducao;
begin
  ConsultaOrdemProducao.ShowModal;
end;

procedure TchamadasInterfaces.ChamadaConsultaOrdemProducao( Parent: TObject );
begin
  ConsultaOrdemProducao.Parent      := TPanel( Parent );
  ConsultaOrdemProducao.Align       := Alclient;
  ConsultaOrdemProducao.BorderStyle := BsNone;
  TPanel( Parent ).Tag              := 1;
  ConsultaOrdemProducao.Show;
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
