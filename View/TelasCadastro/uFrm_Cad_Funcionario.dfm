inherited Frm_Cad_Funcionario: TFrm_Cad_Funcionario
  Caption = 'Frm_Cad_Funcionario'
  ClientHeight = 640
  ClientWidth = 688
  OnCreate = FormCreate
  ExplicitWidth = 694
  ExplicitHeight = 669
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 688
    Height = 640
    ExplicitWidth = 688
    ExplicitHeight = 640
    inherited lblUsuarioDataCad: TLabel
      Top = 544
      ExplicitTop = 544
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Top = 572
      ExplicitTop = 572
    end
    object lblNome: TLabel [3]
      Left = 24
      Top = 82
      Width = 89
      Height = 21
      Caption = 'Funcion'#225'rio*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblNomeFantasia: TLabel [4]
      Left = 24
      Top = 138
      Width = 53
      Height = 21
      Caption = 'Apelido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCEP: TLabel [5]
      Left = 543
      Top = 140
      Width = 27
      Height = 21
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblNum: TLabel [6]
      Left = 580
      Top = 193
      Width = 38
      Height = 21
      Caption = 'Num.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblLogradouro: TLabel [7]
      Left = 24
      Top = 191
      Width = 82
      Height = 21
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblBairro: TLabel [8]
      Left = 24
      Top = 244
      Width = 42
      Height = 21
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCidade: TLabel [9]
      Left = 85
      Top = 294
      Width = 55
      Height = 21
      Caption = 'Cidade*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblUF: TLabel [10]
      Left = 609
      Top = 293
      Width = 19
      Height = 21
      Caption = 'UF'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTelefone: TLabel [11]
      Left = 24
      Top = 346
      Width = 57
      Height = 21
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblEmail: TLabel [12]
      Left = 155
      Top = 346
      Width = 44
      Height = 21
      Caption = 'E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCPF: TLabel [13]
      Left = 24
      Top = 399
      Width = 34
      Height = 21
      Caption = 'CPF*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblRG: TLabel [14]
      Left = 172
      Top = 399
      Width = 28
      Height = 21
      Caption = 'RG*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblDtAdmissao: TLabel [15]
      Left = 311
      Top = 399
      Width = 111
      Height = 21
      Caption = 'Data Admiss'#227'o*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblDtDemissao: TLabel [16]
      Left = 431
      Top = 399
      Width = 104
      Height = 21
      Caption = 'Data Demiss'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCNH: TLabel [17]
      Left = 298
      Top = 455
      Width = 33
      Height = 21
      Caption = 'CNH'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCategoria: TLabel [18]
      Left = 458
      Top = 455
      Width = 67
      Height = 21
      Caption = 'Categoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblValCNH: TLabel [19]
      Left = 544
      Top = 455
      Width = 61
      Height = 21
      Caption = 'Val. CNH'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCargo: TLabel [20]
      Left = 72
      Top = 454
      Width = 49
      Height = 21
      Caption = 'Cargo*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSalario: TLabel [21]
      Left = 550
      Top = 399
      Width = 55
      Height = 21
      Caption = 'Sal'#225'rio*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCodCidade: TLabel [22]
      Left = 26
      Top = 293
      Width = 31
      Height = 21
      Caption = 'C'#243'd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCodCargao: TLabel [23]
      Left = 26
      Top = 455
      Width = 31
      Height = 21
      Caption = 'C'#243'd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlSalvar: TPanel
      Left = 394
      Top = 544
      TabOrder = 21
      ExplicitLeft = 394
      ExplicitTop = 544
    end
    inherited pnlSair: TPanel
      Left = 529
      Top = 544
      TabOrder = 22
      ExplicitLeft = 529
      ExplicitTop = 544
    end
    object edNome: TVazEdit
      Left = 24
      Top = 104
      Width = 624
      Height = 29
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      TextHint = 'digite o nome do funcionario'
      ChangeColor = 14745599
    end
    object edApelido: TVazEdit
      Left = 24
      Top = 160
      Width = 505
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 2
      TextHint = 'Digite o apelido do funcion'#225'rio'
      ChangeColor = 14745599
    end
    object edCEP: TVazMaskEdit
      Left = 543
      Top = 160
      Width = 106
      Height = 29
      EditMask = '99.999-999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = ''
      TypeMask = TtmCEP
      ChangeColor = 14745599
    end
    object rgSexo: TRadioGroup
      Left = 437
      Top = 25
      Width = 209
      Height = 50
      Caption = 'Sexo*'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        'Masculino'
        'Feminino')
      ParentFont = False
      TabOrder = 23
    end
    object edNum: TVazEdit
      Left = 580
      Top = 214
      Width = 69
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      NumbersOnly = True
      ParentFont = False
      TabOrder = 5
      ChangeColor = 14745599
    end
    object edLogradouro: TVazEdit
      Left = 24
      Top = 214
      Width = 546
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 4
      TextHint = 'digite o logradouro'
      ChangeColor = 14745599
    end
    object edBairro: TVazEdit
      Left = 24
      Top = 264
      Width = 625
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 6
      TextHint = 'digite o bairro'
      ChangeColor = 14745599
    end
    object edCidade: TVazEdit
      Left = 85
      Top = 315
      Width = 473
      Height = 29
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      ReadOnly = True
      TabOrder = 19
      TextHint = 'digite a cidade'
      ChangeColor = 14745599
    end
    object edUF: TVazEdit
      Left = 609
      Top = 314
      Width = 40
      Height = 29
      TabStop = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 20
      ChangeColor = 14745599
    end
    object edTelefone: TVazMaskEdit
      Left = 24
      Top = 366
      Width = 117
      Height = 29
      EditMask = '(99) 9999-9999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 8
      Text = ''
      TypeMask = TtmTelefone
      ChangeColor = 14745599
    end
    object edEmail: TVazEdit
      Left = 155
      Top = 366
      Width = 493
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 9
      TextHint = 'digite o e-mail'
      ChangeColor = 14745599
    end
    object edCPF: TVazMaskEdit
      Left = 24
      Top = 420
      Width = 139
      Height = 29
      EditMask = '999.999.999-99;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 10
      Text = ''
      TypeMask = TtmCPF
      ChangeColor = 14745599
    end
    object edRG: TVazEdit
      Left = 172
      Top = 420
      Width = 131
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      NumbersOnly = True
      ParentFont = False
      TabOrder = 11
      ChangeColor = 14745599
    end
    object pnlPesquisar: TPanel
      Left = 568
      Top = 315
      Width = 33
      Height = 29
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 24
      object imgPesquisar: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 29
        Cursor = crHandPoint
        Hint = 'Pesquisar Cidade'
        Align = alClient
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000002
          A54944415478DAED965B884D511CC6D76E2E261ECC50333C30721D531EE445B9
          0CD128920721522EC983E461521445CAED8DE24152232F484A2986D230529E24
          1A83D4BC98A4DC4586D3F6FBB7D66EFE767B9F598B3947C9AAAFEFECB5D7F7FF
          BEBD2E7B9FC8FCE516FD1301E238963A0DE06B14451FCA1200D349D046B0064C
          0415EE563FB80F2E82B304FA34A401301E011D01DB9CBE580D998D5D84383524
          01301F077580A640ED39B08520FDBF1D00F391D00330C1E9625000E7C10DD00B
          6AC034639765AE964B08026CF8930057A0E5CA5CD6792D457B73C62F32761FD4
          299FAD8C3F1D1C8062F3A1DBEA696E81A559539AD235BA59AB735DEFC178BD31
          7D035C8596B94B113752E49DA776317453756D477BD23B80DBF56256E59E7E0F
          050EFB98AB1A5D66604F74A25F1812600E7457753551E06960801DD07177F90D
          7D4D488055C66E26E366A08A0285C000ADC61EDFA4D5266F4C9F00EB8D3DC7D2
          7E806AC471608016A853753550E3B56F8025D075D53516F1ABC00072FEDBDD65
          C1CD62EC1B600CD4A7C66E42DC3E982E55E302B4DA5DF6A09F9EDCF33D86DD50
          227A069A7DF701DAC9626AECC74A9EFA00DAFDA10136436754D7418AECF5D00D
          33F604CD725EB287A6E8B7A76F806AE811989A748143605FDE4CA0190D5D022D
          66E0F57D8CF16D7A9C6F805150975B06AD790EE4A5D441E13EC655CA13829560
          3718AECC1F83D98CFB1214C099DF01CDAA58964EA6B722638CFC7E011660FE32
          2D2A1A20C7FC09A854CB3158BB6CECC9F998753337408EB99C06F9327E06EBC0
          4E755FB7EFE01A388AF1BD62E932031479F279147C9B1A5B0FCD04C2B2BEF2CE
          78985E6BEF0014AC35F6DB3F4399F738F3379ED3EEDD7E09506EF3AC00F2C56A
          4D2E8D5BF3F4B4973280FCD53EE1FABB4DC69A9734800AB1C2D83F9C2535CF0C
          50EEF63FC04FEFFA05307EEA3F860000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgPesquisarClick
        ExplicitLeft = 16
      end
    end
    object edNumCNH: TVazEdit
      Left = 298
      Top = 476
      Width = 154
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      NumbersOnly = True
      ParentFont = False
      TabOrder = 16
      ChangeColor = 14745599
    end
    object edSalario: TVazEdit
      Left = 550
      Top = 420
      Width = 98
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      TabOrder = 14
      OnEnter = edSalarioExit
      OnExit = edSalarioExit
      ChangeColor = 14745599
    end
    object edCodCidade: TVazEdit
      Left = 24
      Top = 314
      Width = 54
      Height = 29
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 5
      NumbersOnly = True
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 7
      OnExit = edCodCidadeExit
      OnKeyPress = edCodCidadeKeyPress
      ChangeColor = 14745599
    end
    object edCodCargo: TVazEdit
      Left = 24
      Top = 476
      Width = 42
      Height = 29
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 5
      NumbersOnly = True
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 15
      OnExit = edCodCargoExit
      OnKeyPress = edCodCargoKeyPress
      ChangeColor = 14745599
    end
    object edCargo: TVazEdit
      Left = 72
      Top = 476
      Width = 183
      Height = 29
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 25
      ChangeColor = 14745599
    end
    object pnlPesquisaCargo: TPanel
      Left = 260
      Top = 476
      Width = 33
      Height = 29
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 26
      object imgCargo: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 29
        Cursor = crHandPoint
        Hint = 'Pesquisar Cargo'
        Align = alClient
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000002
          A54944415478DAED965B884D511CC6D76E2E261ECC50333C30721D531EE445B9
          0CD128920721522EC983E461521445CAED8DE24152232F484A2986D230529E24
          1A83D4BC98A4DC4586D3F6FBB7D66EFE767B9F598B3947C9AAAFEFECB5D7F7FF
          BEBD2E7B9FC8FCE516FD1301E238963A0DE06B14451FCA1200D349D046B0064C
          0415EE563FB80F2E82B304FA34A401301E011D01DB9CBE580D998D5D84383524
          01301F077580A640ED39B08520FDBF1D00F391D00330C1E9625000E7C10DD00B
          6AC034639765AE964B08026CF8930057A0E5CA5CD6792D457B73C62F32761FD4
          299FAD8C3F1D1C8062F3A1DBEA696E81A559539AD235BA59AB735DEFC178BD31
          7D035C8596B94B113752E49DA776317453756D477BD23B80DBF56256E59E7E0F
          050EFB98AB1A5D66604F74A25F1812600E7457753551E06960801DD07177F90D
          7D4D488055C66E26E366A08A0285C000ADC61EDFA4D5266F4C9F00EB8D3DC7D2
          7E806AC471608016A853753550E3B56F8025D075D53516F1ABC00072FEDBDD65
          C1CD62EC1B600CD4A7C66E42DC3E982E55E302B4DA5DF6A09F9EDCF33D86DD50
          227A069A7DF701DAC9626AECC74A9EFA00DAFDA10136436754D7418AECF5D00D
          33F604CD725EB287A6E8B7A76F806AE811989A748143605FDE4CA0190D5D022D
          66E0F57D8CF16D7A9C6F805150975B06AD790EE4A5D441E13EC655CA13829560
          3718AECC1F83D98CFB1214C099DF01CDAA58964EA6B722638CFC7E011660FE32
          2D2A1A20C7FC09A854CB3158BB6CECC9F998753337408EB99C06F9327E06EBC0
          4E755FB7EFE01A388AF1BD62E932031479F279147C9B1A5B0FCD04C2B2BEF2CE
          78985E6BEF0014AC35F6DB3F4399F738F3379ED3EEDD7E09506EF3AC00F2C56A
          4D2E8D5BF3F4B4973280FCD53EE1FABB4DC69A9734800AB1C2D83F9C2535CF0C
          50EEF63FC04FEFFA05307EEA3F860000000049454E44AE426082}
        Proportional = True
        ShowHint = True
        OnClick = imgCargoClick
        ExplicitLeft = 1
      end
    end
    object edDtDemissao: TVazMaskEdit
      Left = 431
      Top = 420
      Width = 105
      Height = 27
      EditMask = '99/99/9999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 13
      Text = ''
      TypeMask = TtmData
      ChangeColor = 14745599
    end
    object edDtAdmissao: TVazMaskEdit
      Left = 311
      Top = 420
      Width = 105
      Height = 27
      EditMask = '99/99/9999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 12
      Text = ''
      OnExit = edDtAdmissaoExit
      TypeMask = TtmData
      ChangeColor = 14745599
    end
    object edValCNH: TVazMaskEdit
      Left = 545
      Top = 476
      Width = 105
      Height = 27
      EditMask = '99/99/9999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 18
      Text = ''
      TypeMask = TtmData
      ChangeColor = 14745599
    end
    object edCategoria: TComboBox
      Left = 458
      Top = 476
      Width = 72
      Height = 29
      Align = alCustom
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemHeight = 23
      ParentFont = False
      TabOrder = 17
      Items.Strings = (
        'A'
        'B'
        'C'
        'D'
        'E'
        'AB')
    end
  end
end
