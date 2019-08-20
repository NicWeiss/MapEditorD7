object Form8: TForm8
  Left = 217
  Top = 142
  Width = 127
  Height = 76
  BorderIcons = [biSystemMenu]
  Caption = 'Form8'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image2: TImage
    Left = 0
    Top = 192
    Width = 633
    Height = 89
    Align = alCustom
    Visible = False
  end
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 119
    Height = 49
    Align = alClient
    OnMouseDown = Image1MouseDown
    OnMouseUp = Image1MouseUp
  end
  object ColorBox1: TColorBox
    Left = 208
    Top = 58
    Width = 145
    Height = 26
    DefaultColorColor = clWhite
    NoneColorColor = clWhite
    Selected = clWindow
    Enabled = False
    ItemHeight = 16
    TabOrder = 0
    Visible = False
  end
  object ColorBox2: TColorBox
    Left = 8
    Top = 74
    Width = 145
    Height = 26
    DefaultColorColor = clBlue
    NoneColorColor = clBlue
    Selected = clHighlight
    Enabled = False
    ItemHeight = 16
    TabOrder = 1
    Visible = False
  end
  object ColorBox3: TColorBox
    Left = 8
    Top = 98
    Width = 145
    Height = 26
    DefaultColorColor = clGray
    NoneColorColor = clGray
    Selected = clGray
    Color = clRed
    Enabled = False
    ItemHeight = 16
    TabOrder = 2
    Visible = False
  end
  object ColorBox4: TColorBox
    Left = 8
    Top = 122
    Width = 145
    Height = 26
    DefaultColorColor = clBlue
    NoneColorColor = clBlue
    Selected = clYellow
    Enabled = False
    ItemHeight = 16
    TabOrder = 3
    Visible = False
  end
  object ColorBox5: TColorBox
    Left = 8
    Top = 146
    Width = 145
    Height = 26
    DefaultColorColor = clBlue
    NoneColorColor = clBlue
    Selected = clRed
    Enabled = False
    ItemHeight = 16
    TabOrder = 4
    Visible = False
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 144
    Top = 96
  end
  object Timer2: TTimer
    Interval = 1
    OnTimer = Timer2Timer
    Left = 296
    Top = 16
  end
end
