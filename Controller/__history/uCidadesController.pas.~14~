unit uCidadesController;

interface

uses
  UFilterSearch,
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UController,
  UCidadesDao,
  UCidades;

type
  TCidadesController = class( TController )
  protected
    CidadeDao: TCidadesDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TCidadesController; OWner: TComponent ): TCidadesController;
    function GetEntity: TCidade;

    function Inserir( const Value: TObject ): Boolean; override;
    function Editar( const Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
  end;

implementation

{ TCidadesController }

function TCidadesController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := CidadeDao.Consulta( AFilter );
end;

constructor TCidadesController.Create;
begin
  inherited;
  CidadeDao := TCidadesDao.Create;
end;

function TCidadesController.Deletar( const VID: Integer ): Boolean;
begin
  Result := CidadeDao.Deletar( VID );
end;

destructor TCidadesController.Destroy;
begin
  CidadeDao.Destroy;
  inherited;
end;

function TCidadesController.Editar( const Value: TObject ): Boolean;
begin
  Result := CidadeDao.Editar( Value );
end;

procedure TCidadesController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TCidadesController.GetEntity: TCidade;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TCidade.Create;
  Result        := TCidade( Self.Entity );
end;

function TCidadesController.GetInstance( var Instance: TCidadesController;
            OWner: TComponent ): TCidadesController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TCidadesController.Create;
  Result     := Instance;
end;

function TCidadesController.Inserir( const Value: TObject ): Boolean;
begin
  Result := CidadeDao.Inserir( Value );
end;

function TCidadesController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := CidadeDao.Recuperar( VID, Obj );
end;

function TCidadesController.VerificaExiste( Str: string ): Boolean;
begin
  Result := CidadeDao.VerificaExiste( Str );
end;

end.
