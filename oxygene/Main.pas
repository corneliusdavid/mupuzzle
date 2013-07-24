namespace MuPuzzle;

interface

uses
  System.Windows.Forms,
  System.Diagnostics,
  System.Drawing;

type
  /// <summary>
  /// Summary description for MainForm.
  /// </summary>
  frmMUMain = class(System.Windows.Forms.Form)
  {$REGION Windows Form Designer generated fields}
  private
    lblCurrStr: System.Windows.Forms.Label;
    label8: System.Windows.Forms.Label;
    label7: System.Windows.Forms.Label;
    label6: System.Windows.Forms.Label;
    label5: System.Windows.Forms.Label;
    btnRule4: System.Windows.Forms.Button;
    btnRule3: System.Windows.Forms.Button;
    btnRule2: System.Windows.Forms.Button;
    btnRule1: System.Windows.Forms.Button;
    btnNext: System.Windows.Forms.Button;
    btnCancel: System.Windows.Forms.Button;
    btnOK: System.Windows.Forms.Button;
    btnPrev: System.Windows.Forms.Button;
    label3: System.Windows.Forms.Label;
    label2: System.Windows.Forms.Label;
    label1: System.Windows.Forms.Label;
    lbMyMUStrings: System.Windows.Forms.ListBox;
    components: System.ComponentModel.Container := nil;
    method InitializeComponent;
  {$ENDREGION}
  const
    CARAT_STR = '>';
  private
    MUStr: MUString := new MUString;
    fSearchStr: String;
    fSelected: Boolean;
    fCanceled: Boolean;
    method lbMyMUStrings_DoubleClick(sender: System.Object; e: System.EventArgs);
    method btnCancel_Leave(sender: System.Object; e: System.EventArgs);
    method NextSearchStr;
    method PrevSearchStr;
    method btnNext_Click(sender: System.Object; e: System.EventArgs);
    method btnCancel_Click(sender: System.Object; e: System.EventArgs);
    method btnOK_Click(sender: System.Object; e: System.EventArgs);
    method btnPrev_Click(sender: System.Object; e: System.EventArgs);
    method EnableSelectButtons(AEnable: Boolean);
    method EnableRuleButtons(AEnable: Boolean);
    method btnRule4_Click(sender: System.Object; e: System.EventArgs);
    method btnRule3_Click(sender: System.Object; e: System.EventArgs);
    method btnRule2_Click(sender: System.Object; e: System.EventArgs);
    method btnRule1_Click(sender: System.Object; e: System.EventArgs);
    method ShowChangedString(NewMUString: MUString);
    method RememberStringsUsed(NewMUString: MUString);
    method ChooseSubStr(ASearchString: string; var AStrIndex: Integer);
  protected
    method Dispose(aDisposing: boolean); override;
  public
    constructor;
  end;
  
  

implementation

{$REGION Construction and Disposition}
constructor frmMUMain;
begin
  //
  // Required for Windows Form Designer support
  //
  InitializeComponent();

  //
  // TODO: Add any constructor code after InitializeComponent call
  //
  Debug.WriteLine('-------------');
  lblCurrStr.Text := MUStr.TheString;
  MUStr.OnStringChanged += ShowChangedString;
  MUStr.OnStringChanged += RememberStringsUsed;
  MUStr.OnChooseSubString += ChooseSubStr;
  RememberStringsUsed(MUStr);
end;

method frmMUMain.Dispose(aDisposing: boolean);
begin
  if aDisposing then begin
    if assigned(components) then
      components.Dispose();

    //
    // TODO: Add custom disposition code here
    //
  end;
  inherited Dispose(aDisposing);
end;
{$ENDREGION}

