inherited Frm_Consulta_CondicaoPagamento: TFrm_Consulta_CondicaoPagamento
  Caption = 'Frm_Consulta_CondicaoPagamento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsCondPag
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'condpag'
            Width = 351
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'parcelas'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datacad'
            Title.Caption = 'Data Cad.'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'usercad'
            Title.Caption = 'Usu'#225'rio Cad.'
            Visible = False
          end>
      end
    end
  end
  object DsCondPag: TDataSource
    DataSet = TDset_CondPag
    Left = 656
    Top = 201
  end
  object TDset_CondPag: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 233
    object TDset_CondPagCodigo: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'Codigo'
    end
    object TDset_CondPagcondpag: TStringField
      DisplayLabel = 'Condi'#231#227'o de Pagamento'
      FieldName = 'condpag'
      Size = 50
    end
    object TDset_CondPagparcelas: TIntegerField
      DisplayLabel = 'Parcelas'
      FieldName = 'parcelas'
    end
    object TDset_CondPagdatacad: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'datacad'
    end
    object TDset_CondPagusercad: TStringField
      DisplayLabel = 'Usu'#225'rio Cadastro'
      FieldName = 'usercad'
      Size = 40
    end
  end
end
