inherited Frm_Consulta_Estados: TFrm_Consulta_Estados
  Caption = 'Frm_Consulta_Estados'
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
            Title.Alignment = taCenter
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
            Title.Alignment = taCenter
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
      Alignment = taCenter
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      Size = 50
    end
    object TDset_Estadospais: TStringField
      Alignment = taCenter
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
