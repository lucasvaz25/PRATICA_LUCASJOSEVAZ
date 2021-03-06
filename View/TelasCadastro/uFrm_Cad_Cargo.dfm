inherited Frm_Cad_Cargo: TFrm_Cad_Cargo
  Caption = 'Frm_Cad_Cargo'
  ClientHeight = 311
  ClientWidth = 437
  OnCreate = FormCreate
  ExplicitWidth = 443
  ExplicitHeight = 340
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 437
    Height = 311
    ExplicitWidth = 437
    ExplicitHeight = 311
    inherited lblUsuarioDataCad: TLabel
      Top = 284
      ExplicitTop = 284
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Left = 241
      Top = 284
      ExplicitLeft = 241
      ExplicitTop = 284
    end
    object lblCargo: TLabel [3]
      Left = 24
      Top = 82
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
    object lblDepartamento: TLabel [4]
      Left = 75
      Top = 139
      Width = 107
      Height = 21
      Caption = 'Departamento*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCodDept: TLabel [5]
      Left = 22
      Top = 139
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
      Left = 150
      Top = 215
      ExplicitLeft = 150
      ExplicitTop = 215
    end
    inherited pnlSair: TPanel
      Left = 284
      Top = 215
      ExplicitLeft = 284
      ExplicitTop = 215
    end
    object edCargo: TVazEdit
      Left = 22
      Top = 104
      Width = 380
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
      TabOrder = 3
      TextHint = 'digite o Cargo'
      ChangeColor = 14745599
    end
    object edDepartamento: TVazEdit
      Left = 73
      Top = 161
      Width = 289
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
      TabOrder = 4
      ChangeColor = 14745599
    end
    object edCodDept: TVazEdit
      Left = 20
      Top = 161
      Width = 47
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
      TabOrder = 5
      OnExit = edCodDeptExit
      OnKeyPress = edCodDeptKeyPress
      ChangeColor = 14745599
    end
    object pnlPesquisar: TPanel
      Left = 369
      Top = 161
      Width = 33
      Height = 29
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 6
      object imgPesquisar: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 29
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
        Width = 33
        Height = 29
        Align = alClient
        Flat = True
        OnClick = btnPesquisarClick
        ExplicitLeft = 8
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object chkObrigatorioCNH: TCheckBox
      Left = 305
      Top = 55
      Width = 97
      Height = 17
      Caption = 'Obrigat'#243'rio CNH'
      TabOrder = 7
    end
  end
end
