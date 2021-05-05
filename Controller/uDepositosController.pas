unit uDepositosController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UFilterSearch,
  UController,
  UDepositosDao,
  UDepositos,

  Datasnap.DBClient;

type
  TDepositosController = class( TController )
  protected
    DepositoDao: TDepositosDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TDepositosController; OWner: TComponent ): TDepositosController;
    function GetEntity: TDepositos;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;

  end;

implementation

{ TDepositosController }

function TDepositosController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := DepositoDao.Consulta( AFilter );
end;

constructor TDepositosController.Create;
begin
  inherited;
  DepositoDao := TDepositosDao.Create;
end;

function TDepositosController.Deletar( const VID: Integer ): Boolean;
begin
  Result := DepositoDao.Deletar( VID );
end;

destructor TDepositosController.Destroy;
begin
  DepositoDao.Destroy;
  inherited;
end;

function TDepositosController.Editar( var Value: TObject ): Boolean;
begin
  Result := DepositoDao.Editar( Value );
end;

procedure TDepositosController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TDepositosController.GetEntity: TDepositos;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TDepositos.Create;
  Result        := TDepositos( Self.Entity );
end;

function TDepositosController.GetInstance( var Instance: TDepositosController;
            OWner: TComponent ): TDepositosController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TDepositosController.Create;
  Result     := Instance;
end;

function TDepositosController.Inserir( var Value: TObject ): Boolean;
begin
  Result := DepositoDao.Inserir( Value );
end;

function TDepositosController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := DepositoDao.Recuperar( VID, Obj );
end;

function TDepositosController.VerificaExiste( Str: string ): Boolean;
begin
  Result := DepositoDao.VerificaExiste( Str );
end;

end.
