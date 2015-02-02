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
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using System.IO;
using System.Data;
using System.Drawing;

using DevExpress.XtraBars.Localization;
using DevExpress.XtraBars.Helpers;
using DevExpress.XtraNavBar;
using DevExpress.LookAndFeel;

using DevExpress.XtraReports.UI;	

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
                dbOperator = DBOperator.Instance; /* Создаем экземпляр объекта */
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                this.Close();
            }

            SkinHelper.InitSkinGallery(scgiLookAndFeel, true);
            cxLookAndFeelController.LookAndFeel.SkinName = Properties.Settings.Default.Skin;
        }

        internal class PicturePanel : Panel
        {
            public PicturePanel()
            {
                this.DoubleBuffered = true;
                this.AutoScroll = true;
                this.BackgroundImageLayout = ImageLayout.Center;
            }
            public override Image BackgroundImage
            {
                get { return base.BackgroundImage; }
                set
                {
                    base.BackgroundImage = value;
                    if (value != null) this.AutoScrollMinSize = value.Size;
                }
            }
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
            Reports.ReportDesignerForm ReportForm = new Reports.ReportDesignerForm();
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

        public void LoadReport()
        {
            Reports.PreviewReport preview = new Reports.PreviewReport();

            XtraReport report = new XtraReport();

            preview.documentViewerRibbon.DocumentViewer.DocumentSource = report;
            report.CreateDocument();
            report.LoadLayout(Data.ValueOfReport);

            preview.Show();
        }

        private void docTitulList_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            Data.ValueOfReport = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "TitulList.repx");
            LoadReport();
        }

        private void docRatingMark_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            Data.ValueOfReport = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "RatingMark.repx");
            LoadReport();
        }

        private void docBookAllTeachers_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            Data.ValueOfReport = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "AllPrepods.repx");
            LoadReport();
        }

        private void docBookRating_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            Data.ValueOfReport = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "AllRating.repx");
            LoadReport();
        }

    }
}

