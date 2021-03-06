unit uClientesController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UFilterSearch,
  UController,
  UClientesDao,
  UClientes,

  Datasnap.DBClient;

type
  TClientesController = class( TController )
  protected
    ClienteDao: TClientesDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TClientesController; OWner: TComponent ): TClientesController;
    function GetEntity: TClientes;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
    function VerificaExisteCPF_CNPJ( Str: string ): Boolean;

  end;

implementation

{ TClientesController }

function TClientesController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := ClienteDao.Consulta( AFilter );
end;

constructor TClientesController.Create;
begin
  inherited;
  ClienteDao := TClientesDao.Create;
end;

function TClientesController.Deletar( const VID: Integer ): Boolean;
begin
  Result := ClienteDao.Deletar( VID );
end;

destructor TClientesController.Destroy;
begin
  ClienteDao.Destroy;
  inherited;
end;

function TClientesController.Editar( var Value: TObject ): Boolean;
begin
  Result := ClienteDao.Editar( Value );
end;

procedure TClientesController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TClientesController.GetEntity: TClientes;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TClientes.Create;
  Result        := TClientes( Self.Entity );
end;

function TClientesController.GetInstance( var Instance: TClientesController;
            OWner: TComponent ): TClientesController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TClientesController.Create;
  Result     := Instance;
end;

function TClientesController.Inserir( var Value: TObject ): Boolean;
begin
  Result := ClienteDao.Inserir( Value );
end;

function TClientesController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := ClienteDao.Recuperar( VID, Obj );
end;

function TClientesController.VerificaExiste( Str: string ): Boolean;
begin
  Result := ClienteDao.VerificaExiste( Str );
end;

function TClientesController.VerificaExisteCPF_CNPJ( Str: string ): Boolean;
begin
  Result := Self.ClienteDao.VerificaExisteCPF_CNPJ( Str );
end;

end.
