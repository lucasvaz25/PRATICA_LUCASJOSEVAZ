unit uParcelasController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UFilterSearch,
  UController,
  UParcelasDao,
  UParcelas,

  Datasnap.DBClient;

type
  TParcelasController = class( TController )
  protected
    DepositoDao: TParcelasDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TParcelasController; OWner: TComponent ): TParcelasController;
    function GetEntity: TParcelas;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;

  end;

implementation

{ TParcelasController }

function TParcelasController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := DepositoDao.Consulta( AFilter );
end;

constructor TParcelasController.Create;
begin
  inherited;
  DepositoDao := TParcelasDao.Create;
end;

function TParcelasController.Deletar( const VID: Integer ): Boolean;
begin
  Result := DepositoDao.Deletar( VID );
end;

destructor TParcelasController.Destroy;
begin
  DepositoDao.Destroy;
  inherited;
end;

function TParcelasController.Editar( var Value: TObject ): Boolean;
begin
  Result := DepositoDao.Editar( Value );
end;

procedure TParcelasController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TParcelasController.GetEntity: TParcelas;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TParcelas.Create;
  Result        := TParcelas( Self.Entity );
end;

function TParcelasController.GetInstance( var Instance: TParcelasController;
            OWner: TComponent ): TParcelasController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TParcelasController.Create;
  Result     := Instance;
end;

function TParcelasController.Inserir( var Value: TObject ): Boolean;
begin
  Result := DepositoDao.Inserir( Value );
end;

function TParcelasController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := DepositoDao.Recuperar( VID, Obj );
end;

function TParcelasController.VerificaExiste( Str: string ): Boolean;
begin
  Result := DepositoDao.VerificaExiste( Str );
end;

end.
