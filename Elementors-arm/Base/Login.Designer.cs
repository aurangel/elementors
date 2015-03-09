namespace Elementors_arm.Base
{
    partial class Login
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Login));
            this.ribbon = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.ribbonStatusBar = new DevExpress.XtraBars.Ribbon.RibbonStatusBar();
            this.Hello = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.LoginEdit = new DevExpress.XtraEditors.TextEdit();
            this.PasswordEdit = new DevExpress.XtraEditors.TextEdit();
            this.Enter = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.ribbon)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.LoginEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.PasswordEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Enter)).BeginInit();
            this.SuspendLayout();
            // 
            // ribbon
            // 
            this.ribbon.ExpandCollapseItem.Id = 0;
            this.ribbon.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.ribbon.ExpandCollapseItem});
            this.ribbon.Location = new System.Drawing.Point(0, 0);
            this.ribbon.MaxItemId = 1;
            this.ribbon.Name = "ribbon";
            this.ribbon.ShowApplicationButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbon.ShowCategoryInCaption = false;
            this.ribbon.ShowExpandCollapseButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbon.ShowFullScreenButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbon.ShowPageHeadersMode = DevExpress.XtraBars.Ribbon.ShowPageHeadersMode.Hide;
            this.ribbon.ShowToolbarCustomizeItem = false;
            this.ribbon.Size = new System.Drawing.Size(337, 32);
            this.ribbon.StatusBar = this.ribbonStatusBar;
            this.ribbon.Toolbar.ShowCustomizeItem = false;
            // 
            // ribbonStatusBar
            // 
            this.ribbonStatusBar.Location = new System.Drawing.Point(0, 232);
            this.ribbonStatusBar.Name = "ribbonStatusBar";
            this.ribbonStatusBar.Ribbon = this.ribbon;
            this.ribbonStatusBar.Size = new System.Drawing.Size(337, 23);
            // 
            // Hello
            // 
            this.Hello.AutoSize = true;
            this.Hello.Font = new System.Drawing.Font("Tahoma", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.Hello.Location = new System.Drawing.Point(12, 48);
            this.Hello.Name = "Hello";
            this.Hello.Size = new System.Drawing.Size(136, 18);
            this.Hello.TabIndex = 2;
            this.Hello.Text = "Имя пользователя";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Tahoma", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(12, 111);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 18);
            this.label1.TabIndex = 3;
            this.label1.Text = "Пароль";
            // 
            // LoginEdit
            // 
            this.LoginEdit.EditValue = "MAIN";
            this.LoginEdit.Location = new System.Drawing.Point(15, 74);
            this.LoginEdit.MenuManager = this.ribbon;
            this.LoginEdit.Name = "LoginEdit";
            this.LoginEdit.Properties.Appearance.Font = new System.Drawing.Font("Tahoma", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.LoginEdit.Properties.Appearance.Options.UseFont = true;
            this.LoginEdit.Size = new System.Drawing.Size(309, 24);
            this.LoginEdit.TabIndex = 4;
            // 
            // PasswordEdit
            // 
            this.PasswordEdit.Location = new System.Drawing.Point(15, 137);
            this.PasswordEdit.MenuManager = this.ribbon;
            this.PasswordEdit.Name = "PasswordEdit";
            this.PasswordEdit.Properties.Appearance.Font = new System.Drawing.Font("Tahoma", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.PasswordEdit.Properties.Appearance.Options.UseFont = true;
            this.PasswordEdit.Properties.Mask.IgnoreMaskBlank = false;
            this.PasswordEdit.Properties.PasswordChar = '*';
            this.PasswordEdit.Size = new System.Drawing.Size(309, 24);
            this.PasswordEdit.TabIndex = 5;
            this.PasswordEdit.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Login_KeyPress);
            // 
            // Enter
            // 
            this.Enter.Cursor = System.Windows.Forms.Cursors.Hand;
            this.Enter.Image = ((System.Drawing.Image)(resources.GetObject("Enter.Image")));
            this.Enter.Location = new System.Drawing.Point(255, 167);
            this.Enter.Name = "Enter";
            this.Enter.Size = new System.Drawing.Size(63, 59);
            this.Enter.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.Enter.TabIndex = 11;
            this.Enter.TabStop = false;
            this.Enter.Click += new System.EventHandler(this.pictureBox1_Click);
            // 
            // Login
            // 
            this.ActiveGlowColor = System.Drawing.Color.Blue;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(337, 255);
            this.Controls.Add(this.Enter);
            this.Controls.Add(this.PasswordEdit);
            this.Controls.Add(this.LoginEdit);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Hello);
            this.Controls.Add(this.ribbonStatusBar);
            this.Controls.Add(this.ribbon);
            this.FormBorderEffect = DevExpress.XtraEditors.FormBorderEffect.Glow;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.InactiveGlowColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.MaximizeBox = false;
            this.Name = "Login";
            this.Ribbon = this.ribbon;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.StatusBar = this.ribbonStatusBar;
            this.Text = "Авторизация";
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Login_KeyPress);
            ((System.ComponentModel.ISupportInitialize)(this.ribbon)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.LoginEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.PasswordEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Enter)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevExpress.XtraBars.Ribbon.RibbonControl ribbon;
        private DevExpress.XtraBars.Ribbon.RibbonStatusBar ribbonStatusBar;
        private System.Windows.Forms.Label Hello;
        private System.Windows.Forms.Label label1;
        private DevExpress.XtraEditors.TextEdit LoginEdit;
        private DevExpress.XtraEditors.TextEdit PasswordEdit;
        private System.Windows.Forms.PictureBox Enter;
    }
}