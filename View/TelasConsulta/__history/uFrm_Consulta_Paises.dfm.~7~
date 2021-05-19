inherited Frm_ConsultaPaises: TFrm_ConsultaPaises
  Caption = 'Frm_ConsultaPaises'
  ClientWidth = 630
  OnDestroy = FormDestroy
  ExplicitWidth = 636
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 630
    ExplicitWidth = 630
    inherited pnlRodape: TPanel
      Width = 630
      ExplicitWidth = 630
      inherited pnlNovo: TPanel
        Left = 40
        ExplicitLeft = 40
        inherited btnNovo: TSpeedButton
          ExplicitLeft = 8
        end
      end
      inherited pnlAlterar: TPanel
        Left = 175
        ExplicitLeft = 175
      end
      inherited pnlExcluir: TPanel
        Left = 310
        ExplicitLeft = 310
      end
      inherited pnlSair: TPanel
        Left = 445
        ExplicitLeft = 445
      end
    end
    inherited pnlCabecalho: TPanel
      Width = 630
      ExplicitWidth = 630
    end
    inherited pnlGrid: TPanel
      Width = 630
      ExplicitWidth = 630
      inherited DBGrid1: TDBGrid
        Width = 624
        DataSource = dsPaises
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'codigo'
            Title.Alignment = taRightJustify
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Alignment = taCenter
            Width = 395
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sigla'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
    end
  end
  object TDset_Paises: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 305
    object TDset_Paisescodigo: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'd.'
      FieldName = 'codigo'
    end
    object TDset_Paisesnome: TStringField
      Alignment = taCenter
      DisplayLabel = 'Pa'#237's'
      FieldName = 'nome'
      Size = 40
    end
    object TDset_Paisessigla: TStringField
      Alignment = taCenter
      DisplayLabel = 'Sigla'
      FieldName = 'sigla'
    end
  end
  object dsPaises: TDataSource
    DataSet = TDset_Paises
    Left = 40
    Top = 305
  end
end
