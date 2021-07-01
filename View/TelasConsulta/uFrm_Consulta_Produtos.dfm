inherited Frm_Consulta_Produtos: TFrm_Consulta_Produtos
  Caption = 'Frm_Consulta_Produtos'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsProdutos
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'produto'
            Width = 411
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'precoVenda'
            Visible = True
          end>
      end
    end
  end
  object TDset_Produtos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 201
    object TDset_Produtoscodigo: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigo'
    end
    object TDset_Produtosproduto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
      Size = 50
    end
    object TDset_ProdutosprecoVenda: TCurrencyField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'precoVenda'
    end
  end
  object DsProdutos: TDataSource
    DataSet = TDset_Produtos
    Left = 432
    Top = 257
  end
end
