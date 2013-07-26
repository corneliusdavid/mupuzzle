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
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.btnRule4 = new System.Windows.Forms.Button();
            this.btnRule3 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnPrev
            // 
            this.btnPrev.Enabled = false;
            this.btnPrev.Location = new System.Drawing.Point(128, 12);
            this.btnPrev.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnPrev.Name = "btnPrev";
            this.btnPrev.Size = new System.Drawing.Size(75, 23);
            this.btnPrev.TabIndex = 0;
            this.btnPrev.Text = "Prev";
            this.btnPrev.UseVisualStyleBackColor = true;
            this.btnPrev.Click += new System.EventHandler(this.btnPrev_Click);
            // 
            // btnOK
            // 
            this.btnOK.Enabled = false;
            this.btnOK.Location = new System.Drawing.Point(209, 12);
            this.btnOK.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(75, 23);
            this.btnOK.TabIndex = 1;
            this.btnOK.Text = "OK";
            this.btnOK.UseVisualStyleBackColor = true;
            // 
            // btnCancel
            // 
            this.btnCancel.Enabled = false;
            this.btnCancel.Location = new System.Drawing.Point(291, 12);
            this.btnCancel.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 2;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            // 
            // btnNext
            // 
            this.btnNext.Enabled = false;
            this.btnNext.Location = new System.Drawing.Point(371, 12);
            this.btnNext.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(75, 23);
            this.btnNext.TabIndex = 3;
            this.btnNext.Text = "Next";
            this.btnNext.UseVisualStyleBackColor = true;
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 38);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Current String:";
            // 
            // MuStr
            // 
            this.MuStr.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.MuStr.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MuStr.Location = new System.Drawing.Point(12, 55);
            this.MuStr.Name = "MuStr";
            this.MuStr.Size = new System.Drawing.Size(709, 69);
            this.MuStr.TabIndex = 5;
            this.MuStr.Text = "MMUIIUIUIUU";
            // 
            // lbMuStrs
            // 
            this.lbMuStrs.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.lbMuStrs.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbMuStrs.FormattingEnabled = true;
            this.lbMuStrs.ItemHeight = 16;
            this.lbMuStrs.Location = new System.Drawing.Point(0, 235);
            this.lbMuStrs.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.lbMuStrs.Name = "lbMuStrs";
            this.lbMuStrs.Size = new System.Drawing.Size(733, 260);
            this.lbMuStrs.TabIndex = 6;
            // 
            // btnRule1
            // 
            this.btnRule1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRule1.Location = new System.Drawing.Point(247, 179);
            this.btnRule1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnRule1.Name = "btnRule1";
            this.btnRule1.Size = new System.Drawing.Size(75, 23);
            this.btnRule1.TabIndex = 7;
            this.btnRule1.Text = "Rule 1";
            this.btnRule1.UseVisualStyleBackColor = true;
            this.btnRule1.Click += new System.EventHandler(this.btnRule1_Click);
            // 
            // btnRule2
            // 
            this.btnRule2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRule2.Location = new System.Drawing.Point(247, 208);
            this.btnRule2.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnRule2.Name = "btnRule2";
            this.btnRule2.Size = new System.Drawing.Size(75, 23);
            this.btnRule2.TabIndex = 8;
            this.btnRule2.Text = "Rule 2";
            this.btnRule2.UseVisualStyleBackColor = true;
            this.btnRule2.Click += new System.EventHandler(this.btnRule2_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(80, 181);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(161, 17);
            this.label2.TabIndex = 9;
            this.label2.Text = "Add \"U\" if last letter is \"I\"";
            this.label2.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(12, 211);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(229, 17);
            this.label3.TabIndex = 10;
            this.label3.Text = "Add everything after \"M\" to the end";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopRight;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(409, 211);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(189, 17);
            this.label4.TabIndex = 14;
            this.label4.Text = "Delete an occurance of \"UU\"";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(409, 185);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(135, 17);
            this.label5.TabIndex = 13;
            this.label5.Text = "Replace \"III\" with \"U\"";
            // 
            // btnRule4
            // 
            this.btnRule4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRule4.Location = new System.Drawing.Point(328, 208);
            this.btnRule4.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnRule4.Name = "btnRule4";
            this.btnRule4.Size = new System.Drawing.Size(75, 23);
            this.btnRule4.TabIndex = 12;
            this.btnRule4.Text = "Rule 4";
            this.btnRule4.UseVisualStyleBackColor = true;
            this.btnRule4.Click += new System.EventHandler(this.btnRule4_Click);
            // 
            // btnRule3
            // 
            this.btnRule3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRule3.Location = new System.Drawing.Point(328, 179);
            this.btnRule3.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnRule3.Name = "btnRule3";
            this.btnRule3.Size = new System.Drawing.Size(75, 23);
            this.btnRule3.TabIndex = 11;
            this.btnRule3.Text = "Rule 3";
            this.btnRule3.UseVisualStyleBackColor = true;
            this.btnRule3.Click += new System.EventHandler(this.btnRule3_Click);
            // 
            // frmMUPuzzle
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(733, 495);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.btnRule4);
            this.Controls.Add(this.btnRule3);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
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
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnRule4;
        private System.Windows.Forms.Button btnRule3;
    }
}