{$REGION Windows Form Designer generated code}
method frmMUMain.InitializeComponent;
begin
  var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeOf(frmMUMain));
  self.lbMyMUStrings := new System.Windows.Forms.ListBox();
  self.label1 := new System.Windows.Forms.Label();
  self.label2 := new System.Windows.Forms.Label();
  self.label3 := new System.Windows.Forms.Label();
  self.lblCurrStr := new System.Windows.Forms.Label();
  self.btnOK := new System.Windows.Forms.Button();
  self.btnCancel := new System.Windows.Forms.Button();
  self.btnNext := new System.Windows.Forms.Button();
  self.btnRule1 := new System.Windows.Forms.Button();
  self.btnRule2 := new System.Windows.Forms.Button();
  self.btnRule3 := new System.Windows.Forms.Button();
  self.btnRule4 := new System.Windows.Forms.Button();
  self.label5 := new System.Windows.Forms.Label();
  self.label6 := new System.Windows.Forms.Label();
  self.label7 := new System.Windows.Forms.Label();
  self.label8 := new System.Windows.Forms.Label();
  self.btnPrev := new System.Windows.Forms.Button();
  self.SuspendLayout();
  // 
  // lbMyMUStrings
  // 
  self.lbMyMUStrings.Anchor := ((((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Bottom) 
        or System.Windows.Forms.AnchorStyles.Left) 
        or System.Windows.Forms.AnchorStyles.Right) as System.Windows.Forms.AnchorStyles);
  self.lbMyMUStrings.FormattingEnabled := true;
  self.lbMyMUStrings.Location := new System.Drawing.Point(-2, 215);
  self.lbMyMUStrings.Name := 'lbMyMUStrings';
  self.lbMyMUStrings.Size := new System.Drawing.Size(650, 225);
  self.lbMyMUStrings.TabIndex := 0;
  self.lbMyMUStrings.DoubleClick += new System.EventHandler(@self.lbMyMUStrings_DoubleClick);
  // 
  // label1
  // 
  self.label1.AutoSize := true;
  self.label1.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (0 as System.Byte));
  self.label1.Location := new System.Drawing.Point(23, 25);
  self.label1.Name := 'label1';
  self.label1.Size := new System.Drawing.Size(127, 20);
  self.label1.TabIndex := 1;
  self.label1.Text := 'Current String:';
  // 
  // label2
  // 
  self.label2.AutoSize := true;
  self.label2.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (0 as System.Byte));
  self.label2.Location := new System.Drawing.Point(23, 103);
  self.label2.Name := 'label2';
  self.label2.Size := new System.Drawing.Size(105, 20);
  self.label2.TabIndex := 2;
  self.label2.Text := 'Goal String:';
  // 
  // label3
  // 
  self.label3.AutoSize := true;
  self.label3.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (0 as System.Byte));
  self.label3.Location := new System.Drawing.Point(45, 123);
  self.label3.Name := 'label3';
  self.label3.Size := new System.Drawing.Size(34, 20);
  self.label3.TabIndex := 3;
  self.label3.Text := 'MU';
  // 
  // lblCurrStr
  // 
  self.lblCurrStr.Anchor := (((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Left) 
        or System.Windows.Forms.AnchorStyles.Right) as System.Windows.Forms.AnchorStyles);
  self.lblCurrStr.Font := new System.Drawing.Font('Microsoft Sans Serif', 12, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (0 as System.Byte));
  self.lblCurrStr.Location := new System.Drawing.Point(45, 45);
  self.lblCurrStr.Name := 'lblCurrStr';
  self.lblCurrStr.Size := new System.Drawing.Size(603, 55);
  self.lblCurrStr.TabIndex := 4;
  // 
  // btnOK
  // 
  self.btnOK.Location := new System.Drawing.Point(322, 12);
  self.btnOK.Name := 'btnOK';
  self.btnOK.Size := new System.Drawing.Size(75, 30);
  self.btnOK.TabIndex := 6;
  self.btnOK.Tag := 'select';
  self.btnOK.Text := '&OK';
  self.btnOK.TextImageRelation := System.Windows.Forms.TextImageRelation.ImageBeforeText;
  self.btnOK.UseVisualStyleBackColor := true;
  self.btnOK.Visible := false;
  self.btnOK.Click += new System.EventHandler(@self.btnOK_Click);
  // 
  // btnCancel
  // 
  self.btnCancel.Location := new System.Drawing.Point(403, 12);
  self.btnCancel.Name := 'btnCancel';
  self.btnCancel.Size := new System.Drawing.Size(75, 30);
  self.btnCancel.TabIndex := 7;
  self.btnCancel.Tag := 'select';
  self.btnCancel.Text := '&Cancel';
  self.btnCancel.TextImageRelation := System.Windows.Forms.TextImageRelation.ImageBeforeText;
  self.btnCancel.UseVisualStyleBackColor := true;
  self.btnCancel.Visible := false;
  self.btnCancel.Click += new System.EventHandler(@self.btnCancel_Click);
  self.btnCancel.Leave += new System.EventHandler(@self.btnCancel_Leave);
  // 
  // btnNext
  // 
  self.btnNext.Location := new System.Drawing.Point(484, 12);
  self.btnNext.Name := 'btnNext';
  self.btnNext.Size := new System.Drawing.Size(75, 30);
  self.btnNext.TabIndex := 8;
  self.btnNext.Tag := 'select';
  self.btnNext.Text := '&Next';
  self.btnNext.TextImageRelation := System.Windows.Forms.TextImageRelation.ImageBeforeText;
  self.btnNext.UseVisualStyleBackColor := true;
  self.btnNext.Visible := false;
  self.btnNext.Click += new System.EventHandler(@self.btnNext_Click);
  // 
  // btnRule1
  // 
  self.btnRule1.Location := new System.Drawing.Point(164, 103);
  self.btnRule1.Name := 'btnRule1';
  self.btnRule1.Size := new System.Drawing.Size(26, 23);
  self.btnRule1.TabIndex := 9;
  self.btnRule1.Tag := 'rule';
  self.btnRule1.Text := '&1';
  self.btnRule1.UseVisualStyleBackColor := true;
  self.btnRule1.Click += new System.EventHandler(@self.btnRule1_Click);
  // 
  // btnRule2
  // 
  self.btnRule2.Location := new System.Drawing.Point(164, 132);
  self.btnRule2.Name := 'btnRule2';
  self.btnRule2.Size := new System.Drawing.Size(26, 23);
  self.btnRule2.TabIndex := 10;
  self.btnRule2.Tag := 'rule';
  self.btnRule2.Text := '&2';
  self.btnRule2.UseVisualStyleBackColor := true;
  self.btnRule2.Click += new System.EventHandler(@self.btnRule2_Click);
  // 
  // btnRule3
  // 
  self.btnRule3.Location := new System.Drawing.Point(164, 161);
  self.btnRule3.Name := 'btnRule3';
  self.btnRule3.Size := new System.Drawing.Size(26, 23);
  self.btnRule3.TabIndex := 11;
  self.btnRule3.Tag := 'rule';
  self.btnRule3.Text := '&3';
  self.btnRule3.UseVisualStyleBackColor := true;
  self.btnRule3.Click += new System.EventHandler(@self.btnRule3_Click);
  // 
  // btnRule4
  // 
  self.btnRule4.Location := new System.Drawing.Point(164, 190);
  self.btnRule4.Name := 'btnRule4';
  self.btnRule4.Size := new System.Drawing.Size(26, 23);
  self.btnRule4.TabIndex := 12;
  self.btnRule4.Tag := 'rule';
  self.btnRule4.Text := '&4';
  self.btnRule4.UseVisualStyleBackColor := true;
  self.btnRule4.Click += new System.EventHandler(@self.btnRule4_Click);
  // 
  // label5
  // 
  self.label5.AutoSize := true;
  self.label5.Location := new System.Drawing.Point(196, 108);
  self.label5.Name := 'label5';
  self.label5.Size := new System.Drawing.Size(219, 13);
  self.label5.TabIndex := 13;
  self.label5.Text := 'Apply Rule 1: Add a "U" if the last letter is "I"';
  // 
  // label6
  // 
  self.label6.AutoSize := true;
  self.label6.Location := new System.Drawing.Point(196, 137);
  self.label6.Name := 'label6';
  self.label6.Size := new System.Drawing.Size(249, 13);
  self.label6.TabIndex := 14;
  self.label6.Text := 'Apply Rule 2: Add everything after the M to the end';
  // 
  // label7
  // 
  self.label7.AutoSize := true;
  self.label7.Location := new System.Drawing.Point(196, 166);
  self.label7.Name := 'label7';
  self.label7.Size := new System.Drawing.Size(259, 13);
  self.label7.TabIndex := 15;
  self.label7.Text := 'Apply Rule 3: Replace an occurance of "III" with "U"';
  // 
  // label8
  // 
  self.label8.AutoSize := true;
  self.label8.Location := new System.Drawing.Point(196, 195);
  self.label8.Name := 'label8';
  self.label8.Size := new System.Drawing.Size(214, 13);
  self.label8.TabIndex := 16;
  self.label8.Text := 'Apply Rule 4: Delete an occurance of "UU"';
  // 
  // btnPrev
  // 
  self.btnPrev.Location := new System.Drawing.Point(241, 12);
  self.btnPrev.Name := 'btnPrev';
  self.btnPrev.Size := new System.Drawing.Size(75, 30);
  self.btnPrev.TabIndex := 5;
  self.btnPrev.Tag := 'select';
  self.btnPrev.Text := '&Prev';
  self.btnPrev.TextImageRelation := System.Windows.Forms.TextImageRelation.ImageBeforeText;
  self.btnPrev.UseVisualStyleBackColor := true;
  self.btnPrev.Visible := false;
  self.btnPrev.Click += new System.EventHandler(@self.btnPrev_Click);
  // 
  // frmMUMain
  // 
  self.ClientSize := new System.Drawing.Size(648, 436);
  self.Controls.Add(self.label8);
  self.Controls.Add(self.label7);
  self.Controls.Add(self.label6);
  self.Controls.Add(self.label5);
  self.Controls.Add(self.btnRule4);
  self.Controls.Add(self.btnRule3);
  self.Controls.Add(self.btnRule2);
  self.Controls.Add(self.btnRule1);
  self.Controls.Add(self.btnNext);
  self.Controls.Add(self.btnCancel);
  self.Controls.Add(self.btnOK);
  self.Controls.Add(self.btnPrev);
  self.Controls.Add(self.lblCurrStr);
  self.Controls.Add(self.label3);
  self.Controls.Add(self.label2);
  self.Controls.Add(self.label1);
  self.Controls.Add(self.lbMyMUStrings);
  self.Icon := (resources.GetObject('$this.Icon') as System.Drawing.Icon);
  self.Name := 'frmMUMain';
  self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
  self.Text := 'MU Puzzle - Oxygene Windows Forms App';
  self.ResumeLayout(false);
  self.PerformLayout();
