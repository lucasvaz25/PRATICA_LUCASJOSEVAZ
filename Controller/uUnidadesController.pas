unit uUnidadesController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UFilterSearch,
  UController,
  UUnidadesDao,
  UUnidades,

  Datasnap.DBClient;

type
  TUnidadesController = class( TController )
  protected
    UnidadeDao: TUnidadesDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TUnidadesController; OWner: TComponent ): TUnidadesController;
    function GetEntity: TUnidades;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;

  end;

implementation

{ TUnidadesController }

function TUnidadesController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := UnidadeDao.Consulta( AFilter );
end;

constructor TUnidadesController.Create;
begin
  inherited;
  UnidadeDao := TUnidadesDao.Create;
end;

function TUnidadesController.Deletar( const VID: Integer ): Boolean;
begin
  Result := UnidadeDao.Deletar( VID );
end;

destructor TUnidadesController.Destroy;
begin
  UnidadeDao.Destroy;
  inherited;
end;

function TUnidadesController.Editar( var Value: TObject ): Boolean;
begin
  Result := UnidadeDao.Editar( Value );
end;

procedure TUnidadesController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TUnidadesController.GetEntity: TUnidades;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TUnidades.Create;
  Result        := TUnidades( Self.Entity );
end;

function TUnidadesController.GetInstance( var Instance: TUnidadesController;
            OWner: TComponent ): TUnidadesController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TUnidadesController.Create;
  Result     := Instance;
end;

function TUnidadesController.Inserir( var Value: TObject ): Boolean;
begin
  Result := UnidadeDao.Inserir( Value );
end;

function TUnidadesController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := UnidadeDao.Recuperar( VID, Obj );
end;

function TUnidadesController.VerificaExiste( Str: string ): Boolean;
begin
  Result := UnidadeDao.VerificaExiste( Str );
end;

end.
