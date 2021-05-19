inherited Frm_Consulta_Unidades: TFrm_Consulta_Unidades
  Caption = 'Frm_Consulta_Unidades'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsUnidades
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Title.Alignment = taRightJustify
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Unidade'
            Title.Alignment = taCenter
            Width = 341
            Visible = True
          end>
      end
    end
  end
  object DsUnidades: TDataSource
    DataSet = TDset_Unidades
    Left = 648
    Top = 305
  end
  object TDset_Unidades: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 305
    object TDset_UnidadesCodigo: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'Codigo'
    end
    object TDset_UnidadesUnidade: TStringField
      Alignment = taCenter
      FieldName = 'Unidade'
      Size = 40
    end
  end
end