end;
{$ENDREGION}

method frmMUMain.btnRule1_Click(sender: System.Object; e: System.EventArgs);
begin
  MUStr.AddU;
end;

method frmMUMain.btnRule2_Click(sender: System.Object; e: System.EventArgs);
begin
  MUStr.AppendAll;
end;

method frmMUMain.btnRule3_Click(sender: System.Object; e: System.EventArgs);
begin
  MUStr.ReplaceIIIwithU;
end;

method frmMUMain.btnRule4_Click(sender: System.Object; e: System.EventArgs);
begin
  MUStr.DeleteUU;
end;

method frmMUMain.ShowChangedString(NewMUString: MUString); 
begin
  lblCurrStr.Text := NewMUString.TheString;
end;

method frmMUMain.RememberStringsUsed(NewMUString: MUString); 
begin
  lbMyMUStrings.Items.Add(NewMUString.TheString);
end;

method frmMUMain.EnableRuleButtons(AEnable: Boolean);
begin
  btnRule1.Enabled := AEnable;
  btnRule2.Enabled := AEnable;
  btnRule3.Enabled := AEnable;
  btnRule4.Enabled := AEnable;
end;

method frmMUMain.EnableSelectButtons(AEnable: Boolean);
begin
  btnPrev.Visible := AEnable;
  btnOK.Visible := AEnable;
  btnCancel.Visible := AEnable;
  btnNext.Visible := AEnable;
