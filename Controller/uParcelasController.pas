unit uParcelasController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,
  System.Generics.Collections,

  UFilterSearch,
  UController,
  UParcelasDao,
  UParcelas,

  Datasnap.DBClient;

type
  TParcelasController = class( TController )
  protected
    ParcelaDao: TParcelasDao;
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
    function InserirLista( Lista: TObjectList<TParcelas> ): Boolean;
    function ExcluirListaParcelas( const Cod_CondPgto: Integer ): Boolean;

  end;

implementation

{ TParcelasController }

function TParcelasController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := ParcelaDao.Consulta( AFilter );
end;

constructor TParcelasController.Create;
begin
  inherited;
  ParcelaDao := TParcelasDao.Create;
end;

function TParcelasController.Deletar( const VID: Integer ): Boolean;
begin
  Result := ParcelaDao.Deletar( VID );
end;

destructor TParcelasController.Destroy;
begin
  ParcelaDao.Destroy;
  inherited;
end;

function TParcelasController.Editar( var Value: TObject ): Boolean;
begin
  Result := ParcelaDao.Editar( Value );
end;

function TParcelasController.ExcluirListaParcelas(
            const Cod_CondPgto: Integer ): Boolean;
begin
  Result := ParcelaDao.ExcluirListaParcelas( Cod_CondPgto );
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
  Result := ParcelaDao.Inserir( Value );
end;

function TParcelasController.InserirLista(
            Lista: TObjectList<TParcelas> ): Boolean;
begin
  Result := ParcelaDao.InserirLista( Lista );
end;

function TParcelasController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := ParcelaDao.Recuperar( VID, Obj );
end;

function TParcelasController.VerificaExiste( Str: string ): Boolean;
begin
  Result := ParcelaDao.VerificaExiste( Str );
end;

end.
