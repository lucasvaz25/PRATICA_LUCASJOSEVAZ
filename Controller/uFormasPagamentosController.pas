unit uFormasPagamentosController;

interface

uses
  UFilterSearch,
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UController,
  UFormasPagamentosDao,
  UFormasPagamentos,
  Datasnap.DBClient;

type
  TFormasPagamentosController = class( TController )
  protected
    FormaPgto: TFormasPagamentosDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TFormasPagamentosController; OWner: TComponent ): TFormasPagamentosController;
    function GetEntity: TFormasPagamentos;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
  end;

implementation

{ TFormasPagamentosController }

function TFormasPagamentosController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := FormaPgto.Consulta( AFilter );
end;

constructor TFormasPagamentosController.Create;
begin
  inherited;
  FormaPgto := TFormasPagamentosDao.Create;
end;

function TFormasPagamentosController.Deletar( const VID: Integer ): Boolean;
begin
  Result := FormaPgto.Deletar( VID );
end;

destructor TFormasPagamentosController.Destroy;
begin
  FormaPgto.Destroy;
  inherited;
end;

function TFormasPagamentosController.Editar( var Value: TObject ): Boolean;
begin
  Result := FormaPgto.Editar( Value );
end;

procedure TFormasPagamentosController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TFormasPagamentosController.GetEntity: TFormasPagamentos;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TFormasPagamentos.Create;
  Result        := TFormasPagamentos( Self.Entity );
end;

function TFormasPagamentosController.GetInstance(
            var Instance: TFormasPagamentosController;
            OWner: TComponent ): TFormasPagamentosController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TFormasPagamentosController.Create;
  Result     := Instance;
end;

function TFormasPagamentosController.Inserir( var Value: TObject ): Boolean;
begin
  Result := FormaPgto.Inserir( Value );
end;

function TFormasPagamentosController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := FormaPgto.Recuperar( VID, Obj );
end;

function TFormasPagamentosController.VerificaExiste( Str: string ): Boolean;
begin
  Result := FormaPgto.VerificaExiste( Str );
end;

end.
