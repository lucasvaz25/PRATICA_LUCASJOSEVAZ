inherited Frm_Consulta_SubGrupos: TFrm_Consulta_SubGrupos
  Caption = 'Frm_Consulta_SubGrupos'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsSubGrupos
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Alignment = taRightJustify
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'subgrupo'
            Title.Alignment = taCenter
            Width = 310
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'grupo'
            Title.Alignment = taCenter
            Width = 310
            Visible = True
          end>
      end
    end
  end
  object DsSubGrupos: TDataSource
    DataSet = TDset_SubGrupos
    Left = 168
    Top = 201
  end
  object TDset_SubGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 201
    object TDset_SubGruposcodigo: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigo'
    end
    object TDset_SubGrupossubgrupo: TStringField
      Alignment = taCenter
      DisplayLabel = 'SubGrupo'
      FieldName = 'subgrupo'
      Size = 50
    end
    object TDset_SubGruposgrupo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Grupo'
      FieldName = 'grupo'
      Size = 50
    end
  end
end
