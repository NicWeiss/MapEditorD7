object Form10: TForm10
  Left = 332
  Top = 342
  Width = 260
  Height = 541
  Caption = 'Form10'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 64
    Width = 65
    Height = 17
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 0
    Top = 16
    Width = 75
    Height = 25
    Caption = 'open'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 48
    Width = 249
    Height = 16
    TabOrder = 1
  end
  object Button2: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 25
    Caption = 'read'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 168
    Top = 16
    Width = 75
    Height = 25
    Caption = 'save'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ListBox1: TListBox
    Left = 0
    Top = 64
    Width = 81
    Height = 449
    ItemHeight = 13
    TabOrder = 4
    OnClick = ListBox1Click
  end
  object Edit1: TEdit
    Left = 88
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
  end
  object Button4: TButton
    Left = 88
    Top = 112
    Width = 75
    Height = 25
    Caption = 'edit lines'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 168
    Top = 112
    Width = 75
    Height = 25
    Caption = 'add new lines'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 168
    Top = 168
    Width = 75
    Height = 25
    Caption = 'add as byte'
    TabOrder = 8
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 88
    Top = 168
    Width = 75
    Height = 25
    Caption = 'edit as byte'
    TabOrder = 9
    OnClick = Button7Click
  end
  object CheckBox1: TCheckBox
    Left = 88
    Top = 144
    Width = 49
    Height = 17
    Caption = 'byte'
    TabOrder = 10
  end
  object CheckBox2: TCheckBox
    Left = 144
    Top = 144
    Width = 97
    Height = 17
    Caption = 'read as text'
    TabOrder = 11
  end
  object OpenDialog1: TOpenDialog
    Left = 136
    Top = 448
  end
  object XPManifest1: TXPManifest
    Left = 168
    Top = 448
  end
  object SaveDialog1: TSaveDialog
    Left = 104
    Top = 448
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 88
    Top = 216
  end
end
