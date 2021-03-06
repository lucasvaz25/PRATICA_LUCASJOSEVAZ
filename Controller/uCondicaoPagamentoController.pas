unit uCondicaoPagamentoController;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UFilterSearch,
  UController,
  UCondicaoPagamentoDao,
  UCondicaoPagamento,

  Datasnap.DBClient;

type
  TCondicaoPagamentoController = class( TController )
  protected
    CondicaoPagamentoDao: TCondicaoPagamentoDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TCondicaoPagamentoController; OWner: TComponent ): TCondicaoPagamentoController;
    function GetEntity: TCondicaoPagamento;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;

  end;

implementation

uses
  UParcelasDao;
{ TCondicaoPagamentoController }

function TCondicaoPagamentoController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin
  Result := CondicaoPagamentoDao.Consulta( AFilter );
end;

constructor TCondicaoPagamentoController.Create;
begin
  inherited;
  CondicaoPagamentoDao := TCondicaoPagamentoDao.Create;
end;

function TCondicaoPagamentoController.Deletar( const VID: Integer ): Boolean;
begin
  Result := CondicaoPagamentoDao.Deletar( VID );
end;

destructor TCondicaoPagamentoController.Destroy;
begin
  CondicaoPagamentoDao.Destroy;
  inherited;
end;

function TCondicaoPagamentoController.Editar( var Value: TObject ): Boolean;
begin
  Result := CondicaoPagamentoDao.Editar( Value );
end;

procedure TCondicaoPagamentoController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TCondicaoPagamentoController.GetEntity: TCondicaoPagamento;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TCondicaoPagamento.Create;
  Result        := TCondicaoPagamento( Self.Entity );
end;

function TCondicaoPagamentoController.GetInstance( var Instance: TCondicaoPagamentoController;
            OWner: TComponent ): TCondicaoPagamentoController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TCondicaoPagamentoController.Create;
  Result     := Instance;
end;

function TCondicaoPagamentoController.Inserir( var Value: TObject ): Boolean;
begin
  Result := CondicaoPagamentoDao.Inserir( Value );
end;

function TCondicaoPagamentoController.Recuperar( const VID: Integer;
            out Obj: TObject ): Boolean;
begin
  Result := CondicaoPagamentoDao.Recuperar( VID, Obj );
end;

function TCondicaoPagamentoController.VerificaExiste( Str: string ): Boolean;
begin
  Result := CondicaoPagamentoDao.VerificaExiste( Str );
end;

end.
