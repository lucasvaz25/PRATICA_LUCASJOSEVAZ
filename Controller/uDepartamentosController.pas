unit uDepartamentosController;

interface

uses
  UFilterSearch,
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UController,
  UDepartamentosDao,
  UDepartamentos,
  Datasnap.DBClient;

type
  TDepartamentosController = class( TController )
  protected
    DeptDao: TDepartamentosDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TDepartamentosController; OWner: TComponent ): TDepartamentosController;
    function GetEntity: TDepartamentos;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
  end;

implementation

{ TDepartamentosController }

function TDepartamentosController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := DeptDao.Consulta( AFilter );
end;

constructor TDepartamentosController.Create;
begin
  inherited;
  DeptDao := TDepartamentosDao.Create;
end;

function TDepartamentosController.Deletar( const VID: Integer ): Boolean;
begin
  Result := DeptDao.Deletar( VID );
end;

destructor TDepartamentosController.Destroy;
begin
  DeptDao.Destroy;
  inherited;
end;

function TDepartamentosController.Editar( var Value: TObject ): Boolean;
begin
  Result := DeptDao.Editar( Value );
end;

procedure TDepartamentosController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TDepartamentosController.GetEntity: TDepartamentos;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TDepartamentos.Create;
  Result        := TDepartamentos( Self.Entity );
end;

function TDepartamentosController.GetInstance(
            var Instance: TDepartamentosController;
            OWner: TComponent ): TDepartamentosController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TDepartamentosController.Create;
  Result     := Instance;
end;

function TDepartamentosController.Inserir( var Value: TObject ): Boolean;
begin
  Result := DeptDao.Inserir( Value );
end;

function TDepartamentosController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := DeptDao.Recuperar( VID, Obj );
end;

function TDepartamentosController.VerificaExiste( Str: string ): Boolean;
begin
  Result := DeptDao.VerificaExiste( Str );
end;

end.
