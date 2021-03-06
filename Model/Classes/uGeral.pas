unit uGeral;

interface

uses
  System.Classes;

type
  TGeral = class( TObject )
  private
    FUserAlt: string;
    FDataAlt: TDateTime;
    FCodigo: Integer;
    FId: Integer;
    FUserCad: string;
    FDataCad: TDateTime;
    procedure SetCodigo( const Value: Integer );
    procedure SetDataAlt( const Value: TDateTime );
    procedure SetDataCad( const Value: TDateTime );
    procedure SetId( const Value: Integer );
    procedure SetUserAlt( const Value: string );
    procedure SetUserCad( const Value: string );
  protected
  public
    constructor Create;
    destructor Destroy;

    property Id: Integer read FId write SetId;
    property Codigo: Integer read FCodigo write SetCodigo;
    property DataCad: TDateTime read FDataCad write SetDataCad;
    property DataAlt: TDateTime read FDataAlt write SetDataAlt;
    property UserCad: string read FUserCad write SetUserCad;
    property UserAlt: string read FUserAlt write SetUserAlt;

    procedure CopiarDados( Value: TGeral );
  end;

implementation

{ TGeral }

procedure TGeral.CopiarDados( Value: TGeral );
begin
  FUserAlt := Value.UserAlt;
  FDataAlt := Value.DataAlt;
  FCodigo  := Value.Codigo;
  FId      := Value.Id;
  FUserCad := Value.UserCad;
  FDataCad := Value.Datacad;
end;

constructor TGeral.Create;
begin
  inherited;
  FUserAlt := '';
  FDataAlt := 0;
  FCodigo  := 0;
  FId      := 0;
  FUserCad := '';
  FDataCad := 0;
end;

destructor TGeral.Destroy;
begin
  inherited Destroy;
end;

procedure TGeral.SetCodigo( const Value: Integer );
begin
  FCodigo := Value;
end;

procedure TGeral.SetDataAlt( const Value: TDateTime );
begin
  FDataAlt := Value;
end;

procedure TGeral.SetDataCad( const Value: TDateTime );
begin
  FDataCad := Value;
end;

procedure TGeral.SetId( const Value: Integer );
begin
  FId := Value;
end;

procedure TGeral.SetUserAlt( const Value: string );
begin
  FUserAlt := Value;
end;

procedure TGeral.SetUserCad( const Value: string );
begin
  FUserCad := Value;
end;

end.
