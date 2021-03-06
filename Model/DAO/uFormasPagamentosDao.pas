unit uFormasPagamentosDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UFormasPagamentos,
  FireDAC.Comp.Client;

type
  TFormasPagamentosDao = class( DAO )
  private
    Qry: TFDQuery;
    procedure FieldsToObj( var Value: TFormasPagamentos );
    procedure ObjToFields( var Value: TFormasPagamentos );
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

uses
  UEnum,
  Vcl.Dialogs;
{ TFormasPagamentosDao }

function TFormasPagamentosDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TFormasPagamentos;
begin
  Result := nil;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT F.* FROM F_PAGAMENTOS F ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE F.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE F.FormaPagamento LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY F.FormaPagamento ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TFormasPagamentos.Create;
        Self.FieldsToObj( Aux );

        Result.Add( Aux );

        Next;
      end;
    finally
      Close;
    end;

  end;
end;

constructor TFormasPagamentosDao.Create;
begin
  inherited;

  if not Assigned( Qry ) then
    Qry := TFDQuery.Create( nil );

  Qry.Connection := Dm.Conexao;
end;

function TFormasPagamentosDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM F_PAGAMENTOS WHERE CODIGO = ' + IntToStr( VID ) );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Deletar o registro.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

destructor TFormasPagamentosDao.Destroy;
begin
  Qry.Free;
  inherited;
end;

function TFormasPagamentosDao.Editar( var Value: TObject ): Boolean;
var
  FormaPagamento: TFormasPagamentos;
begin

  FormaPagamento := TFormasPagamentos( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE F_PAGAMENTOS SET ' );
      SQL.Add( 'CODIGO = :CODIGO, USER_CAD = :USER_CAD, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'DATA_CAD = :DATA_CAD, DATA_ALT = :DATA_ALT, FORMAPAGAMENTO = :FORMAPAGAMENTO, OBS = :OBS ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( FormaPagamento );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + FormaPagamento.
                FormaPagamento + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TFormasPagamentosDao.FieldsToObj( var Value: TFormasPagamentos );
begin
  with Value, Qry do
  begin
    Codigo         := FieldByName( 'CODIGO' ).AsInteger;
    DataCad        := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt        := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad        := FieldByName( 'USER_CAD' ).AsString;
    UserAlt        := FieldByName( 'USER_ALT' ).AsString;
    FormaPagamento := FieldByName( 'FormaPagamento' ).AsString;
    Obs            := FieldByName( 'OBS' ).AsString;
  end;
end;

function TFormasPagamentosDao.Inserir( var Value: TObject ): Boolean;
var
  FormaPagamento: TFormasPagamentos;
begin
  FormaPagamento := TFormasPagamentos( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO F_PAGAMENTOS ( ' );
      SQL.Add( 'CODIGO, USER_CAD, USER_ALT, DATA_CAD, ' );
      SQL.Add( 'DATA_ALT, FORMAPAGAMENTO, OBS ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :USER_CAD, :USER_ALT, :DATA_CAD, ' );
      SQL.Add( ':DATA_ALT, :FORMAPAGAMENTO, :OBS ' );
      SQL.Add( ')' );
      ObjToFields( FormaPagamento );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + FormaPagamento.FormaPagamento + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TFormasPagamentosDao.ObjToFields( var Value: TFormasPagamentos );
begin
  with Value, Qry do
  begin
    ParamByName( 'CODIGO' ).AsInteger        := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime     := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime     := DataAlt;
    ParamByName( 'USER_CAD' ).AsString       := UserCad;
    ParamByName( 'USER_ALT' ).AsString       := UserAlt;
    ParamByName( 'FormaPagamento' ).AsString := FormaPagamento;
    ParamByName( 'OBS' ).AsString            := Obs;
  end;
end;

function TFormasPagamentosDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
var
  List: TObjectList;
  Afilter: TFilterSearch;
begin
  Result  := False;
  List    := TObjectList.Create;
  Afilter := TFilterSearch.Create;
  try
    Afilter.TipoConsulta := TpCCodigo;
    Afilter.Codigo       := VID;
    AFilter.RecuperarObj := True;
    List                 := Self.Consulta( Afilter );
    if List <> nil then
    begin
      Result := True;
      TFormasPagamentos( Obj ).CopiarDados( TFormasPagamentos( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TFormasPagamentosDao.VerificaExiste( Str: string ): Boolean;
var
  List: Tobjectlist;
  Afilter: TFilterSearch;
  I: Integer;
begin
  Result  := False;
  List    := Tobjectlist.Create;
  Afilter := TFilterSearch.Create;
  try
    Afilter.TipoConsulta := TpCParam;
    Afilter.Parametro    := Str;
    List                 := Self.Consulta( Afilter );
    if List <> nil then
    begin
      for I := 0 to List.Count - 1 do
        if ( Str = TFormasPagamentos( List[ I ] ).FormaPagamento ) then
        begin
          Result := True;
          Break;
        end;
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

end.
