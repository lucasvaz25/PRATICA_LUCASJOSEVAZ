inherited Frm_Cad_Cidades: TFrm_Cad_Cidades
  Caption = 'Frm_Cad_Cidades'
  ClientHeight = 332
  ClientWidth = 513
  OnCreate = FormCreate
  ExplicitWidth = 519
  ExplicitHeight = 361
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 513
    Height = 332
    ExplicitWidth = 513
    ExplicitHeight = 332
    inherited lblUsuarioDataCad: TLabel
      Top = 236
      ExplicitTop = 236
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Top = 264
      ExplicitTop = 264
    end
    object lblCidade: TLabel [3]
      Left = 24
      Top = 82
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
    object lblDDD: TLabel [4]
      Left = 424
      Top = 82
      Width = 33
      Height = 21
      Caption = 'DDD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblEstado: TLabel [5]
      Left = 83
      Top = 138
      Width = 53
      Height = 21
      Caption = 'Estado*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCodDept: TLabel [6]
      Left = 24
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
      Left = 235
      Top = 236
      TabOrder = 4
      ExplicitLeft = 235
      ExplicitTop = 236
    end
    inherited pnlSair: TPanel
      Left = 375
      Top = 236
      TabOrder = 5
      ExplicitLeft = 375
      ExplicitTop = 236
    end
    object edCidade: TVazEdit
      Left = 24
      Top = 104
      Width = 393
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 1
      TextHint = 'digite o nome da Cidade'
      ChangeColor = 14745599
    end
    object edDDD: TVazEdit
      Left = 424
      Top = 104
      Width = 68
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      OnEnter = edDDDEnter
      OnExit = edDDDEnter
      ChangeColor = 14745599
    end
    object edEstado: TVazEdit
      Left = 83
      Top = 160
      Width = 367
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      TextHint = 'digite o nome do Estado'
      ChangeColor = 14745599
    end
    object pnlPesquisar: TPanel
      Left = 459
      Top = 160
      Width = 33
      Height = 29
      BevelOuter = bvNone
      Color = 16744448
      ParentBackground = False
      TabOrder = 7
      object imgPesquisar: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 29
        Hint = 'Pesquisar Estados'
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
        ExplicitLeft = 16
      end
      object btnPesquisarEstados: TSpeedButton
        Left = 0
        Top = 0
        Width = 33
        Height = 29
        Align = alClient
        Flat = True
        OnClick = btnPesquisarEstadosClick
        ExplicitLeft = 16
        ExplicitTop = 8
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object edCodEstado: TVazEdit
      Left = 24
      Top = 160
      Width = 50
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
      TabOrder = 3
      OnExit = edCodEstadoExit
      OnKeyPress = edCodEstadoKeyPress
      ChangeColor = 14745599
    end
  end
  object BalloonHint1: TBalloonHint
    Delay = 600
    Left = 464
    Top = 192
  end
end
