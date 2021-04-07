unit uPaisesController;

interface

uses
  UFilterSearch,
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UController,
  UPaisesDao,
  UPaises;

type
  TPaisesController = class( TController )
  protected
    PaisDao: TPaisesDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetEntity: TPais;
    function GetInstance( var Instance: TPaisesController; OWner: TComponent ): TPaisesController;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
  end;

implementation

{ TPaisesController }

function TPaisesController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := PaisDao.Consulta( AFilter );
end;

constructor TPaisesController.Create;
begin
  inherited;
  PaisDao := TPaisesDao.Create;
end;

function TPaisesController.Deletar( const VID: Integer ): Boolean;
begin
  Result := PaisDao.Deletar( VID );
end;

destructor TPaisesController.Destroy;
begin
  PaisDao.Destroy;
  inherited;
end;

function TPaisesController.Editar( var Value: TObject ): Boolean;
begin
  Result := PaisDao.Editar( Value );
end;

procedure TPaisesController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TPaisesController.GetEntity: TPais;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TPais.Create;
  Result        := TPais( Self.Entity );
end;

function TPaisesController.GetInstance( var Instance: TPaisesController;
            OWner: TComponent ): TPaisesController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TPaisesController.Create;
  Result     := Instance;
end;

function TPaisesController.Inserir( var Value: TObject ): Boolean;
begin
  Result := PaisDao.Inserir( Value );
end;

function TPaisesController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := PaisDao.Recuperar( VID, Obj );
end;

procedure TPaisesController.SetDM( Value: TObject );
begin
  PaisDao.SetDM( Value );
end;

function TPaisesController.VerificaExiste( Str: string ): Boolean;
begin
  Result := PaisDao.VerificaExiste( Str );
end;

end.
