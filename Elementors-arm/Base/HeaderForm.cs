/*

Copyright © 2015 Vlasenko Roman

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful, 
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, see <http://www.gnu.org/licenses>.

    Additional permission under GNU GPL version 3 section 7

    If you modify this Program, or any covered work, by linking or
    combining it with DevExpress (or a modified version of 
    that library), containing parts covered by the terms of Developer Express Inc., 
    the licensors of this Program grant you
    additional permission to convey the resulting work.

*/

using System;
using System.Windows.Forms;
using System.IO;
using System.Data;

using DevExpress.XtraBars.Localization;
using DevExpress.XtraBars.Helpers;
using DevExpress.XtraNavBar;
using DevExpress.XtraPrinting.Localization;
using DevExpress.XtraReports.UI;
using DevExpress.XtraSplashScreen;
using System.Threading;

namespace Elementors_arm
{
    public partial class HeaderForm : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        DBOperator dbOperator;
        public HeaderForm()
        {
            InitializeComponent();
        }

        private void HeaderForm_Load(object sender, EventArgs e)
        {
            try
            {
                dbOperator = DBOperator.Instance;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                this.Close();
            }

            SkinHelper.InitSkinGallery(scgiLookAndFeel, true);
            cxLookAndFeelController.LookAndFeel.SkinName = Properties.Settings.Default.Skin;
        }

        public class MyBarLocalizer : BarLocalizer
        {
            public override string GetLocalizedString(BarString id)
            {
                if (id == BarString.SkinCaptions)
                {
                    string defaultSkinCaptions = base.GetLocalizedString(id);
                    string newSkinCaptions = defaultSkinCaptions.Replace("|DevExpress Style|", "|My Favorite Skin|");
                    return newSkinCaptions;
                }
                return base.GetLocalizedString(id);
            }
        }

        private void dxCloseAll_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            tabbedView.Controller.CloseAll();
        }

        private void dxColorMixer_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            DevExpress.XtraEditors.ColorWheel.ColorWheelForm f = new DevExpress.XtraEditors.ColorWheel.ColorWheelForm();
            f.ShowDialog(this);
        }

        private void nbMain_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            string link = nbMain.PressedLink.Caption;

            if (e.Link.Group.Caption == "Документы")
                return;

            if (e.Link.Caption == "Контроль за уч. процессом" || e.Link.Caption == "Справочник рейтинга")
                return;

            ChildForm tableForm = new ChildForm(link)
            {
                MdiParent = this,
                Text = link
            };
            tableForm.Show();
        }

        private void biControl_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            ChildForm tableForm = new ChildForm(biControl.Tag.ToString())
            {
                MdiParent = this,
                Text = "Контроль за уч. процессом"
            };
            tableForm.Show();
        }

        private void biDirectoryRating_LinkPressed(object sender, NavBarLinkEventArgs e)
        {

            ChildForm tableForm = new ChildForm(biDirectoryRating.Tag.ToString())
            {
                MdiParent = this,
                Text = "Справочник рейтинга"
            };
            tableForm.Show();
        }

        private void dxFullscreen_CheckedChanged(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (dxFullscreen.Checked) {
                nbMain.OptionsNavPane.NavPaneState = NavPaneState.Collapsed;
                ribbon.Minimized = true;
                this.WindowState = FormWindowState.Maximized;
            }

            else {
                nbMain.OptionsNavPane.NavPaneState = NavPaneState.Expanded;
                ribbon.Minimized = false;
                this.WindowState = FormWindowState.Normal;
            }
        }

        private void scgiLookAndFeel_GalleryItemClick_1(object sender, DevExpress.XtraBars.Ribbon.GalleryItemClickEventArgs e)
        {
            Properties.Settings.Default.Skin = e.Item.Caption;
            Properties.Settings.Default.Save();
        }

        private void dxReportDesigner_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);

            for (int i = 1; i <= 100; i++)
            {
                SplashScreenManager.Default.SetWaitFormDescription(i.ToString() + "%");
                Thread.Sleep(30);
            }

            Reports.ReportDesignerForm ReportForm = new Reports.ReportDesignerForm();

            SplashScreenManager.CloseForm(false);

            ReportForm.Show();
        }

        private void dxFloat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            tabbedView.Controller.Float(tabbedView.ActiveDocument);
        }

        private void dxSearchName_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            SearchForm searchForm = new SearchForm();
            searchForm.Show();
        }

        private void tabbedView_DocumentActivated(object sender, DevExpress.XtraBars.Docking2010.Views.DocumentEventArgs e)
        {
            Data.ValueOfDoc = e.Document.Caption;
        }

        private void docTitulList_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);
            Data.ValueOfReport = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "TitulList.repx");

            XtraReport report = new XtraReport();
            ReportPrintTool printTool = new ReportPrintTool(report);

            ((XtraReport)printTool.Report).LoadLayout(Data.ValueOfReport);
            SplashScreenManager.CloseForm(false);
            printTool.ShowPreviewDialog();
        }

        private void docRatingMark_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);
            Data.ValueOfReport = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "RatingMark.repx");

            XtraReport report = new XtraReport();
            ReportPrintTool printTool = new ReportPrintTool(report);

            ((XtraReport)printTool.Report).LoadLayout(Data.ValueOfReport);
            SplashScreenManager.CloseForm(false);
            printTool.ShowPreviewDialog();
        }

        private void docBookAllTeachers_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);
            Data.ValueOfReport = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "AllPrepods.repx");

            XtraReport report = new XtraReport();
            ReportPrintTool printTool = new ReportPrintTool(report);

            ((XtraReport)printTool.Report).LoadLayout(Data.ValueOfReport);
            SplashScreenManager.CloseForm(false);
            printTool.ShowPreviewDialog();
        }

        private void docBookRating_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);
            Data.ValueOfReport = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "AllRating.repx");

            XtraReport report = new XtraReport();
            ReportPrintTool printTool = new ReportPrintTool(report);

            ((XtraReport)printTool.Report).LoadLayout(Data.ValueOfReport);
            SplashScreenManager.CloseForm(false);
            printTool.ShowPreviewDialog();
        }

        private void dxKnowledgeBase_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string PathToHelp = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "help/obzor_prilozheniya.html");

            DevExpress.XtraEditors.XtraMessageBox.Show("Если вы используете браузер Internet Explorer, то вам необходимо настроить показ сценариев. " +
            "(Либо воспользуйтесь CHM справкой)" + "\r\n\r\n" +
            "Меню > Свойства обозревателя > Дополнительно" + Environment.NewLine +
            "Флажок: Разрешать запуск активного содержимого файлов на моем компьютере", "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Question);

            System.Diagnostics.Process.Start(PathToHelp);
        }

        private void dxSource_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            System.Diagnostics.Process.Start("https://github.com/Exoticness/Elementors-arm");
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string PathToHelp = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "SQLite/sqlite.exe");
            System.Diagnostics.Process.Start(PathToHelp);
        }

        private void dxAbout_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Base.AboutForm about = new Base.AboutForm();
            about.Show();
        }

        private void bbKnowledgeBase_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string PathToHelp = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "help/obzor_prilozheniya.html");
            System.Diagnostics.Process.Start(PathToHelp);
        }

        private void bbAbout_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Base.AboutForm about = new Base.AboutForm();
            about.Show();
        }

        private void backstageViewButtonItem1_ItemClick(object sender, DevExpress.XtraBars.Ribbon.BackstageViewItemEventArgs e)
        {
            string PathToHelp = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "help/Help.chm");
            Help.ShowHelp(this, PathToHelp);
        }

    }
}

