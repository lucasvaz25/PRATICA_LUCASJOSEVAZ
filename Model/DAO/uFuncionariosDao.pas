unit uFuncionariosDao;

interface

uses
  System.Classes,
  System.Contnrs,
  System.SysUtils,

  UDao,
  UFilterSearch,
  UFuncionarios,
  FireDAC.Comp.Client;

type
  TFuncionariosDao = class( DAO )
  private
    Qry: TFDQuery;
    procedure FieldsToObj( var Value: TFuncionarios );
    procedure ObjToFields( var Value: TFuncionarios );
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
    function VerificaExisteCPF( Str: string ): Boolean;
  end;

implementation

uses
  UEnum,
  UCidades,
  UCargos,
  UCidadesDao,
  UCargosDao,
  Vcl.Dialogs;
{ TFuncionariosDao }

function TFuncionariosDao.Consulta( AFilter: TFilterSearch ): TObjectList;
var
  Aux: TFuncionarios;
  Cidade: TCidade;
  Cargo: TCargos;
  CidadeDao: TCidadesDao;
  CargoDao: TCargosDao;
begin
  Result := nil;

  with Qry do
  begin

    SQL.Clear;

    SQL.Add( 'SELECT F.*, C.CARGO AS CARGO FROM Funcionarios F ' );
    SQL.Add( 'LEFT JOIN CARGOS C ON C.CODIGO = F.COD_CARGO ' );
    case AFilter.TipoConsulta of

      TpCCodigo:
        begin
          SQL.Add( 'WHERE F.CODIGO = ' + IntToStr( AFilter.Codigo ) );
        end;

      TpCParam:
        begin
          SQL.Add( 'WHERE F.Funcionario LIKE ' + QuotedStr( '%' + AFilter.Parametro + '%' ) );
        end;

      TpCCPF_CNPJ:
        begin
          SQL.Add( 'WHERE F.CPF = ' + QuotedStr( AFilter.Parametro ) );
        end;

      TpCTODOS:
        ;
    end;

    SQL.Add( ' ORDER BY F.Funcionario ' );
    Open;

    try
      Result := TObjectList.Create;
      while ( not Eof ) do
      begin
        Aux := TFuncionarios.Create;
        Self.FieldsToObj( Aux );
        Aux.Cargo.Cargo := FieldByName( 'CARGO' ).AsString;

        if AFilter.RecuperarObj then
        begin
          if ( Aux.Cidade.Codigo > 0 ) then
          begin
            Cidade    := TCidade.Create;
            CidadeDao := TCidadesDao.Create;
            try
              Cidade.Codigo := Aux.Cidade.Codigo;
              if CidadeDao.Recuperar( Cidade.Codigo, TObject( Cidade ) ) then
                Aux.Cidade.CopiarDados( Cidade );
            finally
              Cidade.Free;
              CidadeDao.Free;
            end;
          end;
          if ( Aux.Cargo.Codigo > 0 ) then
          begin
            Cargo    := TCargos.Create;
            CargoDao := TCargosDao.Create;
            try
              Cidade.Codigo := Aux.Cargo.Codigo;
              if CargoDao.Recuperar( Cargo.Codigo, TObject( Cargo ) ) then
                Aux.Cargo.CopiarDados( Cargo );
            finally
              Cargo.Free;
              CargoDao.Free;
            end;
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

constructor TFuncionariosDao.Create;
begin
  inherited;

  if not Assigned( Qry ) then
    Qry := TFDQuery.Create( nil );

  Qry.Connection := Dm.Conexao;
end;

function TFuncionariosDao.Deletar( const VID: Integer ): Boolean;
begin
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'DELETE FROM Funcionarios WHERE CODIGO = ' + IntToStr( VID ) );
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

destructor TFuncionariosDao.Destroy;
begin
  Qry.Free;
  inherited;
end;

function TFuncionariosDao.Editar( var Value: TObject ): Boolean;
var
  Funcionario: TFuncionarios;
