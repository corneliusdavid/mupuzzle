unit Main;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TRuleMode = (eNoRule, eRule3, eRule4);
  TMuPuzzleFrm = class(TForm)
    CurrStrLbl: TLabel;
    Rule1Lbl: TLabel;
    Rule2Lbl: TLabel;
    Rule3Lbl: TLabel;
    Rule4Lbl: TLabel;
    MyMuStrListBox: TListBox;
    GoalLbl: TLabel;
    GoalStrLbl: TLabel;
    MuStr: TLabel;
    SelectLbl: TLabel;
    PrevBtn: TBitBtn;
    OkBtn: TBitBtn;
    NextBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Rule1Btn: TButton;
    Rule2Btn: TButton;
    Rule3Btn: TButton;
    Rule4Btn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Rule1BtnClick(Sender: TObject);
    procedure Rule2BtnClick(Sender: TObject);
    procedure Rule3BtnClick(Sender: TObject);
    procedure Rule4BtnClick(Sender: TObject);
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
    procedure ActivateRuleBtns;
    procedure DeactivateRuleBtns;
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


{$R *.DFM}

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
    MuStr.Caption := 'M' + WorkStr
  else
    MuStr.Caption := 'M' + LeftStr(WorkStr, SelectorPos-1) + '>' + RightStr(WorkStr, Length(WorkStr) - SelectorPos);

  { add strings to ListBox ignoring duplicates }
  if (RuleMode = eNoRule) and ((MyMuStrListBox.Items.Count = 0) or
            (not SameText(MuStr.Caption, MyMuStrListBox.Items[MyMuStrListBox.Items.Count-1]))) then
    MyMuStrListBox.Items.Add(MuStr.Caption);
end;

procedure TMuPuzzleFrm.FormCreate(Sender: TObject);
begin
  RuleMode := eNoRule;
  WorkStr := 'I';
  UpdateMuStr;
end;

procedure TMuPuzzleFrm.Rule1BtnClick(Sender: TObject);
begin
  LaunchRule(1);
end;

procedure TMuPuzzleFrm.Rule2BtnClick(Sender: TObject);
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
    SelectLbl.Caption := 'Select "III"'
  else
    SelectLbl.Caption := 'Select "UU"';
end;

procedure TMuPuzzleFrm.DeactivateSelBtns;
begin
  PrevBtn.Visible   := False;
  OkBtn.Visible     := False;
  CancelBtn.Visible := False;
  NextBtn.Visible   := False;
  SelectLbl.Visible := False;
end;

procedure TMuPuzzleFrm.ActivateRuleBtns;
begin
  Rule1Btn.Visible := True;
  Rule2Btn.Visible := True;
  Rule3Btn.Enabled := True;
  Rule3Btn.Visible := True;
  Rule4Btn.Enabled := True;
  Rule4Btn.Visible := True;
  Rule1Lbl.Visible := True;
  Rule2Lbl.Visible := True;
  Rule3Lbl.Visible := True;
  Rule4Lbl.Visible := True;
end;

procedure TMuPuzzleFrm.DeactivateRuleBtns;
begin
  Rule1Btn.Visible := False;
  Rule2Btn.Visible := False;
  Rule1Lbl.Visible := False;
  Rule2Lbl.Visible := False;
  if RuleMode = eRule3 then begin
    Rule3Btn.Enabled := False;
    Rule4Btn.Visible := False;
    Rule4Lbl.Visible := False;
  end else begin
    Rule3Btn.Visible := False;
    Rule3Lbl.Visible := False;
    Rule4Btn.Enabled := False;
  end;
end;

procedure TMuPuzzleFrm.NextSelector;
const
  RuleModeStr: array[1..2] of string[3] = ('III', 'UU');
var
  SaveSelPos: Byte;
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
  RuleModeStr: array[1..2] of string[3] = ('III', 'UU');
var
  SaveSelPos: Byte;
  CheckStr: string[3];
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
  c := SubStrCount('III', MuStr.Caption);

  { if none, put up a message }
  if c = 0 then
    Application.MessageBox('There is no occurance of "III" in the current string.', 'Notify', mb_ICONHAND + mb_OK)
  else begin
    { if one, replace it automatically }
    if c = 1 then
      Replace3IWithU(Pos('III', WorkStr))
    else begin
      { if more than one, let user select }
      RuleMode := eRule3;

      ActivateSelBtns;
      DeactivateRuleBtns;
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
  c := SubStrCount('UU', MuStr.Caption);

  { if none, put up a message }
  if c = 0 then
    Application.MessageBox('There is no occurance of "UU" in the current string.', 'Notify', mb_ICONHAND + mb_OK)
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
      DeactivateRuleBtns;
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
  ActivateRuleBtns;
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

procedure TMuPuzzleFrm.Rule3BtnClick(Sender: TObject);
begin
  LaunchRule(3);
end;

procedure TMuPuzzleFrm.Rule4BtnClick(Sender: TObject);
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
