inherited Frm_Cad_Fornecedor: TFrm_Cad_Fornecedor
  Caption = 'Frm_Cad_Fornecedor'
  ClientHeight = 685
  ClientWidth = 655
  OnCreate = FormCreate
  ExplicitWidth = 661
  ExplicitHeight = 714
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 655
    Height = 685
    Anchors = [akLeft, akTop]
    ExplicitWidth = 655
    ExplicitHeight = 685
    inherited lblUsuarioDataCad: TLabel
      Top = 589
      ExplicitTop = 589
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Top = 617
      ExplicitTop = 617
    end
    object lblNome: TLabel [3]
      Left = 24
      Top = 82
      Width = 86
      Height = 21
      Caption = 'Fornecedor*'
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
      Width = 103
      Height = 21
      Caption = 'Nome Fantasia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblIE: TLabel [5]
      Left = 202
      Top = 464
      Width = 12
      Height = 21
      Caption = 'IE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTelefone: TLabel [6]
      Left = 24
      Top = 354
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
    object lblEmail: TLabel [7]
      Left = 161
      Top = 354
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
    object lblLogradouro: TLabel [8]
      Left = 24
      Top = 190
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
    object lblBairro: TLabel [9]
      Left = 24
      Top = 246
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
    object lblNum: TLabel [10]
      Left = 548
      Top = 192
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
    object lblCidade: TLabel [11]
      Left = 85
      Top = 301
      Width = 55
      Height = 21
      Caption = 'Cidade*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCaptionText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblUF: TLabel [12]
      Left = 594
      Top = 301
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
    object lblCEP: TLabel [13]
      Left = 529
      Top = 138
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
    object lblContato: TLabel [14]
      Left = 24
      Top = 410
      Width = 55
      Height = 21
      Caption = 'Contato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblsite: TLabel [15]
      Left = 221
      Top = 410
      Width = 26
      Height = 21
      Caption = 'Site'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCNPJ: TLabel [16]
      Left = 24
      Top = 464
      Width = 43
      Height = 21
      Caption = 'CNPJ*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCodCidade: TLabel [17]
      Left = 26
      Top = 301
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
    object lblCodCondPag: TLabel [18]
      Left = 24
      Top = 518
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
    object lblCondPag: TLabel [19]
      Left = 82
      Top = 518
      Width = 129
      Height = 21
      Caption = 'Cond. Pagamento*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlSalvar: TPanel
      Left = 370
      Top = 589
      ExplicitLeft = 370
      ExplicitTop = 589
    end
    inherited pnlSair: TPanel
      Left = 513
      Top = 589
      ExplicitLeft = 513
      ExplicitTop = 589
    end
    object edNome: TVazEdit
      Left = 24
      Top = 104
      Width = 610
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
      TabOrder = 3
      TextHint = 'digite o fornecedor'
      ChangeColor = 14745599
    end
    object edNomeFantasia: TVazEdit
      Left = 24
      Top = 160
      Width = 495
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 4
      TextHint = 'Digite o nome fantasia da empresa'
      ChangeColor = 14745599
    end
    object edIE: TVazEdit
      Left = 202
      Top = 485
      Width = 225
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 14
      NumbersOnly = True
      ParentFont = False
      TabOrder = 5
      TextHint = 'digite a inscri'#231#227'o estadual'
      ChangeColor = 14745599
    end
    object edTelefone: TVazMaskEdit
      Left = 24
      Top = 374
      Width = 128
      Height = 29
      EditMask = '(99) 9999-9999;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 6
      Text = ''
      TypeMask = TtmTelefone
      ChangeColor = 14745599
    end
    object edEmail: TVazEdit
      Left = 161
      Top = 374
      Width = 473
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 7
      TextHint = 'digite o e-mail'
      ChangeColor = 14745599
    end
    object edCEP: TVazMaskEdit
      Left = 528
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
      TabOrder = 8
      Text = ''
      TypeMask = TtmCEP
      ChangeColor = 14745599
    end
    object edLogradouro: TVazEdit
      Left = 24
      Top = 213
      Width = 515
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 9
      TextHint = 'digite o logradouro'
      ChangeColor = 14745599
    end
    object edBairro: TVazEdit
      Left = 24
      Top = 266
      Width = 610
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 10
      TextHint = 'digite o bairro'
      ChangeColor = 14745599
    end
    object edNum: TVazEdit
      Left = 548
      Top = 213
      Width = 86
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
    object edCidade: TVazEdit
      Left = 85
      Top = 322
      Width = 463
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
      TextHint = 'digite a cidade'
      ChangeColor = 14745599
    end
    object edUF: TVazEdit
      Left = 594
      Top = 322
      Width = 40
      Height = 29
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 13
      ChangeColor = 14745599
    end
    object pnlPesquisar: TPanel
      Left = 555
      Top = 322
      Width = 33
      Height = 29
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 14
      object imgPesquisar: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 29
        Cursor = crHandPoint
        Hint = 'Pesquisar Cidade'
        Align = alClient
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
    object edContato: TVazEdit
      Left = 24
      Top = 430
      Width = 187
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      TabOrder = 15
      TextHint = 'digite o nome do contato'
      ChangeColor = 14745599
    end
    object edSite: TVazEdit
      Left = 221
      Top = 430
      Width = 413
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 16
      TextHint = 'digite o site da empresa'
      ChangeColor = 14745599
    end
    object edCNPJ: TVazMaskEdit
      Left = 24
      Top = 485
      Width = 170
      Height = 29
      EditMask = '99.999.999/9999-99;0;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 18
      ParentFont = False
      TabOrder = 17
      Text = ''
      TypeMask = TtmCNPJ
      ChangeColor = 14745599
    end
    object rgTpPessoa: TRadioGroup
      Left = 137
      Top = 28
      Width = 279
      Height = 47
      BiDiMode = bdLeftToRight
      Caption = 'Tipo Pessoa'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'F'#237'sica'
        'J'#250'ridica')
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 18
      OnClick = rgTpPessoaClick
    end
    object edCodCidade: TVazEdit
      Left = 24
      Top = 322
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
      TabOrder = 19
      OnExit = edCodCidadeExit
      OnKeyPress = edCodCidadeKeyPress
      ChangeColor = 14745599
    end
    object edCodCondPag: TVazEdit
      Left = 22
      Top = 539
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
      TabOrder = 20
      OnExit = edCodCondPagExit
      OnKeyPress = edCodCondPagKeyPress
      ChangeColor = 14745599
    end
    object edCondPag: TVazEdit
      Left = 82
      Top = 539
      Width = 298
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      ReadOnly = True
      TabOrder = 21
      ChangeColor = 14745599
    end
    object pnlPesquisaCondPag: TPanel
      Left = 386
      Top = 539
      Width = 33
      Height = 29
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 22
      object imgPesquisaCondPag: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 29
        Cursor = crHandPoint
        Hint = 'Pesquisar Cidade'
        Align = alClient
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
        OnClick = imgPesquisaCondPagClick
        ExplicitLeft = 16
      end
    end
    object rgSexo: TRadioGroup
      Left = 425
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
  end
end
