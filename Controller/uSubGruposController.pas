unit uSubGruposController;

interface

uses
  UFilterSearch,
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UController,
  USubGruposDao,
  USubGrupos;

type
  TSubGruposController = class( TController )
  protected
    SubGrupoDao: TSubGruposDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TSubGruposController; OWner: TComponent ): TSubGruposController;
    function GetEntity: TSubGrupos;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
  end;

implementation

{ TSubGruposController }

function TSubGruposController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := SubGrupoDao.Consulta( AFilter );
end;

constructor TSubGruposController.Create;
begin
  inherited;
  SubGrupoDao := TSubGruposDao.Create;
end;

function TSubGruposController.Deletar( const VID: Integer ): Boolean;
begin
  Result := SubGrupoDao.Deletar( VID );
end;

destructor TSubGruposController.Destroy;
begin
  SubGrupoDao.Destroy;
  inherited;
end;

function TSubGruposController.Editar( var Value: TObject ): Boolean;
begin
  Result := SubGrupoDao.Editar( Value );
end;

procedure TSubGruposController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TSubGruposController.GetEntity: TSubGrupos;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TSubGrupos.Create;
  Result        := TSubGrupos( Self.Entity );
end;

function TSubGruposController.GetInstance( var Instance: TSubGruposController;
            OWner: TComponent ): TSubGruposController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TSubGruposController.Create;
  Result     := Instance;
end;

function TSubGruposController.Inserir( var Value: TObject ): Boolean;
begin
  Result := SubGrupoDao.Inserir( Value );
end;

function TSubGruposController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := SubGrupoDao.Recuperar( VID, Obj );
end;

function TSubGruposController.VerificaExiste( Str: string ): Boolean;
begin
  Result := SubGrupoDao.VerificaExiste( Str );
end;

end.
