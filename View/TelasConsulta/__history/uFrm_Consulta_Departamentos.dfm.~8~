inherited Frm_Consulta_Departamentos: TFrm_Consulta_Departamentos
  Caption = 'Frm_Consulta_Departamentos'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsDept
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Alignment = taRightJustify
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'departamento'
            Title.Alignment = taCenter
            Width = 401
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'datacad'
            Visible = True
          end>
      end
    end
  end
  object DsDept: TDataSource
    DataSet = TDset_Dept
    Left = 480
    Top = 297
  end
  object TDset_Dept: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 249
    object TDset_Deptcodigo: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigo'
    end
    object TDset_Deptdepartamento: TStringField
      Alignment = taCenter
      DisplayLabel = 'Departamento'
      FieldName = 'departamento'
      Size = 40
    end
    object TDset_Deptdatacad: TDateTimeField
      DisplayLabel = 'Data Cad.'
      FieldName = 'datacad'
    end
  end
end
