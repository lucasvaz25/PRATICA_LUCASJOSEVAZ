inherited Frm_Consulta_Departamentos: TFrm_Consulta_Departamentos
  Caption = 'Frm_Consulta_Departamentos'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitTop = -21
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlRodape: TPanel
      inherited pnlNovo: TPanel
        ExplicitLeft = 93
      end
      inherited pnlAlterar: TPanel
        ExplicitLeft = 226
      end
      inherited pnlExcluir: TPanel
        ExplicitLeft = 361
      end
      inherited pnlSair: TPanel
        ExplicitLeft = 493
      end
    end
    inherited pnlCabecalho: TPanel
      ExplicitWidth = 703
    end
    inherited pnlGrid: TPanel
      ExplicitWidth = 703
      ExplicitHeight = 313
      inherited DBGrid1: TDBGrid
        DataSource = DsDept
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