end;

method frmMUMain.btnPrev_Click(sender: System.Object; e: System.EventArgs);
begin
  PrevSearchStr;
end;

method frmMUMain.btnOK_Click(sender: System.Object; e: System.EventArgs);
begin
  fSelected := True;
  EnableRuleButtons(True);
  EnableSelectButtons(False);
end;

method frmMUMain.btnCancel_Click(sender: System.Object; e: System.EventArgs);
begin
  fCanceled := True;
  EnableRuleButtons(True);
  EnableSelectButtons(False);
  // reset the string
  lblCurrStr.Text := MUStr.TheString;
end;

method frmMUMain.btnNext_Click(sender: System.Object; e: System.EventArgs);
begin
  NextSearchStr;  
end;

method frmMUMain.ChooseSubStr(ASearchString: string; var AStrIndex: Integer);
begin
  EnableRuleButtons(False);
  EnableSelectButtons(True);
  fSelected := False;
  fCanceled := False;
  fSearchStr := ASearchString;
  try
    lblCurrStr.Text.Insert(0, CARAT_STR);
    NextSearchStr;
    repeat
      Application.DoEvents;
    until fSelected or fCanceled;
    
    if fSelected then
      AStrIndex := lblCurrStr.Text.IndexOf(CARAT_STR)
    else
      AStrIndex := 0;
  finally
    EnableRuleButtons(True);
    EnableSelectButtons(False);
  end;
