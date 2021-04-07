unit uDao;

interface

uses
  UFilterSearch,
  System.Classes,
  System.Contnrs,
  System.SysUtils,
  UDM;

type
  Dao = class
  private
  protected
    DM: TDM;
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

{ Dao }

function Dao.Consulta( AFilter: TFilterSearch ): TObjectList;
begin

end;

constructor Dao.Create;
begin
  if not( Assigned( DM ) ) then
    DM := TDM.Create( nil );

  try
    if not( DM.Conexao.Connected ) then
      DM.Conexao.Connected := True;

    if not( DM.Trans.Active ) then
      DM.Conexao.Open( );
  except

  end;
end;

function Dao.Deletar( const VID: Integer ): Boolean;
begin

end;

destructor Dao.Destroy;
begin
  if Assigned( DM ) then
    FreeAndNil( DM );
end;

function Dao.Editar( var Value: TObject ): Boolean;
begin

end;

function Dao.Inserir( var Value: TObject ): Boolean;
begin

end;

function Dao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
begin

end;

procedure Dao.SetDM( Value: TObject );
begin
  // ADM := TDM( Value );
  // try
  // if not( ADM.Conexao.Connected ) then
  // ADM.Conexao.Connected := True;
  //
  // if not( ADM.Trans.Active ) then
  // ADM.Conexao.Open( );
  // except
  //
  // end;
end;

end.
