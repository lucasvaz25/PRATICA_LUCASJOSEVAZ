unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    Trans: TFDTransaction;
    QryPaises: TFDQuery;
    QryEstados: TFDQuery;
    QryCidades: TFDQuery;
    QryDepartamentos: TFDQuery;
    QryCond_Pag: TFDQuery;
    QryCargos: TFDQuery;
    QryGrupos: TFDQuery;
    QrySubgrupos: TFDQuery;
    QryClientes: TFDQuery;
    QryFuncionarios: TFDQuery;
    QryF_Pagamentos: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
