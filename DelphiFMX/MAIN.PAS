unit Main;

interface

//** Converted with Mida BASIC 281     http://www.midaconverter.com



uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IniFiles,
  Data.DB,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Menus,
  FMX.Grid,
  FMX.ExtCtrls,
  FMX.ListBox,
  FMX.TreeView,
  FMX.Memo,
  FMX.TabControl,
  FMX.Layouts,
  FMX.Edit,
  FMX.Platform,
  FMX.Bind.DBEngExt,
  FMX.Bind.Editors,
  FMX.Bind.DBLinks,
  FMX.Bind.Navigator,
  Data.Bind.EngExt,
  Data.Bind.Components,
  Data.Bind.DBScope,
  Data.Bind.DBLinks,
  Datasnap.DBClient,
  Fmx.Bind.Grid,
  System.Rtti,
  System.Bindings.Outputs,
  Data.Bind.Grid,
  Fmx.StdCtrls,
  FMX.Header,
  FMX.Graphics, FMX.Controls.Presentation;

//**   Original VCL Uses section : 


//**   SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
//**   Forms, Dialogs, StdCtrls, Buttons;


type
  TRuleMode = (eNoRule, eRule3, eRule4);
  TMuPuzzleFrm = class(TForm)
    CurrStrLbl: TLabel;
    lblRule1: TLabel;
    lblRule2: TLabel;
    lblRule3: TLabel;
    lblRule4: TLabel;
    MyMuStrListBox: TListBox;
    GoalLbl: TLabel;
    GoalStrLbl: TLabel;
    MuStr: TLabel;
    SelectLbl: TLabel;
    PrevBtn: TButton;
    OkBtn: TButton;
    NextBtn: TButton;
    CancelBtn: TButton;
    btnRule1: TButton;
    btnRule2: TButton;
    btnRule3: TButton;
    btnRule4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRule1Click(Sender: TObject);
    procedure btnRule2Click(Sender: TObject);
    procedure btnRule3Click(Sender: TObject);
    procedure btnRule4Click(Sender: TObject);
    procedure MyMuStrListBoxDblClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    WorkStr: string;
    RuleMode: TRuleMode;
    SelectorPos: Byte;
    procedure UpdateMuStr;
    procedure ActivateSelBtns;
    procedure DeactivateSelBtns;
    procedure ActivateRuleBtns(const TurnOn: Boolean);
    procedure NextSelector;
    procedure PrevSelector;
    procedure LaunchRule(const RuleNum: Integer);
    procedure AddU;
    procedure DuplicateStr;
    procedure StartReplace3IWithU;
    procedure Replace3IWithU(const StartPos: Integer);
    procedure StartDeleteUU;
    procedure DeleteUU(const StartPos: Integer);
    procedure CancelRuleMode;
    procedure SelectOK;
  end;

var
  MuPuzzleFrm: TMuPuzzleFrm;

implementation

uses
  StrUtils;


{$R *.FMX}

function SubStrCount(substr: string; s: string): Byte;
var
  c, i: Byte;
  tmp: string;
begin
  c := 0;
  tmp := s;
  i := Pos(substr, tmp);
  while i > 0 do begin
    tmp := Copy(tmp, i+1, Length(tmp));
    Inc(c);
    i := Pos(substr, tmp);
  end;
  Result := c;
end;

procedure TMuPuzzleFrm.UpdateMuStr;
begin
  if RuleMode = eNoRule then
    MuStr.Text := 'M' + WorkStr
  else
    MuStr.Text := 'M' + LeftStr(WorkStr, SelectorPos-1) + '>' + RightStr(WorkStr, Length(WorkStr) - SelectorPos);

  { add strings to ListBox ignoring duplicates }
  if (RuleMode = eNoRule) and ((MyMuStrListBox.Items.Count = 0) or
            (not SameText(MuStr.Text, MyMuStrListBox.Items[MyMuStrListBox.Items.Count-1]))) then
    MyMuStrListBox.Items.Add(MuStr.Text);
end;

procedure TMuPuzzleFrm.FormCreate(Sender: TObject);
begin
  RuleMode := eNoRule;
  WorkStr := 'I';
  UpdateMuStr;
end;

procedure TMuPuzzleFrm.btnRule1Click(Sender: TObject);
begin
  LaunchRule(1);
end;

procedure TMuPuzzleFrm.btnRule2Click(Sender: TObject);
begin
  LaunchRule(2);
end;

procedure TMuPuzzleFrm.ActivateSelBtns;
begin
  NextBtn.Visible := True;
  OkBtn.Visible  := True;
  CancelBtn.Visible := True;
  PrevBtn.Visible  := True;
  SelectLbl.Visible := True;
  if RuleMode = eRule3 then
    SelectLbl.Text := 'Select "III"'
  else
    SelectLbl.Text := 'Select "UU"';
end;

procedure TMuPuzzleFrm.DeactivateSelBtns;
begin
  PrevBtn.Visible   := False;
  OkBtn.Visible     := False;
  CancelBtn.Visible := False;
  NextBtn.Visible   := False;
  SelectLbl.Visible := False;
end;

