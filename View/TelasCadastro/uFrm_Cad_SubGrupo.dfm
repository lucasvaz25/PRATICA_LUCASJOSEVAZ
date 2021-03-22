inherited Frm_Cad_SubGrupo: TFrm_Cad_SubGrupo
  Caption = 'Frm_Cad_SubGrupo'
  ClientHeight = 449
  ClientWidth = 428
  ExplicitWidth = 444
  ExplicitHeight = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 428
    Height = 449
    inherited lblUsuarioDataCad: TLabel
      Top = 422
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Left = 232
      Top = 422
    end
    object lblSubGrupo: TLabel [3]
      Left = 24
      Top = 82
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
    object lblObs: TLabel [4]
      Left = 22
      Top = 198
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
    object lblGrupo: TLabel [5]
      Left = 24
      Top = 139
      Width = 51
      Height = 21
      Caption = 'Grupo*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlSalvar: TPanel
      Left = 150
      Top = 353
      ExplicitLeft = 150
      ExplicitTop = 353
    end
    inherited pnlSair: TPanel
      Left = 281
      Top = 353
      ExplicitLeft = 281
      ExplicitTop = 353
    end
    object edSubGrupo: TVazEdit
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
      MaxLength = 50
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
      TextHint = 'digite o subgrupo'
      ChangeColor = 14745599
    end
    object edObs: TMemo
      Left = 22
      Top = 220
      Width = 380
      Height = 105
      MaxLength = 100
      TabOrder = 4
    end
    object lkpGrupo: TDBLookupComboBox
      Left = 24
      Top = 161
      Width = 307
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object pnlbotoes: TPanel
      Left = 336
      Top = 161
      Width = 66
      Height = 29
      BevelOuter = bvNone
      TabOrder = 6
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
  end
end
