namespace MU_Puzzle_WinForm
{
    partial class frmMUPuzzle
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnPrev = new System.Windows.Forms.Button();
            this.btnOK = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnNext = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.MuStr = new System.Windows.Forms.Label();
            this.lbMuStrs = new System.Windows.Forms.ListBox();
            this.btnRule1 = new System.Windows.Forms.Button();
            this.btnRule2 = new System.Windows.Forms.Button();
            this.lblRule1 = new System.Windows.Forms.Label();
            this.lblRule2 = new System.Windows.Forms.Label();
            this.lblRule4 = new System.Windows.Forms.Label();
            this.lblRule3 = new System.Windows.Forms.Label();
            this.btnRule4 = new System.Windows.Forms.Button();
            this.btnRule3 = new System.Windows.Forms.Button();
            this.lblSelect = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnPrev
            // 
            this.btnPrev.Image = global::MU_Puzzle_WinForm.Properties.Resources._56;
            this.btnPrev.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnPrev.Location = new System.Drawing.Point(185, 25);
            this.btnPrev.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnPrev.Name = "btnPrev";
            this.btnPrev.Size = new System.Drawing.Size(85, 27);
            this.btnPrev.TabIndex = 0;
            this.btnPrev.Text = "Prev";
            this.btnPrev.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnPrev.UseVisualStyleBackColor = true;
            this.btnPrev.Visible = false;
            this.btnPrev.Click += new System.EventHandler(this.btnPrev_Click);
            // 
            // btnOK
            // 
            this.btnOK.Image = global::MU_Puzzle_WinForm.Properties.Resources.OK__2_;
            this.btnOK.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnOK.Location = new System.Drawing.Point(276, 25);
            this.btnOK.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(85, 27);
            this.btnOK.TabIndex = 1;
            this.btnOK.Text = "OK";
            this.btnOK.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Visible = false;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Image = global::MU_Puzzle_WinForm.Properties.Resources.Cancel;
            this.btnCancel.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCancel.Location = new System.Drawing.Point(367, 25);
            this.btnCancel.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(85, 27);
            this.btnCancel.TabIndex = 2;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Visible = false;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnNext
            // 
            this.btnNext.Image = global::MU_Puzzle_WinForm.Properties.Resources._57;
            this.btnNext.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnNext.Location = new System.Drawing.Point(458, 25);
            this.btnNext.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(85, 27);
            this.btnNext.TabIndex = 3;
            this.btnNext.Text = "Next";
            this.btnNext.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnNext.UseVisualStyleBackColor = true;
            this.btnNext.Visible = false;
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(103, 18);
            this.label1.TabIndex = 4;
            this.label1.Text = "Current String:";
            // 
            // MuStr
            // 
            this.MuStr.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.MuStr.Font = new System.Drawing.Font("Lucida Console", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MuStr.Location = new System.Drawing.Point(12, 55);
            this.MuStr.Name = "MuStr";
            this.MuStr.Size = new System.Drawing.Size(660, 88);
            this.MuStr.TabIndex = 5;
            this.MuStr.Text = "MMUIIUIUIUU";
            // 
            // lbMuStrs
            // 
            this.lbMuStrs.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lbMuStrs.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbMuStrs.FormattingEnabled = true;
            this.lbMuStrs.ItemHeight = 20;
            this.lbMuStrs.Location = new System.Drawing.Point(0, 251);
            this.lbMuStrs.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.lbMuStrs.Name = "lbMuStrs";
            this.lbMuStrs.Size = new System.Drawing.Size(684, 244);
            this.lbMuStrs.TabIndex = 6;
            this.lbMuStrs.DoubleClick += new System.EventHandler(this.lbMuStrs_DoubleClick);
            // 
            // btnRule1
            // 
            this.btnRule1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRule1.Location = new System.Drawing.Point(286, 183);
            this.btnRule1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnRule1.Name = "btnRule1";
            this.btnRule1.Size = new System.Drawing.Size(75, 28);
            this.btnRule1.TabIndex = 7;
            this.btnRule1.Text = "Rule 1";
            this.btnRule1.UseVisualStyleBackColor = true;
            this.btnRule1.Click += new System.EventHandler(this.btnRule1_Click);
            // 
            // btnRule2
            // 
            this.btnRule2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRule2.Location = new System.Drawing.Point(286, 215);
            this.btnRule2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnRule2.Name = "btnRule2";
            this.btnRule2.Size = new System.Drawing.Size(75, 32);
            this.btnRule2.TabIndex = 8;
            this.btnRule2.Text = "Rule 2";
            this.btnRule2.UseVisualStyleBackColor = true;
            this.btnRule2.Click += new System.EventHandler(this.btnRule2_Click);
            // 
            // lblRule1
            // 
            this.lblRule1.AutoSize = true;
            this.lblRule1.Location = new System.Drawing.Point(85, 187);
            this.lblRule1.Name = "lblRule1";
            this.lblRule1.Size = new System.Drawing.Size(195, 20);
            this.lblRule1.TabIndex = 9;
            this.lblRule1.Text = "Add \"U\" if last letter is \"I\"";
            this.lblRule1.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // lblRule2
            // 
            this.lblRule2.AutoSize = true;
            this.lblRule2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRule2.Location = new System.Drawing.Point(12, 215);
            this.lblRule2.Name = "lblRule2";
            this.lblRule2.Size = new System.Drawing.Size(268, 20);
            this.lblRule2.TabIndex = 10;
            this.lblRule2.Text = "Add everything after \"M\" to the end";
            this.lblRule2.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // lblRule4
            // 
            this.lblRule4.AutoSize = true;
            this.lblRule4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRule4.Location = new System.Drawing.Point(448, 222);
            this.lblRule4.Name = "lblRule4";
            this.lblRule4.Size = new System.Drawing.Size(224, 20);
            this.lblRule4.TabIndex = 14;
            this.lblRule4.Text = "Delete an occurance of \"UU\"";
            // 
            // lblRule3
            // 
            this.lblRule3.AutoSize = true;
            this.lblRule3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRule3.Location = new System.Drawing.Point(448, 188);
            this.lblRule3.Name = "lblRule3";
            this.lblRule3.Size = new System.Drawing.Size(163, 20);
            this.lblRule3.TabIndex = 13;
            this.lblRule3.Text = "Replace \"III\" with \"U\"";
            // 
            // btnRule4
            // 
            this.btnRule4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRule4.Location = new System.Drawing.Point(367, 217);
            this.btnRule4.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnRule4.Name = "btnRule4";
            this.btnRule4.Size = new System.Drawing.Size(75, 30);
            this.btnRule4.TabIndex = 12;
            this.btnRule4.Text = "Rule 4";
            this.btnRule4.UseVisualStyleBackColor = true;
            this.btnRule4.Click += new System.EventHandler(this.btnRule4_Click);
            // 
            // btnRule3
            // 
            this.btnRule3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRule3.Location = new System.Drawing.Point(367, 183);
            this.btnRule3.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnRule3.Name = "btnRule3";
            this.btnRule3.Size = new System.Drawing.Size(75, 30);
            this.btnRule3.TabIndex = 11;
            this.btnRule3.Text = "Rule 3";
            this.btnRule3.UseVisualStyleBackColor = true;
            this.btnRule3.Click += new System.EventHandler(this.btnRule3_Click);
            // 
            // lblSelect
            // 
            this.lblSelect.AutoSize = true;
            this.lblSelect.Location = new System.Drawing.Point(329, 3);
            this.lblSelect.Name = "lblSelect";
            this.lblSelect.Size = new System.Drawing.Size(66, 20);
            this.lblSelect.TabIndex = 15;
            this.lblSelect.Text = "Select: ";
            this.lblSelect.Visible = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(12, 145);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(86, 18);
            this.label2.TabIndex = 16;
            this.label2.Text = "Goal String:";
            // 
            // label3
            // 
            this.label3.Font = new System.Drawing.Font("Lucida Sans Typewriter", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(12, 161);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(62, 22);
            this.label3.TabIndex = 17;
            this.label3.Text = "MU";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // frmMUPuzzle
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(684, 495);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lblSelect);
            this.Controls.Add(this.lblRule4);
            this.Controls.Add(this.lblRule3);
            this.Controls.Add(this.btnRule4);
            this.Controls.Add(this.btnRule3);
            this.Controls.Add(this.lblRule2);
            this.Controls.Add(this.lblRule1);
            this.Controls.Add(this.btnRule2);
            this.Controls.Add(this.btnRule1);
            this.Controls.Add(this.lbMuStrs);
            this.Controls.Add(this.MuStr);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnNext);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnOK);
            this.Controls.Add(this.btnPrev);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.MinimumSize = new System.Drawing.Size(700, 400);
            this.Name = "frmMUPuzzle";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "MU Puzzle Explorer";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnPrev;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnNext;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label MuStr;
        private System.Windows.Forms.ListBox lbMuStrs;
        private System.Windows.Forms.Button btnRule1;
        private System.Windows.Forms.Button btnRule2;
        private System.Windows.Forms.Label lblRule1;
        private System.Windows.Forms.Label lblRule2;
        private System.Windows.Forms.Label lblRule4;
        private System.Windows.Forms.Label lblRule3;
        private System.Windows.Forms.Button btnRule4;
        private System.Windows.Forms.Button btnRule3;
        private System.Windows.Forms.Label lblSelect;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
    }
}

