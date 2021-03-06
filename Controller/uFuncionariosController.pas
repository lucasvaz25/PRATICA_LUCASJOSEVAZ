unit uFuncionariosController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UFilterSearch,
  UController,
  UFuncionariosDao,
  UFuncionarios,

  Datasnap.DBClient;

type
  TFuncionariosController = class( TController )
  protected
    FuncionarioDao: TFuncionariosDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TFuncionariosController; OWner: TComponent ): TFuncionariosController;
    function GetEntity: TFuncionarios;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
    function VerificaExisteCPF( Str: string ): Boolean;

  end;

implementation

{ TFuncionariosController }

function TFuncionariosController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := FuncionarioDao.Consulta( AFilter );
end;

constructor TFuncionariosController.Create;
begin
  inherited;
  FuncionarioDao := TFuncionariosDao.Create;
end;

function TFuncionariosController.Deletar( const VID: Integer ): Boolean;
begin
  Result := FuncionarioDao.Deletar( VID );
end;

destructor TFuncionariosController.Destroy;
begin
  FuncionarioDao.Destroy;
  inherited;
end;

function TFuncionariosController.Editar( var Value: TObject ): Boolean;
begin
  Result := FuncionarioDao.Editar( Value );
end;

procedure TFuncionariosController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TFuncionariosController.GetEntity: TFuncionarios;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TFuncionarios.Create;
  Result        := TFuncionarios( Self.Entity );
end;

function TFuncionariosController.GetInstance( var Instance: TFuncionariosController;
            OWner: TComponent ): TFuncionariosController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TFuncionariosController.Create;
  Result     := Instance;
end;

function TFuncionariosController.Inserir( var Value: TObject ): Boolean;
begin
  Result := FuncionarioDao.Inserir( Value );
end;

function TFuncionariosController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := FuncionarioDao.Recuperar( VID, Obj );
end;

function TFuncionariosController.VerificaExiste( Str: string ): Boolean;
begin
  Result := FuncionarioDao.VerificaExiste( Str );
end;

function TFuncionariosController.VerificaExisteCPF( Str: string ): Boolean;
begin
  Result := FuncionarioDao.VerificaExisteCPF( Str );
end;

end.
