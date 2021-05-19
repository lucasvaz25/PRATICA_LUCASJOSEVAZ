inherited Frm_Consulta_Cidades: TFrm_Consulta_Cidades
  Caption = 'Frm_Consulta_Cidades'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsCidades
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Alignment = taRightJustify
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uf'
            Title.Alignment = taCenter
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pais'
            Width = 254
            Visible = True
          end>
      end
    end
  end
  object DsCidades: TDataSource
    DataSet = TDset_Cidades
    Left = 168
    Top = 209
  end
  object TDset_Cidades: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 193
    object TDset_Cidadescodigo: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigo'
    end
    object TDset_Cidadescidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object TDset_Cidadesuf: TStringField
      Alignment = taCenter
      DisplayLabel = 'UF'
      FieldName = 'uf'
    end
    object TDset_Cidadespais: TStringField
      DisplayLabel = 'Pa'#237's'
      DisplayWidth = 50
      FieldName = 'pais'
    end
  end
end
