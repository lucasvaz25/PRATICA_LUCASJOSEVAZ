inherited Frm_Cad_Grupo: TFrm_Cad_Grupo
  Caption = 'Frm_Cad_Grupo'
  ClientHeight = 407
  ClientWidth = 518
  OnCreate = FormCreate
  ExplicitWidth = 524
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 518
    Height = 407
    ExplicitWidth = 426
    ExplicitHeight = 407
    inherited lblUsuarioDataCad: TLabel
      Top = 380
      ExplicitTop = 380
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Left = 322
      Top = 380
      ExplicitLeft = 230
      ExplicitTop = 380
    end
    object lblGrupo: TLabel [3]
      Left = 24
      Top = 82
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
    object lblObs: TLabel [4]
      Left = 22
      Top = 139
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
    inherited pnlSalvar: TPanel
      Left = 195
      Top = 311
      ExplicitLeft = 150
      ExplicitTop = 311
    end
    inherited pnlSair: TPanel
      Left = 353
      Top = 311
      ExplicitLeft = 280
      ExplicitTop = 311
    end
    object edGrupo: TVazEdit
      Left = 22
      Top = 104
      Width = 452
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
      TextHint = 'digite o grupo'
      ChangeColor = 14745599
    end
    object edObs: TMemo
      Left = 22
      Top = 161
      Width = 452
      Height = 105
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 100
      ParentFont = False
      TabOrder = 4
    end
  end
end
