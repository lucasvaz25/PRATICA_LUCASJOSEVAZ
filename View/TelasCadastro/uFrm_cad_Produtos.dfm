inherited Frm_Cad_Produto: TFrm_Cad_Produto
  Caption = 'Frm_Cad_Produto'
  ClientHeight = 568
  ClientWidth = 735
  OnCreate = FormCreate
  ExplicitWidth = 741
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 735
    Height = 568
    ExplicitWidth = 735
    ExplicitHeight = 568
    inherited lblUsuarioDataCad: TLabel
      Top = 472
      ExplicitTop = 472
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Top = 500
      ExplicitTop = 500
    end
    object lblDescricao: TLabel [3]
      Left = 24
      Top = 82
      Width = 63
      Height = 21
      Caption = 'Produto*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblVlrCusto: TLabel [4]
      Left = 356
      Top = 138
      Width = 83
      Height = 21
      Caption = 'Pre'#231'o Custo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblVlrVenda: TLabel [5]
      Left = 257
      Top = 138
      Width = 93
      Height = 21
      Caption = 'Pre'#231'o Venda*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblUnidade: TLabel [6]
      Left = 72
      Top = 139
      Width = 65
      Height = 21
      Caption = 'Unidade*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblEstoque: TLabel [7]
      Left = 452
      Top = 139
      Width = 55
      Height = 21
      Caption = 'Estoque'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblFornecedor: TLabel [8]
      Left = 72
      Top = 198
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
    object lblSubGrupo: TLabel [9]
      Left = 72
      Top = 255
      Width = 78
      Height = 21
      Caption = 'SubGrupo*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblGrupo: TLabel [10]
      Left = 456
      Top = 256
      Width = 44
      Height = 21
      Caption = 'Grupo'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblObs: TLabel [11]
      Left = 24
      Top = 311
      Width = 82
      Height = 21
      Caption = 'Observa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCodFormaPagamento: TLabel [12]
      Left = 31
      Top = 139
      Width = 31
      Height = 21
      Hint = 'Porcentagem'
      Caption = 'C'#243'd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel [13]
      Left = 31
      Top = 198
      Width = 31
      Height = 21
      Hint = 'Porcentagem'
      Caption = 'C'#243'd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel [14]
      Left = 31
      Top = 255
      Width = 31
      Height = 21
      Hint = 'Porcentagem'
      Caption = 'C'#243'd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited edCodigo: TVazEdit
      TabOrder = 12
    end
    inherited pnlSalvar: TPanel
      Left = 465
      Top = 472
      TabOrder = 13
      ExplicitLeft = 465
      ExplicitTop = 472
    end
    inherited pnlSair: TPanel
      Left = 601
      Top = 472
      TabOrder = 14
      ExplicitLeft = 601
      ExplicitTop = 472
    end
    object edproduto: TVazEdit
      Left = 24
      Top = 104
      Width = 497
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      TextHint = 'digite a descri'#231#227'o do produto'
      ChangeColor = 14745599
    end
    object edVlrCusto: TVazEdit
      Left = 356
      Top = 159
      Width = 90
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 4
      OnEnter = edVlrVendaEnter
      OnExit = edVlrVendaEnter
      ChangeColor = 14745599
    end
    object edVlrVenda: TVazEdit
      Left = 257
      Top = 159
      Width = 93
      Height = 29
      Anchors = [akLeft, akTop, akRight]
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
      OnEnter = edVlrVendaEnter
      OnExit = edVlrVendaEnter
      ChangeColor = 14745599
    end
    object pnlImage: TPanel
      Left = 535
      Top = 60
      Width = 185
      Height = 180
      BevelKind = bkTile
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      Visible = False
      object imgProduto: TImage
        Left = 8
        Top = 20
        Width = 161
        Height = 105
        Stretch = True
      end
      object lblImageProduto: TLabel
        Left = 35
        Top = 4
        Width = 103
        Height = 13
        Caption = 'Imagem do produto'
      end
      object pnlInserirImagem: TPanel
        Left = 8
        Top = 140
        Width = 64
        Height = 30
        Color = 16744448
        ParentBackground = False
        TabOrder = 0
        object btnInserirImagem: TSpeedButton
          Left = 1
          Top = 1
          Width = 62
          Height = 28
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Inserir'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnInserirImagemClick
          ExplicitLeft = 32
          ExplicitTop = 16
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object pnlRemoverImage: TPanel
        Left = 109
        Top = 140
        Width = 64
        Height = 30
        Color = 16744448
        ParentBackground = False
        TabOrder = 1
        object btnRemoverImage: TSpeedButton
          Left = 1
          Top = 1
          Width = 62
          Height = 28
          Align = alClient
          Caption = 'Remover'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 32
          ExplicitTop = 16
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
    end
    object edEstoque: TVazEdit
      Left = 452
      Top = 159
      Width = 69
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdLeftToRight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 5
      NumbersOnly = True
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 5
      ChangeColor = 14745599
    end
    object edFornecedor: TVazEdit
      Left = 72
      Top = 220
      Width = 338
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      ChangeColor = 14745599
    end
    object pnlPesquisar: TPanel
      Left = 416
      Top = 220
      Width = 33
      Height = 29
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 16
      object imgPesquisar: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 29
        Hint = 'Pesquisar Pa'#237'ses'
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
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 32
        ExplicitHeight = 27
      end
    end
    object edSubGrupo: TVazEdit
      Left = 72
      Top = 278
      Width = 338
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 9
      ChangeColor = 14745599
    end
    object Panel1: TPanel
      Left = 416
      Top = 278
      Width = 33
      Height = 29
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 17
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 29
        Hint = 'Pesquisar Pa'#237'ses'
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
        OnClick = Image1Click
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 32
        ExplicitHeight = 27
      end
    end
    object edGrupo: TVazEdit
      Left = 456
      Top = 278
      Width = 264
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdLeftToRight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 10
      ChangeColor = 14745599
    end
    object edObs: TMemo
      Left = 24
      Top = 334
      Width = 696
      Height = 89
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 100
      ParentFont = False
      TabOrder = 11
    end
    object edUnidade: TVazEdit
      Left = 72
      Top = 159
      Width = 137
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      ChangeColor = 14745599
    end
    object Panel2: TPanel
      Left = 215
      Top = 160
      Width = 33
      Height = 29
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 18
      object Image2: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 29
        Hint = 'Pesquisar Pa'#237'ses'
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
        OnClick = Image2Click
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 32
        ExplicitHeight = 27
      end
    end
    object edCodUnidade: TVazEdit
      Left = 24
      Top = 159
      Width = 42
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      OnExit = edCodUnidadeExit
      OnKeyPress = edCodUnidadeKeyPress
      ChangeColor = 14745599
    end
    object edCodFornecedor: TVazEdit
      Left = 24
      Top = 220
      Width = 42
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      NumbersOnly = True
      ParentFont = False
      TabOrder = 6
      OnExit = edCodFornecedorExit
      OnKeyPress = edCodFornecedorKeyPress
      ChangeColor = 14745599
    end
    object edCodSubgrupo: TVazEdit
      Left = 24
      Top = 278
      Width = 42
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      NumbersOnly = True
      ParentFont = False
      TabOrder = 8
      OnExit = edCodSubgrupoExit
      OnKeyPress = edCodSubgrupoKeyPress
      ChangeColor = 14745599
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 672
    Top = 104
  end
end
