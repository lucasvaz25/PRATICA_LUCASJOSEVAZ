object FRM_Principal: TFRM_Principal
  Left = 0
  Top = 0
  Caption = 'FRM_Principal'
  ClientHeight = 427
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 408
    Width = 645
    Height = 19
    Color = clSkyBlue
    Panels = <>
  end
  object Button1: TButton
    Left = 32
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 104
    Width = 75
    Height = 25
    Caption = 'estado'
    TabOrder = 2
    OnClick = Button2Click
  end
end
