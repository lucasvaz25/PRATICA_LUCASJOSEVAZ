inherited Frm_Consulta_Cliente: TFrm_Consulta_Cliente
  Caption = 'Frm_Consulta_Cliente'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsClientes
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente'
            Width = 360
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Width = 120
            Visible = True
          end>
      end
    end
  end
  object TDset_Clientes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 273
    object TDset_Clientescodigo: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigo'
    end
    object TDset_Clientescliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'cliente'
      Size = 50
    end
    object TDset_Clientescpf: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'cpf'
    end
    object TDset_Clientestelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
    end
  end
  object DsClientes: TDataSource
    DataSet = TDset_Clientes
    Left = 544
    Top = 249
  end
end