begin

  Funcionario := TFuncionarios( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add( 'UPDATE Funcionarios SET ' );
      SQL.Add( 'CODIGO = :CODIGO, DATA_CAD = :DATA_CAD, DATA_ALT = :DATA_ALT, ' );
      SQL.Add( 'USER_CAD = :USER_CAD, USER_ALT = :USER_ALT, CEP = :CEP, ' );
      SQL.Add( 'num = :num, bairro = :bairro, APELIDO = :APELIDO, STATUS = :STATUS, ' );
      SQL.Add( 'logradouro = :logradouro, Funcionario = :Funcionario, RG = :RG, ' );
      SQL.Add( 'CPF = :CPF, DATA_ADMISSAO = :DATA_ADMISSAO, DATA_DEMISSAO = :DATA_DEMISSAO, ' );
      SQL.Add( 'EMAIL = :EMAIL, TELEFONE = :TELEFONE, SALARIO = :SALARIO, COD_CARGO = :COD_CARGO, ' );
      SQL.Add( 'CNH = :CNH, CATEGORIA = :CATEGORIA, VALIDADE_CNH = :VALIDADE_CNH, SEXO = :SEXO, cod_cidade = :cod_cidade ' );
      SQL.Add( 'WHERE  CODIGO = :CODIGO' );
      ObjToFields( Funcionario );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar Editar o registro: ' + Funcionario.Nome + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TFuncionariosDao.FieldsToObj( var Value: TFuncionarios );
begin
  with Value, Qry do
  begin
    Codigo        := FieldByName( 'CODIGO' ).AsInteger;
    DataCad       := FieldByName( 'DATA_CAD' ).AsDateTime;
    DataAlt       := FieldByName( 'DATA_ALT' ).AsDateTime;
    UserCad       := FieldByName( 'USER_CAD' ).AsString;
    UserAlt       := FieldByName( 'USER_ALT' ).AsString;
    Nome          := FieldByName( 'Funcionario' ).AsString;
    Endereco      := FieldByName( 'logradouro' ).AsString;
    Numero        := FieldByName( 'num' ).AsString;
    Bairro        := FieldByName( 'bairro' ).AsString;
    Apelido       := FieldByName( 'APELIDO' ).AsString;
    CEP           := FieldByName( 'CEP' ).AsString;
    Telefone      := FieldByName( 'TELEFONE' ).AsString;
    Email         := FieldByName( 'EMAIL' ).AsString;
    CPF           := FieldByName( 'CPF' ).AsString;
    RG            := FieldByName( 'RG' ).AsString;
    Data_Admissao := FieldByName( 'DATA_ADMISSAO' ).AsDateTime;
    Salario       := FieldByName( 'SALARIO' ).AsCurrency;
    Cargo.Codigo  := FieldByName( 'COD_CARGO' ).AsInteger;
    CNH           := FieldByName( 'CNH' ).AsString;
    Categoria     := TCategoriaCNH( FieldByName( 'CATEGORIA' ).AsInteger );
    ValidadeCNH   := FieldByName( 'VALIDADE_CNH' ).AsDateTime;
    Sexo          := TSexo( FieldByName( 'SEXO' ).AsInteger );
    Cidade.Codigo := FieldByName( 'cod_cidade' ).AsInteger;
    Status        := TStatus( FieldByName( 'STATUS' ).AsInteger );

    if FieldByName( 'DATA_DEMISSAO' ).IsNull then
      Data_Demissao := 0
    else
      Data_Demissao := FieldByName( 'DATA_DEMISSAO' ).AsDateTime;
  end;
end;

function TFuncionariosDao.Inserir( var Value: TObject ): Boolean;
var
  Funcionario: TFuncionarios;
begin
  Funcionario := TFuncionarios( Value );
  DM.Trans.StartTransaction;
  try
    with Qry do
    begin
      Close;
      SQl.Clear;
      SQL.Add( 'INSERT INTO Funcionarios ( ' );
      SQL.Add( 'CODIGO, DATA_CAD, DATA_ALT, USER_CAD, USER_ALT, STATUS, ' );
      SQL.Add( 'Funcionario, logradouro, num, bairro, APELIDO, CEP, ' );
      SQL.Add( 'TELEFONE, EMAIL, CPF, RG, DATA_ADMISSAO, DATA_DEMISSAO, ' );
      SQL.Add( 'SALARIO, COD_CARGO, CNH, CATEGORIA, VALIDADE_CNH, SEXO, cod_cidade ' );
      SQL.Add( ')VALUES(' );
      SQL.Add( ':CODIGO, :DATA_CAD, :DATA_ALT, :USER_CAD, :USER_ALT, :STATUS, ' );
      SQL.Add( ':Funcionario, :logradouro, :num, :bairro, :APELIDO, :CEP, ' );
      SQL.Add( ':TELEFONE, :EMAIL, :CPF, :RG, :DATA_ADMISSAO, :DATA_DEMISSAO, ' );
      SQL.Add( ':SALARIO, :COD_CARGO, :CNH, :CATEGORIA, :VALIDADE_CNH, :SEXO, :cod_cidade ' );
      SQL.Add( ')' );
      ObjToFields( Funcionario );
      ExecSQL;
    end;
    DM.Trans.Commit;
  except
    DM.Trans.Rollback;
    MessageDlg( 'Erro ao tentar inserir o registro: ' + Funcionario.Nome + '.', MtWarning, [ MbOK ], 0 );
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TFuncionariosDao.ObjToFields( var Value: TFuncionarios );
begin
  with Value, Qry do
  begin
    ParamByName( 'CODIGO' ).AsInteger         := Codigo;
    ParamByName( 'DATA_CAD' ).AsDateTime      := DataCad;
    ParamByName( 'DATA_ALT' ).AsDateTime      := DataAlt;
    ParamByName( 'USER_CAD' ).AsString        := UserCad;
    ParamByName( 'USER_ALT' ).AsString        := UserAlt;
    ParamByName( 'Funcionario' ).AsString     := Nome;
    ParamByName( 'logradouro' ).AsString      := Endereco;
    ParamByName( 'num' ).AsString             := Numero;
    ParamByName( 'bairro' ).AsString          := Bairro;
    ParamByName( 'APELIDO' ).AsString         := Apelido;
    ParamByName( 'CEP' ).AsString             := CEP;
    ParamByName( 'TELEFONE' ).AsString        := Telefone;
    ParamByName( 'EMAIL' ).AsString           := Email;
    ParamByName( 'CPF' ).AsString             := CPF;
    ParamByName( 'RG' ).AsString              := RG;
    ParamByName( 'DATA_ADMISSAO' ).AsDateTime := Data_Admissao;
    ParamByName( 'SALARIO' ).AsCurrency       := Salario;
    ParamByName( 'COD_CARGO' ).AsInteger      := Cargo.Codigo;
    ParamByName( 'CNH' ).AsString             := CNH;
    ParamByName( 'CATEGORIA' ).AsInteger      := Integer( Categoria );
    ParamByName( 'VALIDADE_CNH' ).AsDateTime  := ValidadeCNH;
    ParamByName( 'SEXO' ).AsInteger           := Integer( Sexo );
    ParamByName( 'cod_cidade' ).AsInteger     := Cidade.Codigo;
    ParamByName( 'STATUS' ).AsInteger         := Integer( Status );

    if Data_Demissao = 0 then
      ParamByName( 'DATA_DEMISSAO' ).IsNull
    else
      ParamByName( 'DATA_DEMISSAO' ).AsDateTime := Data_Demissao;
  end;
end;

function TFuncionariosDao.Recuperar( const VID: Integer; out Obj: TObject ): Boolean;
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
      TFuncionarios( Obj ).CopiarDados( TFuncionarios( List[ 0 ] ) );
    end;
  finally
    Afilter.Free;
    List.Free;
  end;
end;

function TFuncionariosDao.VerificaExiste( Str: string ): Boolean;
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
        if ( Str = TFuncionarios( List[ I ] ).Nome ) then
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

function TFuncionariosDao.VerificaExisteCPF( Str: string ): Boolean;
var
  List: Tobjectlist;
  Afilter: TFilterSearch;
  I: Integer;
begin
  Result  := False;
  List    := Tobjectlist.Create;
  Afilter := TFilterSearch.Create;
  try
    Afilter.TipoConsulta := TpCCPF_CNPJ;
    Afilter.Parametro    := Str;
    List                 := Self.Consulta( Afilter );
    if List <> nil then
    begin
      for I := 0 to List.Count - 1 do
        if ( Str = TFuncionarios( List[ I ] ).CPF ) then
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
