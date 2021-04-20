unit uUnidadesDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UUnidades;

type
  TUnidadesDao = class( DAO )
  private
    procedure FieldsToObj( var Value: TUnidades );
    procedure ObjToFields( var Value: TUnidades );
  public
    constructor Create;
    destructor Destroy;

    function Inserir( var Value: TObject ): Boolean; override;
    function Editar( var Value: TObject ): Boolean; override;
    function Deletar( const VID: Integer ): Boolean; override;
    function Consulta( AFilter: TFilterSearch ): TObjectList; override;
    function Recuperar( const VID: Integer; out Obj: TObject ): Boolean; override;
    // procedure SetDM( Value: TObject ); override;
    function VerificaExiste( Str: string ): Boolean;
  end;

implementation

{ TUnidadesDao }

function TUnidadesDao.Consulta( AFilter: TFilterSearch ): TObjectList;
begin

end;

constructor TUnidadesDao.Create;
begin

end;

function TUnidadesDao.Deletar( const VID: Integer ): Boolean;
begin

end;

destructor TUnidadesDao.Destroy;
begin

end;

function TUnidadesDao.Editar( var Value: TObject ): Boolean;
begin

end;

procedure TUnidadesDao.FieldsToObj( var Value: TUnidades );
begin

end;

function TUnidadesDao.Inserir( var Value: TObject ): Boolean;
begin

end;

procedure TUnidadesDao.ObjToFields( var Value: TUnidades );
begin

end;

function TUnidadesDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
begin

end;

function TUnidadesDao.VerificaExiste( Str: string ): Boolean;
begin

end;

end.
