inherited Frm_Cad_Paises: TFrm_Cad_Paises
  Caption = 'Frm_Cad_Paises'
  ClientHeight = 261
  ClientWidth = 532
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 538
  ExplicitHeight = 290
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 532
    Height = 261
    ExplicitWidth = 532
    ExplicitHeight = 261
    inherited lblUsuarioDataCad: TLabel
      Top = 165
      ExplicitTop = 165
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Top = 193
      ExplicitTop = 193
    end
    object lblDDI: TLabel [3]
      Left = 455
      Top = 82
      Width = 26
      Height = 21
      Caption = 'DDI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSigla: TLabel [4]
      Left = 399
      Top = 82
      Width = 41
      Height = 21
      Caption = 'Sigla*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblPais: TLabel [5]
      Left = 24
      Top = 82
      Width = 34
      Height = 21
      Caption = 'Pa'#237's*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited edCodigo: TVazEdit
      TabOrder = 3
    end
    inherited pnlSalvar: TPanel
      Left = 250
      Top = 165
      TabOrder = 4
      ExplicitLeft = 250
      ExplicitTop = 165
    end
    inherited pnlSair: TPanel
      Left = 385
      Top = 165
      TabOrder = 5
      ExplicitLeft = 385
      ExplicitTop = 165
    end
    object edDDI: TVazEdit
      Left = 455
      Top = 104
      Width = 50
      Height = 29
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 2
      ChangeColor = 14745599
    end
    object edSigla: TVazEdit
      Left = 399
      Top = 104
      Width = 50
      Height = 29
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 1
      ChangeColor = 14745599
    end
    object edPais: TVazEdit
      Left = 24
      Top = 104
      Width = 369
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 0
      TextHint = 'digite o nome do Pa'#237's'
      ChangeColor = 14745599
    end
  end
end
