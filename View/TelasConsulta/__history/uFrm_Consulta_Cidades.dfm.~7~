inherited Frm_Consulta_Cidades: TFrm_Consulta_Cidades
  Caption = 'Frm_Consulta_Cidades'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
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
        DataSource = DsCidades
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
            Title.Alignment = taCenter
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
            Title.Alignment = taCenter
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
      Alignment = taCenter
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
      Alignment = taCenter
      DisplayLabel = 'Pa'#237's'
      DisplayWidth = 50
      FieldName = 'pais'
    end
  end
end
