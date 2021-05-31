unit uEnum;

interface

type

  TTipoPessoa = ( TTpPIndefinido = -1, TTpPFisica = 0, TTpPJuridica = 1 );

  TSexo = ( TSxIndefinido = -1, TSxFeminino = 0, TSxMasculino = 1 );

  TCategoriaCNH = ( TCCNH_Indefinido = -1, TCCNH_A = 0, TCCNH_B = 1,
              TCCNH_C = 2, TCCNH_D = 3, TCCNH_E = 4, TCCNH_AB = 5 );

  TStatus = ( TSIndefinido = -1, TSInativo = 0, TSAtivo = 1 );

  TEnum = class
  public
    class function GetCategoriaCNH( Value: TCategoriaCNH ): string;
    class function GetSexo( Value: TSexo ): string;
    class function GetTipoPessoa( Value: TTipoPessoa ): string;
  end;

implementation

{ TEnum }

class function TEnum.GetCategoriaCNH( Value: TCategoriaCNH ): string;
begin
  case Value of

    TCCNH_Indefinido:
      Result := 'INDEFINIDO';

    TCCNH_A:
      Result := 'A';

    TCCNH_B:
      Result := 'B';

    TCCNH_C:
      Result := 'C';

    TCCNH_D:
      Result := 'D';

    TCCNH_E:
      Result := 'E';

    TCCNH_AB:
      Result := 'AB';

  end;
end;

class function TEnum.GetSexo( Value: TSexo ): string;
begin
  case Value of

    TSxIndefinido:
      Result := 'INDEFINIDO';

    TSxFeminino:
      Result := 'FEMININO';

    TSxMasculino:
      Result := 'MASCULINO';

  end;
end;

class function TEnum.GetTipoPessoa( Value: TTipoPessoa ): string;
begin
  case Value of

    TTpPIndefinido:
      Result := 'INDEFINIDO';

    TTpPFisica:
      Result := 'FISICA';

    TTpPJuridica:
      Result := 'JURIDICA';

  end;
end;

end.
