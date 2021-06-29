unit uProdutosController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UFilterSearch,
  UController,
  UProdutosDao,
  UProdutos,

  Datasnap.DBClient;

type
  TProdutosController = class( TController )
  protected
    ProdutoDao: TProdutosDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TProdutosController; OWner: TComponent ): TProdutosController;
    function GetEntity: TProdutos;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;

  end;

implementation

{ TProdutosController }

function TProdutosController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := ProdutoDao.Consulta( AFilter );
end;

constructor TProdutosController.Create;
begin
  inherited;
  ProdutoDao := TProdutosDao.Create;
end;

function TProdutosController.Deletar( const VID: Integer ): Boolean;
begin
  Result := ProdutoDao.Deletar( VID );
end;

destructor TProdutosController.Destroy;
begin
  ProdutoDao.Destroy;
  inherited;
end;

function TProdutosController.Editar( var Value: TObject ): Boolean;
begin
  Result := ProdutoDao.Editar( Value );
end;

procedure TProdutosController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TProdutosController.GetEntity: TProdutos;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TProdutos.Create;
  Result        := TProdutos( Self.Entity );
end;

function TProdutosController.GetInstance( var Instance: TProdutosController;
            OWner: TComponent ): TProdutosController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TProdutosController.Create;
  Result     := Instance;
end;

function TProdutosController.Inserir( var Value: TObject ): Boolean;
begin
  Result := ProdutoDao.Inserir( Value );
end;

function TProdutosController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := ProdutoDao.Recuperar( VID, Obj );
end;

function TProdutosController.VerificaExiste( Str: string ): Boolean;
begin
  Result := ProdutoDao.VerificaExiste( Str );
end;

end.
