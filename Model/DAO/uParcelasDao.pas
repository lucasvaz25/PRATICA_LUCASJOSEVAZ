unit uParcelasDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,
  System.Generics.Collections,

  UDao,
  UFilterSearch,
  UParcelas,
  FireDAC.Comp.Client;

type
  TParcelasDao = class( DAO )
  private
    Qry: TFDQuery;
    procedure FieldsToObj( var Value: TParcelas );
    procedure ObjToFields( var Value: TParcelas );
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

    function RecuperarListaParcelas( var Lista: TObjectList<TParcelas>; const CodigoCondPgto: Integer ): Boolean;
  end;

implementation

uses
  Vcl.Dialogs;
{ TParcelasDao }

function TParcelasDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TParcelas;
begin
  Result := nil;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT P.* FROM PARCELAS_CONDPGTO P ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE P.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE P.Parcela LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY P.Parcela ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TParcelas.Create;
        Self.FieldsToObj( Aux );
        Result.Add( Aux );

        Next;
      end;
    finally
      Close;
    end;

  end;
end;

constructor TParcelasDao.Create;
begin
  inherited;

  if not Assigned( Qry ) then
    Qry := TFDQuery.Create( nil );

  Qry.Connection := Dm.Conexao;
end;

function TParcelasDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM PARCELAS_CONDPGTO WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TParcelasDao.Destroy;
begin
  Qry.Free;
  inherited;
end;

function TParcelasDao.Editar( var Value: TObject ): Boolean;
var
  Parcela: TParcelas;
begin

  Parcela := TParcelas( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE PARCELAS_CONDPGTO SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'Parcela = :Parcela, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Parcela );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Parcela.Numero.ToString + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TParcelasDao.FieldsToObj( var Value: TParcelas );
begin
  with Value, Qry do
  begin
    // Codigo  := FieldByName( 'CODIGO' ).AsInteger;
    // DataCad := FieldByName( 'DATA_CAD' ).AsDateTime;
    // DataAlt := FieldByName( 'DATA_ALT' ).AsDateTime;
    // UserCad := FieldByName( 'USER_CAD' ).AsString;
    // UserAlt := FieldByName( 'USER_ALT' ).AsString;
    Numero                := FieldByName( 'Numero' ).AsInteger;
    Dias                  := FieldByName( 'dias' ).AsInteger;
    Porcentagem           := FieldByName( 'porcentagem' ).AsFloat;
    FormaPagamento.Codigo := FieldByName( 'cod_formapgto' ).AsInteger;
    CodCondPgto           := FieldByName( 'cod_condpgto' ).AsInteger;
  end;
end;

function TParcelasDao.Inserir( var Value: TObject ): Boolean;
var
  Parcela: TParcelas;
begin
  Parcela := TParcelas( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO PARCELAS_CONDPGTO ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'Parcela, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':Parcela, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ')' );
      ObjToFields( Parcela );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Parcela.Numero.ToString + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TParcelasDao.ObjToFields( var Value: TParcelas );
begin
  with Value, Qry do
  begin
    // ParamByName( 'CODIGO' ).AsInteger    := Codigo;
    // ParamByName( 'DATA_CAD' ).AsDateTime := DataCad;
    // ParamByName( 'DATA_ALT' ).AsDateTime := DataAlt;
    // ParamByName( 'USER_CAD' ).AsString   := UserCad;
    // ParamByName( 'USER_ALT' ).AsString   := UserAlt;
    ParamByName( 'NUMERO' ).AsInteger := Numero;
  end;
end;

function TParcelasDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TParcelas( Obj ).CopiarDados( TParcelas( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TParcelasDao.RecuperarListaParcelas( var Lista: TObjectList<TParcelas>;
            const CodigoCondPgto: Integer ): Boolean;
var
  Parcela: TParcelas;
begin
  Result := False;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT * FROM PARCELAS_CONDPGTO ' );
    SQL.Add( 'WHERE COD_CONDPGTO = :COD_CONDPGTO ' );
    SQL.Add( 'ORDER BY NUMERO' );
    ParamByName( 'COD_CONDPGTO' ).AsInteger := CodigoCondPgto;

    Open;
    try
      while not Eof do
      begin
        Parcela := TParcelas.Create;
        Self.FieldsToObj( Parcela );
        Lista.Add( Parcela );
      end;
    finally
      Close;
    end;
  end;
  Result := False;
end;

function TParcelasDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TParcelas( List[ I ] ).Numero.ToString ) then
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