end;

method frmMUMain.NextSearchStr;
var
  i, j: Integer;
begin
  // where are we currently pointing to?
  i := lblCurrStr.Text.IndexOf(CARAT_STR);
  Debug.WriteLine('next: index of > = ' + i.ToString);
  
  // is there a pointer there?
  if i >= 0 then
    lblCurrStr.Text := lblCurrStr.Text.Remove(i, 1);

  // find the "next" search string
  if i >= 0 then
    j := lblCurrStr.Text.Substring(i + 1).IndexOf(fSearchStr) + i + 1
  else
    j := lblCurrStr.Text.IndexOf(fSearchStr);
  
  Debug.WriteLine('next: index of search ' + fSearchStr + ' = ' + j.ToString);
      
  // set the new pointer
  if j >= 0 then
    lblCurrStr.Text := lblCurrStr.Text.Insert(j, CARAT_STR);
end;

method frmMUMain.PrevSearchStr; 
var
  found: Boolean;
  i, j: Integer;
begin
  // where are we currently pointing to?
  i := lblCurrStr.Text.IndexOf(CARAT_STR);
  Debug.WriteLine('prev: index of > = ' + i.ToString);
  
  if i >= 0 then begin
    // is there a pointer there?  if so, remove it
    lblCurrStr.Text := lblCurrStr.Text.Remove(i, 1);
    // is there a "search string" before that?
    j := i - 1;
  end else
    j := 1;
  found := False;
  // search for the previous "search string"
  while j > 0 do begin
    Debug.WriteLine('prev: index of ' + fSearchStr + ' = ' + j.ToString);
    if lblCurrStr.Text.SubString(j, fSearchStr.Length) = fSearchStr then begin
      found := True;
      Break;
    end else
      Dec(j);
  end;
  
  // yes, move it to the next spot
  if found then 
    lblCurrStr.Text := lblCurrStr.Text.Insert(j, CARAT_STR)
  else if i >= 0 then
    lblCurrStr.Text := lblCurrStr.Text.Insert(i, CARAT_STR);
end;

method frmMUMain.btnCancel_Leave(sender: System.Object; e: System.EventArgs);
begin
  fCanceled := True; // fail safe if application closed while in the "search" loop
end;

method frmMUMain.lbMyMUStrings_DoubleClick(sender: System.Object; e: System.EventArgs);
begin
  MUStr.TheString := lbMyMUStrings.SelectedItem.ToString;
end;

end.