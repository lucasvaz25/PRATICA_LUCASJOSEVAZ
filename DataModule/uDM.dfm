object DM: TDM
  OldCreateOrder = False
  Height = 316
  Width = 589
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\bd\PADRAO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    Left = 32
    Top = 16
  end
  object Trans: TFDTransaction
    Connection = Conexao
    Left = 72
    Top = 16
  end
  object QryPaises: TFDQuery
    Connection = Conexao
    Transaction = Trans
    SQL.Strings = (
      '')
    Left = 112
    Top = 16
  end
  object QryEstados: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 160
    Top = 16
  end
  object QryCidades: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 208
    Top = 16
  end
  object QryDepartamentos: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 256
    Top = 16
  end
  object QryCond_Pag: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 336
    Top = 16
  end
  object QryCargos: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 400
    Top = 16
  end
  object QryGrupos: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 456
    Top = 24
  end
  object QrySubgrupos: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 512
    Top = 24
  end
  object QryClientes: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 32
    Top = 96
  end
  object QryFuncionarios: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 112
    Top = 104
  end
  object QryF_Pagamentos: TFDQuery
    Connection = Conexao
    Transaction = Trans
    Left = 184
    Top = 96
  end
end
