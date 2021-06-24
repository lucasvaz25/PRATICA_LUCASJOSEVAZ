inherited Frm_Cad_FormasPagamentos: TFrm_Cad_FormasPagamentos
  Caption = 'Frm_Cad_FormasPagamentos'
  ClientHeight = 355
  ClientWidth = 627
  OnCreate = FormCreate
  ExplicitWidth = 633
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 627
    Height = 355
    inherited lblUsuarioDataCad: TLabel
      Left = 3
      Top = 259
      ExplicitLeft = 3
      ExplicitTop = 259
    end
    inherited lblUsuarioDataAlteracao: TLabel
      Left = 3
      Top = 278
      ExplicitLeft = 3
      ExplicitTop = 278
    end
    object lblFormaPgto: TLabel [3]
      Left = 24
      Top = 82
      Width = 134
      Height = 21
      Caption = 'Forma Pagamento*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblObs: TLabel [4]
      Left = 24
      Top = 144
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
      Left = 354
      Top = 259
    end
    inherited pnlSair: TPanel
      Left = 478
      Top = 259
    end
    object edFormaPagamento: TVazEdit
      Left = 24
      Top = 104
      Width = 529
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 3
      TextHint = 'digite a descri'#231#227'o da  forma de pagamento'
      ChangeColor = 14745599
    end
    object edObs: TMemo
      Left = 24
      Top = 166
      Width = 531
      Height = 71
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
