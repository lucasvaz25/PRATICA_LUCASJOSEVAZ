inherited Frm_Consulta_Estados: TFrm_Consulta_Estados
  Caption = 'Frm_Consulta_Estados'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsEstados
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
            FieldName = 'estado'
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Title.Alignment = taCenter
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pais'
            Width = 280
            Visible = True
          end>
      end
    end
  end
  object DsEstados: TDataSource
    DataSet = TDset_Estados
    Left = 16
    Top = 193
  end
  object TDset_Estados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 193
    object TDset_Estadoscodigo: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigo'
    end
    object TDset_Estadosestado: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Size = 50
    end
    object TDset_Estadospais: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'pais'
      Size = 50
    end
    object TDset_EstadosUF: TStringField
      Alignment = taCenter
      FieldName = 'UF'
    end
  end
end
