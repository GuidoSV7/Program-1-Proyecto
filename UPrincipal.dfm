object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 453
  ClientWidth = 561
  Color = clBackground
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClick = FormClick
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 480
    Top = 40
    Width = 3
    Height = 13
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 59
    Top = 400
    Width = 9
    Height = 35
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 61
    Top = 136
    Width = 7
    Height = 25
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    WordWrap = True
  end
  object Disparo_Laser: TMediaPlayer
    Left = 8
    Top = 8
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\ASUS\Desktop\Nuevo Proyecto\Proyecto Program 1\Win32\De' +
      'bug\Musica\Disparo_laser_13.mp3'
    Visible = False
    TabOrder = 0
  end
  object Inicio: TMediaPlayer
    Left = 280
    Top = 8
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\ASUS\Desktop\Nuevo Proyecto\Proyecto Program 1\Win32\De' +
      'bug\Musica\Musica_Inicio.mp3'
    Visible = False
    TabOrder = 1
  end
  object Derrota: TMediaPlayer
    Left = 280
    Top = 59
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\ASUS\Desktop\Nuevo Proyecto\Proyecto Program 1\Win32\De' +
      'bug\Musica\Musica_Derrota.mp3'
    Visible = False
    TabOrder = 2
  end
  object Victoria: TMediaPlayer
    Left = 280
    Top = 112
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\ASUS\Desktop\Nuevo Proyecto\Proyecto Program 1\Win32\De' +
      'bug\Musica\Musica_Victoria.mp3'
    Visible = False
    TabOrder = 3
  end
  object Jefe_Final: TMediaPlayer
    Left = 8
    Top = 59
    Width = 253
    Height = 30
    AutoOpen = True
    FileName = 
      'C:\Users\ASUS\Desktop\Nuevo Proyecto\Proyecto Program 1\Win32\De' +
      'bug\Musica\Musica_Jefe_Final.mp3'
    Visible = False
    TabOrder = 4
  end
  object Timer1: TTimer
    Interval = 500
    Left = 496
    Top = 216
  end
  object Timer2: TTimer
    Interval = 25
    OnTimer = Timer2Timer
    Left = 496
    Top = 264
  end
  object Timer3: TTimer
    Interval = 500
    OnTimer = Timer3Timer
    Left = 496
    Top = 312
  end
  object Timer4: TTimer
    Interval = 1
    OnTimer = Timer4Timer
    Left = 496
    Top = 352
  end
  object Timer5: TTimer
    OnTimer = Timer5Timer
    Left = 8
    Top = 208
  end
  object Timer6: TTimer
    Enabled = False
    OnTimer = Timer6Timer
    Left = 8
    Top = 256
  end
end
