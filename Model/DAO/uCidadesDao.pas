unit uCidadesDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UCidades,
  UEstados,
  UEstadosDao;

type
  TCidadesDao = class( Dao )
  private
    procedure FieldsToObj( var Value: TCidade );
    procedure ObjToFields( var Value: TCidade );
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
  Vcl.Dialogs;

{ TCidadesDao }

function TCidadesDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TCidade;
  Estado: TEstado;
  EstadoDao: TEstadosDao;
begin
  Result := nil;

  with DM.QryCidades do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT C.*, e.UF, p.Nome FROM CIDADES c ' );
    SQL.Add( 'Left join estados e on e.codigo = c.cod_estado ' );
    Sql.Add( 'left join paises p on p.codigo = e.cod_pais ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE c.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE c.CIDADE LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY c.CIDADE ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TCidade.Create;
        Self.FieldsToObj( Aux );
        Aux.Estado.UF        := FieldByName( 'uf' ).AsString;
        Aux.Estado.Pais.Nome := FieldByName( 'nome' ).AsString;

        if AFilter.RecuperarObj then
        begin
          EstadoDao := TEstadosDao.Create;
          Estado    := TEstado.Create;
          try
            if Aux.Estado.Codigo > 0 then
            begin
              if EstadoDao.Recuperar( Aux.Estado.Codigo, TObject( Estado ) ) then
                Aux.Estado.CopiarDados( Estado );
            end;
          finally
            Estado.Free;
            EstadoDao.Destroy;
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

constructor TCidadesDao.Create;
begin
  inherited;
end;

function TCidadesDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with DM.QryCidades do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM CIDADES WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TCidadesDao.Destroy;
begin
  inherited;
end;

function TCidadesDao.Editar( var Value: TObject ): Boolean;
var
  Cidade: TCidade;
begin

  Cidade := TCidade( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryCidades do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE CIDADES SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_ALT = :DATA_ALT, USER_ALT = :USER_ALT, ' );
      SQL.Add( 'CIDADE = :CIDADE, DDD = :DDD, COD_ESTADO = :COD_ESTADO, DATA_CAD = :DATA_CAD, USER_CAD = :USER_CAD ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Cidade );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Cidade.Cidade + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TCidadesDao.FieldsToObj( var Value: TCidade );
begin
  with Value, DM.QryCidades do
  begin
    Codigo        := FieldByName( 'CODIGO' ).AsInteger;
    DataCad       := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt       := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad       := FieldByName( 'USER_CAD' ).AsString;
    UserAlt       := FieldByName( 'USER_ALT' ).AsString;
    Estado.Codigo := FieldByName( 'COD_ESTADO' ).AsInteger;
    DDD           := FieldByName( 'DDD' ).AsString;
    Cidade        := FieldByName( 'CIDADE' ).AsString;
  end;
end;

function TCidadesDao.Inserir( var Value: TObject ): Boolean;
var
  Cidade: TCidade;
begin
  Cidade := TCidade( Value );
  DM.Trans.StartTransaction;
  try
    with DM.QryCidades do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO CIDADES ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, USER_CAD, ' );
      SQL.Add( 'CIDADE, DDD, COD_ESTADO, ' );
      SQL.Add( 'USER_ALT, DATA_ALT ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :USER_CAD, ' );
      SQL.Add( ':CIDADE, :DDD, :COD_ESTADO, ' );
      SQL.Add( ':USER_ALT, :DATA_ALT' );

      SQL.Add( ')' );
      ObjToFields( Cidade );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Cidade.Cidade + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TCidadesDao.ObjToFields( var Value: TCidade );
begin
  with Value, DM.QryCidades do
  begin
    ParamByName( 'CODIGO' ).AsInteger     := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime  := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime  := DataAlt;
    ParamByName( 'USER_CAD' ).AsString    := UserCad;
    ParamByName( 'USER_ALT' ).AsString    := UserAlt;
    ParamByName( 'CIDADE' ).AsString      := Cidade;
    ParamByName( 'DDD' ).AsString         := DDD;
    ParamByName( 'COD_ESTADO' ).AsInteger := Estado.Codigo;
  end;
end;

function TCidadesDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TCidade( Obj ).CopiarDados( TCidade( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TCidadesDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TCidade( List[ I ] ).Cidade ) then
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
