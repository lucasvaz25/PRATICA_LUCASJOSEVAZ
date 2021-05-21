inherited Frm_Consulta_Funcionario: TFrm_Consulta_Funcionario
  Caption = 'Frm_Consulta_Funcionario'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlGrid: TPanel
      inherited DBGrid1: TDBGrid
        DataSource = DsFuncionarios
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Alignment = taRightJustify
            Title.Caption = 'C'#243'd.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'funcionario'
            Title.Caption = 'Funcion'#225'rio'
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpf'
            Title.Caption = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cargo'
            Title.Caption = 'Cargo'
            Width = 260
            Visible = True
          end>
      end
    end
  end
  object DsFuncionarios: TDataSource
    DataSet = TDset_Funcionarios
    Left = 448
    Top = 177
  end
  object TDset_Funcionarios: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 217
    object TDset_Funcionarioscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TDset_Funcionariosfuncionario: TStringField
      FieldName = 'funcionario'
      Size = 40
    end
    object TDset_Funcionarioscpf: TStringField
      FieldName = 'cpf'
      Size = 15
    end
    object TDset_Funcionarioscargo: TStringField
      FieldName = 'cargo'
      Size = 40
    end
  end
end
