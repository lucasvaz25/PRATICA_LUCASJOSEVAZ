unit uGruposController;

interface

uses
  UFilterSearch,
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UController,
  UgruposDao,
  UGrupos,
  Datasnap.DBClient;

type
  TGruposController = class( TController )
  protected
    GrupoDao: TGruposDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TGruposController; OWner: TComponent ): TGruposController;
    function GetEntity: TGrupos;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
    procedure PopularLkpGrupo( DataSet: TClientDataSet );
  end;

implementation

{ TGruposController }

function TGruposController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := GrupoDao.Consulta( AFilter );
end;

constructor TGruposController.Create;
begin
  inherited;
  GrupoDao := TGruposDao.Create;
end;

function TGruposController.Deletar( const VID: Integer ): Boolean;
begin
  Result := GrupoDao.Deletar( VID );
end;

destructor TGruposController.Destroy;
begin
  GrupoDao.Destroy;
  inherited;
end;

function TGruposController.Editar( var Value: TObject ): Boolean;
begin
  Result := GrupoDao.Editar( Value );
end;

procedure TGruposController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TGruposController.GetEntity: TGrupos;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TGrupos.Create;
  Result        := TGrupos( Self.Entity );
end;

function TGruposController.GetInstance( var Instance: TGruposController;
            OWner: TComponent ): TGruposController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TGruposController.Create;
  Result     := Instance;
end;

function TGruposController.Inserir( var Value: TObject ): Boolean;
begin
  Result := GrupoDao.Inserir( Value );
end;

procedure TGruposController.PopularLkpGrupo( DataSet: TClientDataSet );
begin
  GrupoDao.PopularLkpGrupo( DataSet );
end;

function TGruposController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := GrupoDao.Recuperar( VID, Obj );
end;

function TGruposController.VerificaExiste( Str: string ): Boolean;
begin
  Result := GrupoDao.VerificaExiste( Str );
end;

end.
