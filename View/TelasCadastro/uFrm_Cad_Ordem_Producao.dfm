inherited Frm_Cad_Ordem_Producao: TFrm_Cad_Ordem_Producao
  Caption = 'Frm_Cad_Ordem_Producao'
  ClientHeight = 671
  ClientWidth = 774
  ExplicitWidth = 780
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 774
    Height = 671
    ExplicitWidth = 774
    ExplicitHeight = 550
    inherited lblUsuarioDataCad: TLabel
      Top = 644
      ExplicitTop = 523
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Left = 578
      Top = 644
      ExplicitLeft = 578
      ExplicitTop = 523
    end
    object Panel3: TPanel [3]
      Left = 0
      Top = 0
      Width = 774
      Height = 185
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      DesignSize = (
        774
        185)
      object Label1: TLabel
        Left = 335
        Top = 128
        Width = 25
        Height = 17
        Caption = 'Qtd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 24
        Top = 128
        Width = 53
        Height = 17
        Caption = 'Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 638
        Top = 128
        Width = 63
        Height = 17
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 774
        Height = 81
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
        ExplicitLeft = -49
        ExplicitTop = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 24
        Top = 146
        Width = 273
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edQtd: TVazEdit
        Left = 335
        Top = 146
        Width = 49
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 6
        NumbersOnly = True
        ParentFont = False
        TabOrder = 1
        ChangeColor = 14745599
      end
      object pnlPesquisar: TPanel
        Left = 301
        Top = 146
        Width = 29
        Height = 25
        BevelOuter = bvNone
        Color = 16744448
        ParentBackground = False
        TabOrder = 2
        object imgPesquisar: TImage
          Left = 0
          Top = 0
          Width = 29
          Height = 25
          Align = alClient
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B100000006624B474400FF00FF00FFA0BDA793000004
            0C4944415478DAED995B48154118C7E79045901A1474358A0AAD7C081421A14C
            E966172AD3B7D48A1E444A7AE96250A4F59205421744AA87B4CB5311E1A5B232
            AD1733A35E2A0B2ABA408559884269C5E9FFB173E03BDB39EBEE9959CF1A0EFC
            F9E0DBB3DFB7BFB33B33DFCCF8C47FD27CD17E8011109D207EBF7F2ACC1A6829
            940CCD84E2E5E51EE81DF40C6A851A7D3EDF674F810020136637940D8DB279DB
            6FE826741C40F7A30A0280B930A7A1558A796F4025007A3DE420802884A982C6
            69CADD071503E6E2908100E230CCC130975F40D7A13BD047296A33A0E9D00A68
            03342FCCFDE58029731D041047600E84B8D40E95E221EED9FC33D2618E418BDD
            80B104919F538DC93D0095406791DCEF2419E251BE22E80434C674391FF12E69
            07911DFBA908EE13DD500E123E50F9F7103B03E61A3481B9A9CF2C44EC37BA41
            68A8E4A313BD89E5AA102C3ECD3DB7A1D1CCDD80F8EBB481C879C2FCED1721C9
            191D102C4FB1304642DE3222F9B3C281D4C3AC65AE8750BAD33E6103C42763A7
            31771DF2AC57069165C77B2886B93311BC552704CB9705D3CC5C54012420DF17
            5590ED30E798EB398226BB01C17276C22431D736E43CAF0A520B53C05C471174
            BFCB2015307B99AB0639B7AA823C8649612E1AA9EEBA0C42B37F13737520679A
            9318A140BEC24C64AE24047DE532087D569DCCD5859C935441FA45F0AC1B87A0
            7D2E83C4C2F432573F728ED50D128FA0BDF6434604428BB11EE6EA43CE385510
            2F7C5A6F9173B62A48074C2A7345A3B3B72167BA2A0855BB85CC5581A0A52E83
            5079BF87B9AA9073872A887942EC44D0F92E83BC844964AE3CE4BCAA0A3205E6
            83082E51B210B8C5258865C2585D061A55D9D390AF5B094406AF83E1E534AD06
            17B954343E12C17DB21679B6388D150E84163EE62291360AAA3583EC84396572
            A720CF132D20324923CC6AE6FA258C114CCB9E94AC7A6F89E085D565C4DF1C49
            3C2B9039C258EAC632F73768936A492F176ED499F95297E6AF0588DDA5154426
            CC87B96072D39BD9055547B8F940C36AA5087E13D46855486F7C403B884C5E06
            7328C4259A38F72171F36031641C1A9DA85C4FB5F819ED40D21BFFA91D641018
            6A34070436E868D80E6CD0250863932EB0419728EC351A31F39CBE19275BA6D4
            0969D48AB57B8F42AB9730FDDA41240C15722745F0C684D346FDEA0A341E5AA9
            0B26D2638525C2A88D68788EB1791B7DF7F40956E2E1DA1183D61BB449976D71
            4F03946B0746F5A067B284C914C641CF2C611CF4FC11C6AEE42761CCDC6DF40F
            E381BE9BEED70613F5A337C0D0228EE614AB1D46DAF5CCB11ACDA20EE20086AA
            808DE1603C01A203C63320AA309E027100D324617E781644C2D819CD0AF8F9A3
            2741248CD59B29034439777816C402E61F08CF8384800909312C40240CF5995C
            ABC3D2610162A78D8078ADFD0501F79442478F295F0000000049454E44AE4260
            82}
          Proportional = True
          ShowHint = False
          ExplicitLeft = 1
          ExplicitTop = 1
          ExplicitWidth = 32
          ExplicitHeight = 27
        end
        object btnPesquisar: TSpeedButton
          Left = 0
          Top = 0
          Width = 29
          Height = 25
          Align = alClient
          Flat = True
          ExplicitLeft = 8
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object pnlInserirLista: TPanel
        Left = 406
        Top = 146
        Width = 155
        Height = 25
        Anchors = [akBottom]
        BevelOuter = bvNone
        Color = 16744448
        ParentBackground = False
        TabOrder = 3
        object btnInserirLista: TSpeedButton
          Left = 0
          Top = 0
          Width = 155
          Height = 25
          Cursor = crHandPoint
          Align = alClient
          Caption = '&Inserir na lista '
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 4
          ExplicitWidth = 121
          ExplicitHeight = 41
        end
      end
      object DateTimePicker1: TDateTimePicker
        Left = 638
        Top = 146
        Width = 113
        Height = 25
        Date = 44300.000000000000000000
        Time = 0.004326643516833428
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object pnlCaptionMateriaPrima: TPanel
        Left = 0
        Top = 81
        Width = 774
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Sele'#231#227'o de Mat'#233'ria-prima'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
    end
    object Panel2: TPanel [4]
      Left = 0
      Top = 416
      Width = 774
      Height = 255
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 4
    end
    object pnlGriid: TPanel [5]
      Left = 0
      Top = 185
      Width = 774
      Height = 231
      Align = alClient
      TabOrder = 3
      ExplicitTop = 153
      ExplicitHeight = 300
      object pnlGrid: TPanel
        Left = 1
        Top = 26
        Width = 772
        Height = 204
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = 97
        ExplicitWidth = 703
        ExplicitHeight = 313
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 772
          Height = 204
          Align = alClient
          BorderStyle = bsNone
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
        end
      end
      object pnlCaptionGrid: TPanel
        Left = 1
        Top = 1
        Width = 772
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Itens da composi'#231#227'o do Produto'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 774
      end
    end
    inherited pnlSalvar: TPanel
      Left = 451
      Top = 575
      ExplicitLeft = 451
      ExplicitTop = 454
    end
    inherited pnlSair: TPanel
      Left = 604
      Top = 575
      ExplicitLeft = 604
      ExplicitTop = 454
    end
  end
  object DsItensProducao: TDataSource
    Left = 591
    Top = 263
  end
  object TDset_ItensProducao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 551
    Top = 263
  end
end
