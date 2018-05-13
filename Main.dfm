object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'WFHelper'
  ClientHeight = 154
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 116
    Width = 145
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #49884#51089' : HOME '#51333#47308' : END'
  end
  object btnConnect: TButton
    Left = 8
    Top = 8
    Width = 74
    Height = 21
    Caption = 'Connect'
    TabOrder = 0
    OnClick = btnConnectClick
  end
  object cmbPort: TComboBox
    Left = 88
    Top = 8
    Width = 65
    Height = 21
    Style = csDropDownList
    BiDiMode = bdRightToLeftNoAlign
    ItemIndex = 0
    ParentBiDiMode = False
    TabOrder = 1
    Text = 'COM1'
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'COM7'
      'COM8'
      'COM9'
      'COM10'
      'COM11')
  end
  object panelStatus: TPanel
    Left = 0
    Top = 137
    Width = 314
    Height = 17
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    Alignment = taLeftJustify
    BevelEdges = [beTop]
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = ' Waiting for connection...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clOlive
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentFont = False
    TabOrder = 2
    StyleElements = []
  end
  object GroupBox1: TGroupBox
    Left = 159
    Top = 8
    Width = 145
    Height = 73
    Caption = #54924#51204#48288#44592
    Padding.Left = 5
    Padding.Top = 15
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 3
    object txtSaDelay: TEdit
      Left = 87
      Top = 18
      Width = 50
      Height = 21
      Alignment = taCenter
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 0
      Text = '515'
    end
    object forLabel1: TEdit
      Left = 8
      Top = 18
      Width = 73
      Height = 21
      Alignment = taCenter
      AutoSelect = False
      AutoSize = False
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      Text = #46364#47112#51060'(ms)'
    end
    object forLabel3: TEdit
      Left = 8
      Top = 45
      Width = 73
      Height = 21
      Alignment = taCenter
      AutoSelect = False
      AutoSize = False
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      Text = #44540#51217#44277#44201#53412
    end
    object cmbMeleeKey: TComboBox
      Left = 87
      Top = 45
      Width = 50
      Height = 21
      AutoCompleteDelay = 1
      AutoDropDown = True
      AutoCloseUp = True
      Style = csDropDownList
      BiDiMode = bdRightToLeftNoAlign
      ItemIndex = 4
      ParentBiDiMode = False
      TabOrder = 3
      Text = 'E'
      Items.Strings = (
        'A'
        'B'
        'C'
        'D'
        'E'
        'F'
        'G'
        'H'
        'I'
        'J'
        'K'
        'L'
        'M'
        'N'
        'O'
        'P'
        'Q'
        'R'
        'S'
        'T'
        'U'
        'V'
        'W'
        'X'
        'Y'
        'Z')
    end
  end
  object GroupBox2: TGroupBox
    Left = 159
    Top = 87
    Width = 145
    Height = 45
    Caption = #50724#54140#47112#51060#53552
    Padding.Left = 5
    Padding.Top = 15
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 4
    object forLabel4: TEdit
      Left = 8
      Top = 18
      Width = 73
      Height = 21
      Alignment = taCenter
      AutoSelect = False
      AutoSize = False
      BevelEdges = []
      Color = clBtnFace
      TabOrder = 0
      Text = #53440#51060#47672'('#52488')'
    end
    object txtTimer: TEdit
      Left = 87
      Top = 18
      Width = 50
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 1
      Text = '45'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 35
    Width = 145
    Height = 75
    Caption = #44592#45733
    Padding.Left = 5
    Padding.Top = 15
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 5
    object chkSlideAttack: TCheckBox
      Left = 8
      Top = 18
      Width = 129
      Height = 25
      Caption = #51088#46041' '#54924#51204#48288#44592
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkOperator: TCheckBox
      Left = 8
      Top = 49
      Width = 129
      Height = 17
      Caption = #51088#46041' '#48372#51060#46300#45824#49772
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    Left = 448
    Top = 104
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Top = 112
  end
end