procedure TMuPuzzleFrm.ActivateRuleBtns(const TurnOn: Boolean);
begin
  btnRule1.Visible := TurnOn;
  btnRule2.Visible := TurnOn;
  lblRule1.Visible := TurnOn;
  lblRule2.Visible := TurnOn;
  if RuleMode = eRule3 then begin
    btnRule3.Enabled := TurnOn;
    lblRule3.Enabled := TurnOn;
    btnRule4.Visible := TurnOn;
    lblRule4.Visible := TurnOn;
  end else if RuleMode = eRule4 then begin
    btnRule3.Visible := TurnOn;
    lblRule3.Visible := TurnOn;
    btnRule4.Enabled := TurnOn;
    lblRule4.Enabled := TurnOn;
  end else if TurnOn then begin
    btnRule3.Visible := True;
    lblRule3.Visible := True;
    btnRule3.Enabled := True;
    lblRule3.Enabled := True;
    btnRule4.Visible := True;
    lblRule4.Visible := True;
    btnRule4.Enabled := True;
    lblRule4.Enabled := True;
  end;

end;

procedure TMuPuzzleFrm.NextSelector;
const
  RuleModeStr: array[1..2] of string = ('III', 'UU');
var
  SaveSelPos: Integer;
begin
  SaveSelPos := SelectorPos;
  SelectorPos := Pos(RuleModeStr[Ord(RuleMode)], Copy(WorkStr, SelectorPos+1, 255));
  if SelectorPos = 0 then
    SelectorPos := SaveSelPos
  else
    SelectorPos := SelectorPos + SaveSelPos;
end;

procedure TMuPuzzleFrm.PrevSelector;
const
  RuleModeStr: array[1..2] of string = ('III', 'UU');
var
  SaveSelPos: Integer;
  CheckStr: string;
begin
  SaveSelPos := SelectorPos;
  repeat
    Dec(SelectorPos);
    CheckStr := Copy(WorkStr, SelectorPos, Length(RuleModeStr[Ord(RuleMode)]));
  until (SelectorPos = 0) or (CheckStr = RuleModeStr[Ord(RuleMode)]);
  if SelectorPos = 0 then
    SelectorPos := SaveSelPos;
end;

procedure TMuPuzzleFrm.LaunchRule(const RuleNum: Integer);
begin
  case RuleNum of
    1: AddU;
    2: DuplicateStr;
    3: StartReplace3IWithU;
    4: StartDeleteUU;
  end;
end;

procedure TMuPuzzleFrm.AddU;
begin
  { if the last character is "I", add a "U" }
  if WorkStr[Length(WorkStr)] = 'I' then
    WorkStr := WorkStr + 'U';
  UpdateMuStr;
end;

procedure TMuPuzzleFrm.DuplicateStr;
begin
  { add the whole string to the end of itself }
  WorkStr := WorkStr + WorkStr;
  UpdateMuStr;
end;

procedure TMuPuzzleFrm.StartReplace3IWithU;
var
  c: Byte;
begin
  { count occurances of 'III' found in our string }
  c := SubStrCount('III', MuStr.Text);

  { if none, put up a message }
  if c = 0 then
    MessageDlg('There is no occurance of "III" in the current string.', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0)
  else begin
    { if one, replace it automatically }
    if c = 1 then
      Replace3IWithU(Pos('III', WorkStr))
    else begin
      { if more than one, let user select }
      RuleMode := eRule3;

      ActivateSelBtns;
      ActivateRuleBtns(False);
      SelectorPos := 0;
      NextSelector;
    end;

    UpdateMuStr;
  end;
end;

procedure TMuPuzzleFrm.StartDeleteUU;
var
  c: Byte;
begin
  { count and store indices of 'UU' found in our string }
  c := SubStrCount('UU', MuStr.Text);

  { if none, put up a message }
  if c = 0 then
    MessageDlg('There is no occurance of "UU" in the current string.', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0)
  else begin
    { if one, replace it automatically }
    if c = 1 then begin
      c := Pos('UU', WorkStr);
      if c > 0 then
        { double check }
        DeleteUU(c);
    end else begin
      { if more than one, let user select }
      RuleMode := eRule4;

      ActivateSelBtns;
      ActivateRuleBtns(False);
      SelectorPos := 0;
      NextSelector;
    end;

    UpdateMuStr;
  end;
end;

procedure TMuPuzzleFrm.CancelRuleMode;
begin
  RuleMode := eNoRule;
  DeactivateSelBtns;
  ActivateRuleBtns(True);
  UpdateMuStr;
end;

procedure TMuPuzzleFrm.SelectOK;
begin
  if RuleMode = eRule3 then
    Replace3IWithU(SelectorPos)
  else
    DeleteUU(SelectorPos);

  CancelRuleMode;
end;

procedure TMuPuzzleFrm.DeleteUU(const StartPos: Integer);
begin
  Delete(WorkStr, StartPos, 2);
end;

procedure TMuPuzzleFrm.Replace3IWithU(const StartPos: Integer);
begin
  Delete(WorkStr, StartPos, 3);
  Insert('U', WorkStr, StartPos);
end;

procedure TMuPuzzleFrm.btnRule3Click(Sender: TObject);
begin
  LaunchRule(3);
end;

procedure TMuPuzzleFrm.btnRule4Click(Sender: TObject);
begin
  LaunchRule(4);
end;

procedure TMuPuzzleFrm.MyMuStrListBoxDblClick(Sender: TObject);
begin
  WorkStr := Copy(MyMuStrListBox.Items[MyMuStrListBox.ItemIndex], 2, 255);
  UpdateMuStr;
end;

procedure TMuPuzzleFrm.PrevBtnClick(Sender: TObject);
begin
  PrevSelector;
  UpdateMuStr;
end;

procedure TMuPuzzleFrm.NextBtnClick(Sender: TObject);
begin
  NextSelector;
  UpdateMuStr;
end;

procedure TMuPuzzleFrm.CancelBtnClick(Sender: TObject);
begin
  CancelRuleMode;
end;

procedure TMuPuzzleFrm.OkBtnClick(Sender: TObject);
begin
  SelectOK;
end;

end.
