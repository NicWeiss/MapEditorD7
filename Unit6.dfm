object Form6: TForm6
  Left = 675
  Top = 218
  BorderStyle = bsSingle
  Caption = 'Graf Pack Creator'
  ClientHeight = 394
  ClientWidth = 604
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
  object Image1: TImage
    Left = 216
    Top = 8
    Width = 384
    Height = 384
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 49
    Caption = #1047#1072#1076#1085#1080#1081' '#1092#1086#1085
    TabOrder = 0
    object ColorBox1: TColorBox
      Left = 8
      Top = 16
      Width = 145
      Height = 26
      DefaultColorColor = clFuchsia
      NoneColorColor = clFuchsia
      Selected = clFuchsia
      ItemHeight = 16
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 64
    Width = 185
    Height = 81
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
    TabOrder = 1
    object Button2: TButton
      Left = 8
      Top = 16
      Width = 105
      Height = 25
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1075#1088#1072#1092'-'#1087#1072#1082
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 8
      Top = 48
      Width = 105
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 8
    Top = 192
  end
  object SaveDialog1: TSaveDialog
    Filter = 'BMP|*.bmp'
    Left = 8
    Top = 232
  end
end
