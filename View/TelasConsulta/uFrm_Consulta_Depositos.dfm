inherited Frm_Consulta_Depositos: TFrm_Consulta_Depositos
  Caption = 'Frm_Consulta_Depositos'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsDepositos
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'deposito'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Visible = True
          end>
      end
    end
  end
  object TDset_Depositos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 297
    object TDset_Depositoscodigo: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigo'
    end
    object TDset_Depositosdeposito: TStringField
      DisplayLabel = 'Dep'#243'sito'
      FieldName = 'deposito'
      Size = 40
    end
    object TDset_Depositoscidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 40
    end
  end
  object DsDepositos: TDataSource
    DataSet = TDset_Depositos
    Left = 608
    Top = 225
  end
end
