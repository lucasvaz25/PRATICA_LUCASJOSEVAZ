inherited Frm_Cad_Departamento: TFrm_Cad_Departamento
  Caption = 'Frm_Cad_Departamento'
  ClientHeight = 263
  ClientWidth = 506
  OnCreate = FormCreate
  ExplicitWidth = 512
  ExplicitHeight = 292
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 506
    Height = 263
    ExplicitWidth = 506
    ExplicitHeight = 263
    inherited lblUsuarioDataCad: TLabel
      Top = 167
      ExplicitTop = 167
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Top = 195
      ExplicitTop = 195
    end
    object lblDepartamento: TLabel [3]
      Left = 24
      Top = 82
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
    inherited pnlSalvar: TPanel
      Left = 245
      Top = 167
      ExplicitLeft = 245
      ExplicitTop = 167
    end
    inherited pnlSair: TPanel
      Left = 374
      Top = 167
      ExplicitLeft = 374
      ExplicitTop = 167
    end
    object edDepartamento: TVazEdit
      Left = 24
      Top = 104
      Width = 460
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
      TextHint = 'digite o departeamento'
      ChangeColor = 14745599
    end
  end
end
