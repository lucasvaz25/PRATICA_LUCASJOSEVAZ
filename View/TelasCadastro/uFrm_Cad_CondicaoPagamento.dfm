inherited Frm_Cad_CondicaoPagamento: TFrm_Cad_CondicaoPagamento
  Caption = 'Frm_Cad_CondicaoPagamento'
  ClientHeight = 671
  OnCreate = FormCreate
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 671
    ExplicitHeight = 671
    inherited lblUsuarioDataCad: TLabel
      Left = 10
      Top = 575
      ExplicitLeft = 10
      ExplicitTop = 566
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Left = 10
      Top = 600
      ExplicitLeft = 10
      ExplicitTop = 600
    end
    object lblCondPag: TLabel [3]
      Left = 24
      Top = 81
      Width = 175
      Height = 21
      Caption = 'Condi'#231#227'o de Pagamento*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblParcelas: TLabel [4]
      Left = 468
      Top = 81
      Width = 56
      Height = 21
      Caption = 'Parcelas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbltxJuros: TLabel [5]
      Left = 24
      Top = 137
      Width = 77
      Height = 21
      Caption = 'Taxa Juros*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblMulta: TLabel [6]
      Left = 114
      Top = 137
      Width = 47
      Height = 21
      Caption = 'Multa*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblDesconto: TLabel [7]
      Left = 204
      Top = 137
      Width = 65
      Height = 21
      Caption = 'Desconto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTotalPorcentagem: TLabel [8]
      Left = 24
      Top = 522
      Width = 38
      Height = 13
      Caption = 'Total %'
    end
    object Panel3: TPanel [9]
      Left = 24
      Top = 208
      Width = 673
      Height = 113
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 10
      DesignSize = (
        669
        109)
      object lblParcela: TLabel
        Left = 1
        Top = -1
        Width = 49
        Height = 21
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblDias: TLabel
        Left = 16
        Top = 28
        Width = 30
        Height = 21
        Caption = 'Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblPorcentagem: TLabel
        Left = 97
        Top = 28
        Width = 13
        Height = 21
        Hint = 'Porcentagem'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblFormaPagamento: TLabel
        Left = 199
        Top = 28
        Width = 148
        Height = 21
        Caption = 'Forma de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCodFormaPagamento: TLabel
        Left = 159
        Top = 28
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
      object edDias: TVazEdit
        Left = 16
        Top = 49
        Width = 56
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 12
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        ChangeColor = 14745599
      end
      object edPorcentagem: TVazEdit
        Left = 81
        Top = 49
        Width = 51
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
        OnExit = edTxJurosEnter
        ChangeColor = 14745599
      end
      object edFormaPagamento: TVazEdit
        Left = 199
        Top = 49
        Width = 212
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
        ReadOnly = True
        TabOrder = 3
        ChangeColor = 14745599
      end
      object edCodFormaPagamento: TVazEdit
        Left = 144
        Top = 49
        Width = 50
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 12
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
        OnExit = edCodFormaPagamentoExit
        OnKeyPress = edCodFormaPagamentoKeyPress
        ChangeColor = 14745599
      end
      object pnlPesquisar: TPanel
        Left = 414
        Top = 49
        Width = 33
        Height = 29
        BevelOuter = bvNone
        Color = 16744448
        ParentBackground = False
        TabOrder = 4
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
      object pnlInserirLista: TPanel
        Left = 461
        Top = 49
        Width = 80
        Height = 29
        Anchors = [akBottom]
        BevelOuter = bvNone
        Color = 16744448
        ParentBackground = False
        TabOrder = 5
        object btnInserirLista: TSpeedButton
          Left = 0
          Top = 0
          Width = 80
          Height = 29
          Cursor = crHandPoint
          Align = alClient
          Caption = '&Inserir'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnInserirListaClick
          ExplicitLeft = 4
          ExplicitWidth = 121
          ExplicitHeight = 41
        end
      end
      object pnlEditar: TPanel
        Left = 541
        Top = 49
        Width = 80
        Height = 29
        Anchors = [akBottom]
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 6
        object btnEditar: TSpeedButton
          Left = 0
          Top = 0
          Width = 80
          Height = 29
          Cursor = crHandPoint
          Hint = 'Excluir a '#250'ltima parcela lan'#231'ada'
          Align = alClient
          Caption = '&Excluir'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnEditarClick
          ExplicitLeft = 4
          ExplicitWidth = 121
          ExplicitHeight = 41
        end
      end
    end
    object Panel1: TPanel [10]
      Left = 0
      Top = 557
      Width = 722
      Height = 114
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 8
    end
    inherited pnlSalvar: TPanel
      Top = 575
      TabOrder = 6
      ExplicitTop = 575
    end
    inherited pnlSair: TPanel
      Top = 575
      TabOrder = 7
      ExplicitTop = 575
    end
    object edCondPag: TVazEdit
      Left = 24
      Top = 104
      Width = 430
      Height = 29
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      TextHint = 'digite a descri'#231#227'o da condi'#231#227'o de pagamento'
      ChangeColor = 14745599
    end
    object edParcelas: TVazEdit
      Left = 468
      Top = 104
      Width = 56
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      ChangeColor = 14745599
    end
    object Panel2: TPanel
      Left = 24
      Top = 340
      Width = 673
      Height = 176
      Align = alCustom
      BevelOuter = bvNone
      TabOrder = 9
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 673
        Height = 176
        Align = alClient
        DataSource = DsParcelas
        DrawingStyle = gdsClassic
        FixedColor = 8553090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3947580
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindow
        TitleFont.Height = -14
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'numero'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dias'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'porcentagem'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FormaPagamento'
            Width = 398
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'botao'
            Width = -1
            Visible = False
          end>
      end
    end
    object edTxJuros: TVazEdit
      Left = 24
      Top = 160
      Width = 77
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      TabOrder = 3
      OnEnter = edTxJurosEnter
      OnExit = edTxJurosEnter
      ChangeColor = 14745599
    end
    object edMulta: TVazEdit
      Left = 114
      Top = 160
      Width = 77
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      TabOrder = 4
      OnEnter = edTxJurosEnter
      OnExit = edTxJurosEnter
      ChangeColor = 14745599
    end
    object edDesconto: TVazEdit
      Left = 204
      Top = 160
      Width = 77
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 12
      ParentFont = False
      TabOrder = 5
      OnEnter = edTxJurosEnter
      OnExit = edTxJurosEnter
      ChangeColor = 14745599
    end
    object ProgressBar1: TProgressBar
      Left = 98
      Top = 518
      Width = 150
      Height = 17
      BarColor = clHighlight
      BackgroundColor = clHighlight
      TabOrder = 11
    end
  end
  object TDset_Parcelas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 487
    Top = 400
    object TDset_Parcelasnumero: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'numero'
    end
    object TDset_Parcelasdias: TIntegerField
      DisplayLabel = 'Dias'
      FieldName = 'dias'
    end
    object TDset_ParcelasFormaPagamento: TStringField
      DisplayLabel = 'Forma Pagamento'
      FieldName = 'FormaPagamento'
      Size = 50
    end
    object TDset_Parcelasporcentagem: TFloatField
      DisplayLabel = 'Porcentagem %'
      FieldName = 'porcentagem'
    end
    object TDset_Parcelasbotao: TIntegerField
      DisplayLabel = 'Excluir'
      FieldName = 'botao'
    end
    object TDset_Parcelascod_formapgto: TIntegerField
      FieldName = 'cod_formapgto'
    end
  end
  object DsParcelas: TDataSource
    DataSet = TDset_Parcelas
    Left = 527
    Top = 400
  end
  object ImageList1: TImageList
    Left = 632
    Top = 56
    Bitmap = {
      494C010103001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000007777
      7700000000000000000000000000000000000000000000000000000000000000
      0000797979000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000191919000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001A1A1A0000000000000000000000000000000000000000000000
      000000000000000000009EA5F800424FF200424FF200A0A5F800000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004450F2003643F4003643F4003643F4003643F4003643F4003643F4004550
      F30000000000000000000000000000000000000000FF000000FF000000FF0A0A
      C8000A0AC7000A0AC7000A0AC800090AC800090AC8000A0AC8000A0AC7000A0A
      C7000A0AC800000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003643
      F4003643F4003643F4003643F4003643F4003643F4003643F4003643F4003643
      F4003643F400000000000000000000000000000000FF000000FF1D1ED1002324
      D7002525D9002323D9002223D9002122D9002122D9002223D9002324D9002424
      D9002324D7001C1DD100000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004450F2003643
      F4003643F4003643F4003643F4003643F4003643F4003643F4003643F4003643
      F4003643F400434FF2000000000000000000000000FF000000FF2324D3002E2F
      DE003132E1006E6ADF002E2FE1002E2FE2002D2FE2002E2FE2006E6AE0003132
      E0002E2FDD002123D400000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003643F4003643
      F4003643F4003844F4007E86F8003643F4003643F4007881F8003845F4003643
      F4003643F4003643F4000000000000000000000000FF000000FF2626D4003435
      DF007674E500EEE6E6007673E5003737E5003637E6007673E600EEE6E6007674
      E6003535E0002324D300000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009DA3F8003643F4003643
      F4003643F4007982F800FFFFFF007E86F8007881F800FFFFFF007F87F8003643
      F4003643F4003643F400A0A5F80000000000000000FF000000FF2728D3003A3B
      E1004040E7007D7CEB00F4EFEF00807EEA007B7AEB00F4EFEF008280EA004141
      E7003B3BE1002525D200000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000424FF2003643F4003643
      F4003643F4003643F4007982F800FFFFFF00FFFFFF007F87F8003643F4003643
      F4003643F4003643F4004450F20000000000000000FF000000FF2829D2004041
      E2004949E9004949EA008483EF00F8F5F500F8F5F5008887EE00494AEA004848
      E8003F3FE2002727D100000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000424FF2003643F4003643
      F4003643F4003643F4007881F800FFFFFF00FFFFFF007E86F8003643F4003643
      F4003643F4003643F4004450F20000000000000000FF000000FF2D2ED3004747
      E5005151EC005353ED008B8AF200FBFAFA00FBFAFA008F8EF2005253EE005050
      EB004747E4002D2ED300000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009DA3F8003643F4003643
      F4003643F4007881F800FFFFFF007F87F8007982F800FFFFFF007E86F8003643
      F4003643F4003643F4009EA5F80000000000000000FF000000FF3132D5004D4E
      E6005A5AEE009191F400FDFDFD009797F5009393F500FDFDFD009596F4005A5A
      ED004E4EE6003233D500000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003643F4003643
      F4003643F4003844F4007F87F8003643F4003643F4007982F8003946F4003643
      F4003643F4003643F4000000000000000000000000FF000000FF3636D6005455
      E8009696F500FEFEFE009A9AF7006666F3006667F4009A9AF800FEFEFE009696
      F5005656E9003A3BD900000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004450F2003643
      F4003643F4003643F4003643F4003643F4003643F4003643F4003643F4003643
      F4003643F400424FF2000000000000000000000000FF000000FF3B3CD7005859
      E8006666F0009C9CF6006B6BF4006B6BF300696BF4006A6AF3009B9CF7006666
      F1005B5BEA004344DC00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003643
      F4003643F4003643F4003643F4003643F4003643F4003643F4003643F4003643
      F4003643F400000000000000000000000000000000FF000000FF3D3DD7005758
      E6006363ED006465EE006465ED006465ED006364ED006364ED006262EC005F60
      EA005758E5004647DC00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424FF2003643F4003643F4003643F4003643F4003643F4003643F400434F
      F20000000000000000000000000000000000000000FF000000FF000000FF4E4F
      E0005151E3004E4FE0004C4CDF004949DD004849DC004748DD004748DD004747
      DB004445DB00000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002E2E2E00797979000000000000000000787878002F2F2F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009DA3F800424FF200424FF2009DA3F800000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002C2C2C0000000000000000002C2C2C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00E007FFFFFFFF0000CFF3FC3FFFFF0000
      CA53F00FE0070000CA53E007C0030000CA53C003C0030000CA53C003C0030000
      CA538001C0030000CA538001C0030000CA538001C0030000CA538001C0030000
      CFF3C003C00300008001C003C0030000C003E007C0030000C003F00FE0070000
      F99FFC3FFFFF0000FC3FFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
