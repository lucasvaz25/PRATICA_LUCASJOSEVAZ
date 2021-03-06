unit uEstadosController;

interface

uses
  UFilterSearch,
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UController,
  UEstadosDao,
  UEstados;

type
  TEstadosController = class( TController )
  protected
    EstadoDao: TEstadosDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TEstadosController; OWner: TComponent ): TEstadosController;
    function GetEntity: TEstado;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
  end;

implementation

{ TEstadosController }

function TEstadosController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := EstadoDao.Consulta( AFilter );
end;

constructor TEstadosController.Create;
begin
  inherited;
  EstadoDao := TEstadosDao.Create;
end;

function TEstadosController.Deletar( const VID: Integer ): Boolean;
begin
  Result := EstadoDao.Deletar( VID );
end;

destructor TEstadosController.Destroy;
begin
  EstadoDao.Destroy;
  inherited;
end;

function TEstadosController.Editar( var Value: TObject ): Boolean;
begin
  Result := EstadoDao.Editar( Value );
end;

procedure TEstadosController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TEstadosController.GetEntity: TEstado;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TEstado.Create;
  Result        := TEstado( Self.Entity );
end;

function TEstadosController.GetInstance( var Instance: TEstadosController;
            OWner: TComponent ): TEstadosController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TEstadosController.Create;
  Result     := Instance;
end;

function TEstadosController.Inserir( var Value: TObject ): Boolean;
begin
  Result := EstadoDao.Inserir( Value );
end;

function TEstadosController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := EstadoDao.Recuperar( VID, Obj );
end;

function TEstadosController.VerificaExiste( Str: string ): Boolean;
begin
  Result := EstadoDao.VerificaExiste( Str );
end;

end.
