unit uCondicaoPagamentoDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UCondicaoPagamento,
  FireDAC.Comp.Client;

type
  TCondicaoPagamentoDao = class( DAO )
  private
    Qry: TFDQuery;
    procedure FieldsToObj( var Value: TCondicaoPagamento );
    procedure ObjToFields( var Value: TCondicaoPagamento );

    function RetornaCod: Integer;

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
  Vcl.Dialogs,
  System.Generics.Collections,
  UParcelas,
  UParcelasDao;
{ TCondicaoPagamentoDao }

function TCondicaoPagamentoDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TCondicaoPagamento;
  ParcelaDao: TParcelasDao;
  ListAux: TObjectList<TParcelas>;
begin
  Result := nil;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT CP.* FROM COND_PAG CP ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE CP.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE CP.CONDPAG LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY CP.CONDPAG ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TCondicaoPagamento.Create;
        Self.FieldsToObj( Aux );

        if AFilter.RecuperarObj then
        begin
          ParcelaDao := TParcelasDao.Create;
          try
            ListAux := Aux.ListaParcelas;
            ParcelaDao.RecuperarListaParcelas( ListAux, Aux.Codigo );
          finally
            ParcelaDao.Free;
          end;
        end;

        Result.Add( Aux );

        Next;
      end;
    finally
      Close;
    end;

  end;
end;

constructor TCondicaoPagamentoDao.Create;
begin
  inherited;

  if not Assigned( Qry ) then
    Qry := TFDQuery.Create( nil );

  Qry.Connection := Dm.Conexao;
end;

function TCondicaoPagamentoDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM cond_pag WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TCondicaoPagamentoDao.Destroy;
begin
  Qry.Free;
  inherited;
end;

function TCondicaoPagamentoDao.Editar( var Value: TObject ): Boolean;
var
  CondicaoPagamento: TCondicaoPagamento;
begin

  CondicaoPagamento := TCondicaoPagamento( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE cond_pag SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT,  ' );
      SQL.Add( 'condpag = :condpag, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD, ' );
      SQL.Add( 'PARCELAS = :PARCELAS, TXJUROS = :TXJUROS, MULTA = :MULTA, DESCONTO = :DESCONTO ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( CondicaoPagamento );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + CondicaoPagamento.Condpag + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TCondicaoPagamentoDao.FieldsToObj( var Value: TCondicaoPagamento );
begin
  with Value, Qry do
  begin
    Codigo   := FieldByName( 'CODIGO' ).AsInteger;
    DataCad  := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt  := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad  := FieldByName( 'USER_CAD' ).AsString;
    UserAlt  := FieldByName( 'USER_ALT' ).AsString;
    CondPag  := FieldByName( 'CONDPAG' ).AsString;
    Parcelas := FieldByName( 'PARCELAS' ).AsInteger;
    TxJuros  := FieldByName( 'TXJUROS' ).AsFloat;
    Multa    := FieldByName( 'MULTA' ).AsFloat;
    Desconto := FieldByName( 'DESCONTO' ).AsFloat;
  end;
end;

function TCondicaoPagamentoDao.Inserir( var Value: TObject ): Boolean;
var
  CondicaoPagamento: TCondicaoPagamento;
begin
  CondicaoPagamento := TCondicaoPagamento( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO cond_pag ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'condpag, PARCELAS, TXJUROS, ' );
      SQL.Add( 'MULTA, DESCONTO, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':condpag, :PARCELAS, :TXJUROS, ' );
      SQL.Add( ':MULTA, :DESCONTO, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ') ' );
      ObjToFields( CondicaoPagamento );
      ExecSQL;

      CondicaoPagamento.Codigo := RetornaCod;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + CondicaoPagamento.Condpag + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TCondicaoPagamentoDao.ObjToFields( var Value: TCondicaoPagamento );
begin
  with Value, Qry do
  begin
    ParamByName( 'CODIGO' ).AsInteger    := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime := DataAlt;
    ParamByName( 'USER_CAD' ).AsString   := UserCad;
    ParamByName( 'USER_ALT' ).AsString   := UserAlt;
    ParamByName( 'condpag' ).AsString    := Condpag;
    ParamByName( 'PARCELAS' ).AsInteger  := Parcelas;
    ParamByName( 'TXJUROS' ).AsFloat     := TxJuros;
    ParamByName( 'MULTA' ).AsFloat       := Multa;
    ParamByName( 'DESCONTO' ).AsFloat    := Desconto;
  end;
end;

function TCondicaoPagamentoDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TCondicaoPagamento( Obj ).CopiarDados( TCondicaoPagamento( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TCondicaoPagamentoDao.RetornaCod: Integer;
begin
  with Qry do
  begin
    SQL.Clear;

    SQL.Add( 'SELECT FIRST 1 CODIGO FROM COND_PAG ORDER BY CODIGO DESC ' );

    Open;
    Result := FieldByName( 'CODIGO' ).AsInteger;
    Close;
  end;
end;

function TCondicaoPagamentoDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TCondicaoPagamento( List[ I ] ).Condpag ) then
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
