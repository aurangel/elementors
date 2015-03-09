using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace Elementors_arm.Base
{
    public partial class Login : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public Login()
        {
            InitializeComponent();
        }

        private void LoginIn()
        {
            if (LoginEdit.Text == "MAIN" && PasswordEdit.Text == "predsedatel")
            {
                HeaderForm Auth = new HeaderForm();
                Auth.Show();
                this.Hide();
            }

            else
            {
                DevExpress.XtraEditors.XtraMessageBox.Show("Не удается войти." + Environment.NewLine +
                "Пожалуйста, проверьте правильность написания логина и пароля. ",
                "Ошибка авторизации", MessageBoxButtons.OK, MessageBoxIcon.Question);
            }

            return;
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            LoginIn();
        }

        private void Login_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)13)
            {
                LoginIn();
            }
        }
    }
}