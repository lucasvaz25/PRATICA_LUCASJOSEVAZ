unit uController;

interface

uses
  UFilterSearch,
  System.Classes,
  System.Contnrs,
  System.SysUtils;

type
  TController = class
  private
  protected
    Entity: TObject;
  public
    constructor Create;
    destructor Destroy;

    function Inserir( var Value: TObject ): Boolean; virtual;
    function Editar( var Value: TObject ): Boolean; virtual;
    function Deletar( const VID: Integer ): Boolean; virtual;
    function Consulta( AFilter: TFilterSearch ): TObjectList; virtual;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; virtual;
    procedure SetDM( Value: TObject ); virtual;
  end;

implementation

{ TController }

function TController.Consulta( AFilter: TFilterSearch ): TObjectList;
begin

end;

constructor TController.Create;
begin

end;

function TController.Deletar( const VID: Integer ): Boolean;
begin

end;

destructor TController.Destroy;
begin

end;

function TController.Editar( var Value: TObject ): Boolean;
begin

end;

function TController.Inserir( var Value: TObject ): Boolean;
begin

end;

function TController.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
begin

end;

procedure TController.SetDM( Value: TObject );
begin

end;

end.
