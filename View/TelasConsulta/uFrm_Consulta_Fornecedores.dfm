inherited Frm_Consulta_Fornecedores: TFrm_Consulta_Fornecedores
  Caption = 'Frm_Consulta_Fornecedor'
  ClientHeight = 502
  ClientWidth = 742
  OnDestroy = FormDestroy
  ExplicitWidth = 748
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 742
    Height = 502
    ExplicitWidth = 742
    ExplicitHeight = 502
    inherited pnlRodape: TPanel
      Top = 430
      Width = 742
      ExplicitTop = 430
      ExplicitWidth = 742
      inherited pnlNovo: TPanel
        Left = 101
        ExplicitLeft = 101
      end
      inherited pnlAlterar: TPanel
        Left = 242
        ExplicitLeft = 242
      end
      inherited pnlExcluir: TPanel
        Left = 384
        ExplicitLeft = 384
      end
      inherited pnlSair: TPanel
        Left = 524
        ExplicitLeft = 524
      end
    end
    inherited pnlCabecalho: TPanel
      Width = 742
      ExplicitWidth = 742
    end
    inherited pnlGrid: TPanel
      Width = 742
      Height = 333
      ExplicitWidth = 742
      ExplicitHeight = 333
      inherited DBGrid1: TDBGrid
        Width = 736
        Height = 327
        DataSource = DsFornecedor
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Caption = 'C'#243'd.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fornecedor'
            Title.Caption = 'Fornecedor'
            Width = 263
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cnpj'
            Title.Caption = 'CNPJ/CPF'
            Width = 144
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Title.Caption = 'Telefone'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Title.Caption = 'Cidade'
            Width = 176
            Visible = True
          end>
      end
    end
  end
  object TDsetFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 289
    object TDsetFornecedorcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TDsetFornecedorfornecedor: TStringField
      FieldName = 'fornecedor'
      Size = 40
    end
    object TDsetFornecedorcnpj: TStringField
      FieldName = 'cnpj'
      Size = 18
    end
    object TDsetFornecedorcidade: TStringField
      FieldName = 'cidade'
      Size = 40
    end
    object TDsetFornecedortelefone: TStringField
      FieldName = 'telefone'
    end
  end
  object DsFornecedor: TDataSource
    DataSet = TDsetFornecedor
    Left = 504
    Top = 233
  end
end
