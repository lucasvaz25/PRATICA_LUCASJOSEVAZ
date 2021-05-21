unit uPessoa;

interface

uses
  UGeral,
  UCidades,
  UEnum;

type
  TPessoa = class( TGeral )
  private
    FCNPJ: string;
    FRG: string;
    FBairro: string;
    FDataNasc: TDate;
    FCPF: string;
    FCEP: string;
    FNumero: string;
    FIdade: Integer;
    FComplemento: string;
    FSexo: TSexo;
    FNome: string;
    FEndereco: string;
    FTelefone: string;
    FCidade: TCidade;
    FApelido: string;
    FEmail: string;
    procedure SetBairro( const Value: string );
    procedure SetCEP( const Value: string );
    procedure SetCNPJ( const Value: string );
    procedure SetComplemento( const Value: string );
    procedure SetCPF( const Value: string );
    procedure SetDataNasc( const Value: TDate );
    procedure SetEndereco( const Value: string );
    procedure SetIdade( const Value: Integer );
    procedure SetNome( const Value: string );
    procedure SetNumero( const Value: string );
    procedure SetRG( const Value: string );
    procedure SetSexo( const Value: TSexo );
    procedure SetTelefone( const Value: string );
    procedure SetCidade( const Value: TCidade );
    procedure SetApelido( const Value: string );
    procedure SetEmail( const Value: string );
  protected
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    property Nome: string read FNome write SetNome;
    property Apelido: string read FApelido write SetApelido;
    property Idade: Integer read FIdade write SetIdade;
    property Sexo: TSexo read FSexo write SetSexo;
    property RG: string read FRG write SetRG;
    property CPF: string read FCPF write SetCPF;
    property CNPJ: string read FCNPJ write SetCNPJ;
    property Endereco: string read FEndereco write SetEndereco;
    property Numero: string read FNumero write SetNumero;
    property Bairro: string read FBairro write SetBairro;
    property Complemento: string read FComplemento write SetComplemento;
    property Telefone: string read FTelefone write SetTelefone;
    property DataNasc: TDate read FDataNasc write SetDataNasc;
    property CEP: string read FCEP write SetCEP;
    property Cidade: TCidade read FCidade write SetCidade;
    property Email: string read FEmail write SetEmail;

    procedure CopiarDados( Value: TPessoa );

  end;

implementation

{ TPessoa }

procedure TPessoa.CopiarDados( Value: TPessoa );
begin
  inherited CopiarDados( Value );

  FCNPJ        := Value.CNPJ;
  FRG          := Value.RG;
  FBairro      := Value.Bairro;
  FDataNasc    := Value.DataNasc;
  FCPF         := Value.CPF;
  FCEP         := Value.CEP;
  FNumero      := Value.Numero;
  FIdade       := Value.Idade;
  FComplemento := Value.Complemento;
  FSexo        := Value.Sexo;
  FNome        := Value.Nome;
  FApelido     := Value.Apelido;
  FEndereco    := Value.Endereco;
  FTelefone    := Value.Telefone;
  FEmail       := Value.Email;
  FCidade.CopiarDados( Value.Cidade );
end;

constructor TPessoa.Create;
begin
  inherited Create;
  FCNPJ        := '';
  FRG          := '';
  FBairro      := '';
  FDataNasc    := 0;
  FCPF         := '';
  FCEP         := '';
  FNumero      := '';
  FIdade       := 0;
  FComplemento := '';
  FSexo        := TSxIndefinido;
  FNome        := '';
  FApelido     := '';
  FEndereco    := '';
  FTelefone    := '';
  FEmail       := '';
  FCidade      := TCidade.Create;
end;

destructor TPessoa.Destroy;
begin
  if Assigned( Self ) then
  begin
    FCidade.Destroy;
    inherited Destroy;
  end;
end;

procedure TPessoa.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TPessoa.SetApelido( const Value: string );
begin
  FApelido := Value;
end;

procedure TPessoa.SetBairro( const Value: string );
begin
  FBairro := Value;
end;

procedure TPessoa.SetCEP( const Value: string );
begin
  FCEP := Value;
end;

procedure TPessoa.SetCidade( const Value: TCidade );
begin
  FCidade := Value;
end;

procedure TPessoa.SetCNPJ( const Value: string );
begin
  FCNPJ := Value;
end;

procedure TPessoa.SetComplemento( const Value: string );
begin
  FComplemento := Value;
end;

procedure TPessoa.SetCPF( const Value: string );
begin
  FCPF := Value;
end;

procedure TPessoa.SetDataNasc( const Value: TDate );
begin
  FDataNasc := Value;
end;

procedure TPessoa.SetEmail( const Value: string );
begin
  FEmail := Value;
end;

procedure TPessoa.SetEndereco( const Value: string );
begin
  FEndereco := Value;
end;

procedure TPessoa.SetIdade( const Value: Integer );
begin
  FIdade := Value;
end;

procedure TPessoa.SetNome( const Value: string );
begin
  FNome := Value;
end;

procedure TPessoa.SetNumero( const Value: string );
begin
  FNumero := Value;
end;

procedure TPessoa.SetRG( const Value: string );
begin
  FRG := Value;
end;

procedure TPessoa.SetSexo( const Value: TSexo );
begin
  FSexo := Value;
end;

procedure TPessoa.SetTelefone( const Value: string );
begin
  FTelefone := Value;
end;

end.
