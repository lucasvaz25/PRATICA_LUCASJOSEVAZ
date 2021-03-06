unit uFornecedoresController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UFilterSearch,
  UController,
  UFornecedoresDao,
  UFornecedores,

  Datasnap.DBClient;

type
  TFornecedoresController = class( TController )
  protected
    FornecedorDao: TFornecedoresDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TFornecedoresController; OWner: TComponent ): TFornecedoresController;
    function GetEntity: TFornecedores;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
    function VerificaExisteCPF_CNPJ( Str: string ): Boolean;

  end;

implementation

{ TFornecedoresController }

function TFornecedoresController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := FornecedorDao.Consulta( AFilter );
end;

constructor TFornecedoresController.Create;
begin
  inherited;
  FornecedorDao := TFornecedoresDao.Create;
end;

function TFornecedoresController.Deletar( const VID: Integer ): Boolean;
begin
  Result := FornecedorDao.Deletar( VID );
end;

destructor TFornecedoresController.Destroy;
begin
  FornecedorDao.Destroy;
  inherited;
end;

function TFornecedoresController.Editar( var Value: TObject ): Boolean;
begin
  Result := FornecedorDao.Editar( Value );
end;

procedure TFornecedoresController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TFornecedoresController.GetEntity: TFornecedores;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TFornecedores.Create;
  Result        := TFornecedores( Self.Entity );
end;

function TFornecedoresController.GetInstance( var Instance: TFornecedoresController;
            OWner: TComponent ): TFornecedoresController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TFornecedoresController.Create;
  Result     := Instance;
end;

function TFornecedoresController.Inserir( var Value: TObject ): Boolean;
begin
  Result := FornecedorDao.Inserir( Value );
end;

function TFornecedoresController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := FornecedorDao.Recuperar( VID, Obj );
end;

function TFornecedoresController.VerificaExiste( Str: string ): Boolean;
begin
  Result := FornecedorDao.VerificaExiste( Str );
end;

function TFornecedoresController.VerificaExisteCPF_CNPJ( Str: string ): Boolean;
begin
  Result := FornecedorDao.VerificaExisteCPF_CNPJ( Str );
end;

end.
