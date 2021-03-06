unit uCargosController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UFilterSearch,
  UController,
  UCargosDao,
  UCargos,

  Datasnap.DBClient;

type
  TCargosController = class( TController )
  protected
    CargoDao: TCargosDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TCargosController; OWner: TComponent ): TCargosController;
    function GetEntity: TCargos;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;

  end;

implementation

{ TCargosController }

function TCargosController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := CargoDao.Consulta( AFilter );
end;

constructor TCargosController.Create;
begin
  inherited;
  CargoDao := TCargosDao.Create;
end;

function TCargosController.Deletar( const VID: Integer ): Boolean;
begin
  Result := CargoDao.Deletar( VID );
end;

destructor TCargosController.Destroy;
begin
  CargoDao.Destroy;
  inherited;
end;

function TCargosController.Editar( var Value: TObject ): Boolean;
begin
  Result := CargoDao.Editar( Value );
end;

procedure TCargosController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TCargosController.GetEntity: TCargos;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TCargos.Create;
  Result        := TCargos( Self.Entity );
end;

function TCargosController.GetInstance( var Instance: TCargosController;
            OWner: TComponent ): TCargosController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TCargosController.Create;
  Result     := Instance;
end;

function TCargosController.Inserir( var Value: TObject ): Boolean;
begin
  Result := CargoDao.Inserir( Value );
end;

function TCargosController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := CargoDao.Recuperar( VID, Obj );
end;

function TCargosController.VerificaExiste( Str: string ): Boolean;
begin
  Result := CargoDao.VerificaExiste( Str );
end;

end.
