inherited Frm_Venda: TFrm_Venda
  Caption = 'Frm_Venda'
  ClientHeight = 488
  ClientWidth = 862
  ExplicitTop = -19
  ExplicitWidth = 878
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 862
    Height = 488
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 712
    ExplicitHeight = 472
    object pnlRodape: TPanel
      Left = 0
      Top = 360
      Width = 862
      Height = 128
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 363
      DesignSize = (
        862
        128)
      object lblUsuarioDataCad: TLabel
        Left = 9
        Top = 6
        Width = 158
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Nome usu'#225'rio e data de Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object pnlTotais: TPanel
        Left = 470
        Top = 5
        Width = 375
        Height = 65
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        BevelOuter = bvNone
        TabOrder = 0
        object pnlTotal: TPanel
          Left = 250
          Top = 0
          Width = 125
          Height = 65
          Align = alRight
          BevelOuter = bvNone
          Color = 11468718
          ParentBackground = False
          TabOrder = 0
          ExplicitLeft = 60
          ExplicitHeight = 67
          object lblTotal: TLabel
            Left = 96
            Top = 7
            Width = 25
            Height = 13
            Caption = 'Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblrealTotal: TLabel
            Left = 5
            Top = 31
            Width = 27
            Height = 32
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblVlrTotal: TLabel
            Left = 24
            Top = 31
            Width = 97
            Height = 32
            BiDiMode = bdRightToLeft
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
          end
        end
        object pnlSubTotal: TPanel
          Left = 0
          Top = 0
          Width = 125
          Height = 65
          Align = alLeft
          BevelOuter = bvNone
          Color = 11468799
          ParentBackground = False
          TabOrder = 1
          ExplicitLeft = 60
          ExplicitHeight = 67
          object lblSubtotal: TLabel
            Left = 77
            Top = 7
            Width = 44
            Height = 21
            Caption = 'Subtotal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblrealsubtotal: TLabel
            Left = 5
            Top = 31
            Width = 27
            Height = 32
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblVlrSubtotal: TLabel
            Left = 38
            Top = 31
            Width = 83
            Height = 32
            BiDiMode = bdRightToLeft
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
          end
        end
        object pnlDesconto: TPanel
          Left = 125
          Top = 0
          Width = 125
          Height = 65
          Align = alRight
          BevelOuter = bvNone
          Color = 12698111
          ParentBackground = False
          TabOrder = 2
          ExplicitLeft = 60
          ExplicitHeight = 67
          object lblDesconto: TLabel
            Left = 72
            Top = 7
            Width = 49
            Height = 13
            Caption = 'Desconto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblrealDesconto: TLabel
            Left = 3
            Top = 32
            Width = 27
            Height = 32
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblValorDesconto: TLabel
            Left = 36
            Top = 31
            Width = 85
            Height = 32
            BiDiMode = bdRightToLeft
            Caption = '0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
          end
        end
      end
      object pnlReceber: TPanel
        Left = 19
        Top = 85
        Width = 120
        Height = 32
        Anchors = [akLeft, akBottom]
        BevelOuter = bvNone
        Color = 16744448
        ParentBackground = False
        TabOrder = 1
        object btnReceber: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Caption = '&Receber'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 25
        end
      end
      object pnlLimpar: TPanel
        Left = 607
        Top = 85
        Width = 120
        Height = 32
        Anchors = [akRight, akBottom]
        BevelOuter = bvNone
        Color = 9999508
        ParentBackground = False
        TabOrder = 2
        object btnLimpar: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Caption = '&Limpar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitTop = -8
        end
      end
      object pnlSair: TPanel
        Left = 730
        Top = 85
        Width = 120
        Height = 32
        Anchors = [akRight, akBottom]
        BevelOuter = bvNone
        Color = 3355647
        ParentBackground = False
        TabOrder = 3
        object btnSair: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 32
          Cursor = crHandPoint
          Align = alClient
          Caption = '&Sair'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitTop = -8
        end
      end
    end
    object pnlCabecario: TPanel
      Left = 0
      Top = 0
      Width = 862
      Height = 145
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = -3
      DesignSize = (
        862
        145)
      object lblVenda: TLabel
        Left = 9
        Top = 9
        Width = 43
        Height = 21
        Caption = 'Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblCliente: TLabel
        Left = 97
        Top = 9
        Width = 55
        Height = 21
        Caption = 'Cliente*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblProduto: TLabel
        Left = 9
        Top = 64
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
      object lblQtd: TLabel
        Left = 594
        Top = 64
        Width = 37
        Height = 21
        Caption = 'Qtde.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edCodigo: TVazEdit
        Left = 9
        Top = 28
        Width = 65
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ChangeColor = 14745599
      end
      object lkpClientes: TDBLookupComboBox
        Left = 97
        Top = 27
        Width = 450
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object pnlbotoes: TPanel
        Left = 550
        Top = 27
        Width = 66
        Height = 29
        BevelOuter = bvNone
        TabOrder = 2
        object pnlNovoCad: TPanel
          Left = 0
          Top = 0
          Width = 33
          Height = 29
          Align = alLeft
          BevelOuter = bvNone
          Color = 16744448
          ParentBackground = False
          TabOrder = 0
          object imgNovoCad: TImage
            Left = 0
            Top = 0
            Width = 33
            Height = 29
            Cursor = crHandPoint
            Align = alClient
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
              003008060000005702F98700000006624B474400FF00FF00FFA0BDA793000000
              A44944415478DAEDD63B0E8020108461F75ABE0E2FE8B570496C2CD025511793
              7F1A1A12E64B2846BA9F47BC0B00F02E00C0BB40538094D2AA477F732D8AC8D4
              2A20991ED50000000000000000009CCBE77DB318AF4F6A88AF028CC3ECAB1407
              E015C0F41DBE4AE9DB010000000080D700418FD1BBF891A0FDE72A406D149CB1
              C1787DD042DB13EF32E600000000000000000D012C03B038CCDC011E01E01D00
              DEF93D60078B5D9631C96114F50000000049454E44AE426082}
            Proportional = True
            ExplicitLeft = 48
            ExplicitTop = 24
            ExplicitWidth = 105
            ExplicitHeight = 105
          end
          object btnNovoCad: TSpeedButton
            Left = 0
            Top = 0
            Width = 33
            Height = 29
            Cursor = crHandPoint
            Hint = 'Novo'
            Align = alClient
            Flat = True
            ParentShowHint = False
            ShowHint = True
            ExplicitLeft = 8
            ExplicitTop = 16
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object pnlAlterarCad: TPanel
          Left = 33
          Top = 0
          Width = 33
          Height = 29
          Align = alRight
          BevelOuter = bvNone
          Color = clMedGray
          ParentBackground = False
          TabOrder = 1
          object imgAlterarCad: TImage
            Left = 0
            Top = 0
            Width = 33
            Height = 29
            Cursor = crHandPoint
            Align = alClient
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000340000
              00340806000000C5781BEB00000006624B474400FF00FF00FFA0BDA793000005
              A24944415478DAD59A696C554514C7E7919A20015151C044A38909C62814C444
              71C1682CA5058D0103244891C5A282960AB8A1B8E0062EE04241CB0776344A00
              A5C86684B8804BD144A21F2506E307D9C10504EAFF9F998BE7CD9BBBBDDEFB6E
              BDC9C9C99B39F79EF3EBB93373666E73AA8D5E2D2D2DBDA06E819C01D905D99C
              CBE54E84DD97CB3A7007487BA8B7213556D74F906180DAF5BF01020CB3B10A72
              9B8FC941C800407DD3E68100C3583E800C0931DD0FA900D4CE360D64A02643CD
              8960EA9BA9CC8100710102FB4DFC7E08EAD508B73A3395291082BF1A6A23A411
              813D2ADAEBA15E8BF088824C650684A0FB43AD8374324DB39280CA04C8AC313B
              20675A5DCF20B0A785DDC3048DF048BE7E37714ACF0AA81D542364ACA3DB867A
              04EAA5088FFD11D2ABA44008AECC5BED6342F1557C31828BCA920121A8CBA13E
              848C41B09F1701F518D40B216EA6940408C15C01F509A41BE428A4AA48A8C7A1
              9E0F70559B3A1082B8D2C07415CD5C772E45B07F1501F504D44C87DD49488F54
              81E0BCA781395F341F81547B1912B671A09E847AD6B2990B9BFAD480E0B41C6A
              0BE43C0B86AFDB17C2EE74A510136A06DBCCCFD54A57E227520182B3DE509B2D
              983F2083E0749BB06380754A2C8CA6486D80DCEB78B4BDF8724AE79EE976B41F
              635BE24070D2C7C07411CDCCCC4038FD52D83D05E5FDC5F3EAB298992A931BBF
              44817C605C99712D9679254C9C4CC92B312053686E829C239A0F2B9D99EDC2CE
              35A0BD6B0B6C2B846D50A6FAC3F6B35480E0F82AA53373AE055309A73B845D50
              6DF63DE456D8EFB39E6D67AA05321576CEC2B5D54070788DD25B80CE21307EEB
              07AF66A5C7D00161EF9AFD464146A37DA55F3CAD0282A37E501F5B3087947ECD
              24CC74A8E762C0D419F86AABA228C7EFEF82622A1A080EAE33306785C04C839A
              EDF31806C7D76CBF0533C7C4C6096530FAB7468DAB282038BD016ABDFA6F73E6
              C1F035FB4AD8051594DF2A3DABC9CC3C0835D78A8B53FE65729B9E28109C5EAF
              7466C260A642BDECF318AE371556662640CDB762E204500FBBD7A3C6170B2846
              66E2C2D4422D70C04C86DD1B71628C0C04A7371A988E213053A05E4900A60E76
              6FC681890C640E349A1C301C035FA700F300ECE6C585890494104CB3B19730F7
              287D866DC34C825D433130A14070CA3264ADCA3F9D61CD5569C1041D0EBAD699
              54600281E07400D49A12C24C84DDFCD6C0F802C1E950A86590F6A2F98009AE59
              D805CD665C5CB9C81E12F6F741CDB3FC9E828C83DDA2D6C23881E09465CC1E95
              3F665C30416366BB81392CEC595C36583E790E3016764B9280F1031A0EF5AE68
              2A383F0E39A675C18C57FA356B97268C1FD06295FFF5AC164E1B457FD098E18E
              B4CA8271550084A981DD8A24610A804C45CB9AC93B72E260BD088E7F35FD41DF
              6F5C30E3A0DE518599B91B76CB92867101F5338179D74E38EE6BFA5829F074A5
              8BE339BC87AFD911F12CD76CC6BDFF5DB07B2F0D181710F72CD345D34C389F61
              D9F450FAA4E67ED3C423A9AA0830FF4046C2EEFDB4605C40DC06978BA66B659D
              26ECB8467197EACA0CF7FF1C73F66B362A68A799381002B910EA17D1B617D20D
              419C72005D0CB55C1566C605C3CC0C87DDEAB4616C20CE460B44DF520451E3BA
              C94C1E1DD07F54B4B92680E34A9F68AE2D058C0DF411D460D13722EAE0C5BD63
              A0163A60989935A582390D64FE7B83C7471D4C3B67A3AEB206F301E1E791D14A
              7F8C92303C96BD13F7AF2B258C04AA527AF3E65DAC0EFA20A0DD160083E68162
              B591BE1688073304F7AE57195C1ED05B5013AD3EC2DCACF4DE87DB884190812A
              FF3B8F7D7102E0C1F9862C6024D0CF509738FA992916A965119E459869710E34
              5201325FD87E28F2FEDF21CC06C7CA26C01CCC12C6038AFA85D9BBF8F99C3322
              3F666D8DF23F6CA506E282774780CD9F4A7F56E4B9421300F6641D7418108F8A
              2659EDBB959EF5F82A7D0A88BFB30E340ED0D94A1FA477877013D714F65F836D
              F9FA17C69DE1868047F9830000000049454E44AE426082}
            Proportional = True
            ExplicitLeft = 48
            ExplicitTop = 24
            ExplicitWidth = 105
            ExplicitHeight = 105
          end
          object btnAlterarCad: TSpeedButton
            Left = 0
            Top = 0
            Width = 33
            Height = 29
            Cursor = crHandPoint
            Hint = 'Alterar'
            Align = alClient
            BiDiMode = bdLeftToRight
            Flat = True
            ParentShowHint = False
            ParentBiDiMode = False
            ShowHint = True
            ExplicitLeft = 8
            ExplicitTop = 16
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
      object lkpProduto: TDBLookupComboBox
        Left = 9
        Top = 85
        Width = 500
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object Panel1: TPanel
        Left = 512
        Top = 85
        Width = 66
        Height = 29
        BevelOuter = bvNone
        TabOrder = 4
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 33
          Height = 29
          Align = alLeft
          BevelOuter = bvNone
          Color = 16744448
          ParentBackground = False
          TabOrder = 0
          object Image1: TImage
            Left = 0
            Top = 0
            Width = 33
            Height = 29
            Cursor = crHandPoint
            Align = alClient
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
              003008060000005702F98700000006624B474400FF00FF00FFA0BDA793000000
              A44944415478DAEDD63B0E8020108461F75ABE0E2FE8B570496C2CD025511793
              7F1A1A12E64B2846BA9F47BC0B00F02E00C0BB40538094D2AA477F732D8AC8D4
              2A20991ED50000000000000000009CCBE77DB318AF4F6A88AF028CC3ECAB1407
              E015C0F41DBE4AE9DB010000000080D700418FD1BBF891A0FDE72A406D149CB1
              C1787DD042DB13EF32E600000000000000000D012C03B038CCDC011E01E01D00
              DEF93D60078B5D9631C96114F50000000049454E44AE426082}
            Proportional = True
            ExplicitLeft = 48
            ExplicitTop = 24
            ExplicitWidth = 105
            ExplicitHeight = 105
          end
          object SpeedButton1: TSpeedButton
            Left = 0
            Top = 0
            Width = 33
            Height = 29
            Cursor = crHandPoint
            Hint = 'Novo'
            Align = alClient
            Flat = True
            ParentShowHint = False
            ShowHint = True
            ExplicitLeft = 8
            ExplicitTop = 16
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Panel3: TPanel
          Left = 33
          Top = 0
          Width = 33
          Height = 29
          Align = alRight
          BevelOuter = bvNone
          Color = clMedGray
          ParentBackground = False
          TabOrder = 1
          object Image2: TImage
            Left = 0
            Top = 0
            Width = 33
            Height = 29
            Cursor = crHandPoint
            Align = alClient
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000340000
              00340806000000C5781BEB00000006624B474400FF00FF00FFA0BDA793000005
              A24944415478DAD59A696C554514C7E7919A20015151C044A38909C62814C444
              71C1682CA5058D0103244891C5A282960AB8A1B8E0062EE04241CB0776344A00
              A5C86684B8804BD144A21F2506E307D9C10504EAFF9F998BE7CD9BBBBDDEFB6E
              BDC9C9C99B39F79EF3EBB93373666E73AA8D5E2D2D2DBDA06E819C01D905D99C
              CBE54E84DD97CB3A7007487BA8B7213556D74F906180DAF5BF01020CB3B10A72
              9B8FC941C800407DD3E68100C3583E800C0931DD0FA900D4CE360D64A02643CD
              8960EA9BA9CC8100710102FB4DFC7E08EAD508B73A3395291082BF1A6A23A411
              813D2ADAEBA15E8BF088824C650684A0FB43AD8374324DB39280CA04C8AC313B
              20675A5DCF20B0A785DDC3048DF048BE7E37714ACF0AA81D542364ACA3DB867A
              04EAA5088FFD11D2ABA44008AECC5BED6342F1557C31828BCA920121A8CBA13E
              848C41B09F1701F518D40B216EA6940408C15C01F509A41BE428A4AA48A8C7A1
              9E0F70559B3A1082B8D2C07415CD5C772E45B07F1501F504D44C87DD49488F54
              81E0BCA781395F341F81547B1912B671A09E847AD6B2990B9BFAD480E0B41C6A
              0BE43C0B86AFDB17C2EE74A510136A06DBCCCFD54A57E227520182B3DE509B2D
              983F2083E0749BB06380754A2C8CA6486D80DCEB78B4BDF8724AE79EE976B41F
              635BE24070D2C7C07411CDCCCC4038FD52D83D05E5FDC5F3EAB298992A931BBF
              44817C605C99712D9679254C9C4CC92B312053686E829C239A0F2B9D99EDC2CE
              35A0BD6B0B6C2B846D50A6FAC3F6B35480E0F82AA53373AE055309A73B845D50
              6DF63DE456D8EFB39E6D67AA05321576CEC2B5D54070788DD25B80CE21307EEB
              07AF66A5C7D00161EF9AFD464146A37DA55F3CAD0282A37E501F5B3087947ECD
              24CC74A8E762C0D419F86AABA228C7EFEF82622A1A080EAE33306785C04C839A
              EDF31806C7D76CBF0533C7C4C6096530FAB7468DAB282038BD016ABDFA6F73E6
              C1F035FB4AD8051594DF2A3DABC9CC3C0835D78A8B53FE65729B9E28109C5EAF
              7466C260A642BDECF318AE371556662640CDB762E204500FBBD7A3C6170B2846
              66E2C2D4422D70C04C86DD1B71628C0C04A7371A988E213053A05E4900A60E76
              6FC681890C640E349A1C301C035FA700F300ECE6C585890494104CB3B19730F7
              287D866DC34C825D433130A14070CA3264ADCA3F9D61CD5569C1041D0EBAD699
              54600281E07400D49A12C24C84DDFCD6C0F802C1E950A86590F6A2F98009AE59
              D805CD665C5CB9C81E12F6F741CDB3FC9E828C83DDA2D6C23881E09465CC1E95
              3F665C30416366BB81392CEC595C36583E790E3016764B9280F1031A0EF5AE68
              2A383F0E39A675C18C57FA356B97268C1FD06295FFF5AC164E1B457FD098E18E
              B4CA8271550084A981DD8A24610A804C45CB9AC93B72E260BD088E7F35FD41DF
              6F5C30E3A0DE518599B91B76CB92867101F5338179D74E38EE6BFA5829F074A5
              8BE339BC87AFD911F12CD76CC6BDFF5DB07B2F0D181710F72CD345D34C389F61
              D9F450FAA4E67ED3C423A9AA0830FF4046C2EEFDB4605C40DC06978BA66B659D
              26ECB8467197EACA0CF7FF1C73F66B362A68A799381002B910EA17D1B617D20D
              419C72005D0CB55C1566C605C3CC0C87DDEAB4616C20CE460B44DF520451E3BA
              C94C1E1DD07F54B4B92680E34A9F68AE2D058C0DF411D460D13722EAE0C5BD63
              A0163A60989935A582390D64FE7B83C7471D4C3B67A3AEB206F301E1E791D14A
              7F8C92303C96BD13F7AF2B258C04AA527AF3E65DAC0EFA20A0DD160083E68162
              B591BE1688073304F7AE57195C1ED05B5013AD3EC2DCACF4DE87DB884190812A
              FF3B8F7D7102E0C1F9862C6024D0CF509738FA992916A965119E459869710E34
              5201325FD87E28F2FEDF21CC06C7CA26C01CCC12C6038AFA85D9BBF8F99C3322
              3F666D8DF23F6CA506E282774780CD9F4A7F56E4B9421300F6641D7418108F8A
              2659EDBB959EF5F82A7D0A88BFB30E340ED0D94A1FA477877013D714F65F836D
              F9FA17C69DE1868047F9830000000049454E44AE426082}
            Proportional = True
            ExplicitLeft = 48
            ExplicitTop = 24
            ExplicitWidth = 105
            ExplicitHeight = 105
          end
          object SpeedButton2: TSpeedButton
            Left = 0
            Top = 0
            Width = 33
            Height = 29
            Cursor = crHandPoint
            Hint = 'Alterar'
            Align = alClient
            BiDiMode = bdLeftToRight
            Flat = True
            ParentShowHint = False
            ParentBiDiMode = False
            ShowHint = True
            ExplicitLeft = 8
            ExplicitTop = 16
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
      object edQtd: TVazEdit
        Left = 594
        Top = 85
        Width = 56
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
        ChangeColor = 14745599
      end
      object UpDown1: TUpDown
        Left = 651
        Top = 85
        Width = 17
        Height = 29
        TabOrder = 6
      end
      object pnlAdicionar: TPanel
        Left = 684
        Top = 85
        Width = 120
        Height = 29
        Anchors = [akLeft, akBottom]
        BevelOuter = bvNone
        Color = clBlue
        ParentBackground = False
        TabOrder = 7
        object btnAdicionar: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 29
          Cursor = crHandPoint
          Align = alClient
          Caption = '&Adicionar'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 25
        end
      end
    end
    object pnlGrid: TPanel
      Left = 0
      Top = 145
      Width = 862
      Height = 215
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 360
      ExplicitTop = 280
      ExplicitWidth = 185
      ExplicitHeight = 41
      object GridVenda: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 856
        Height = 209
        Align = alClient
        Color = clWhite
        FixedColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Title.Caption = 'Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMenuText
            Title.Font.Height = -13
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Produto'
            Width = 297
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taRightJustify
            Title.Caption = 'Vlr. Unit.'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taRightJustify
            Title.Caption = 'Qtde.'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taRightJustify
            Title.Caption = 'Desc.'
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -13
            Title.Font.Name = 'Segoe UI'
            Title.Font.Style = []
            Width = 100
            Visible = True
          end>
      end
    end
  end
end
