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
            //Заполнение контейнера галереи скинов
            cxLookAndFeelController.LookAndFeel.SkinName = Properties.Settings.Default.Skin;
            //Установка активного скина исходя из значения строковой переменной
        }

        public class MyBarLocalizer : BarLocalizer
        {
            public override string GetLocalizedString(BarString id)
                //Функция возвращает в переменную id массив скинов
            {
                if (id == BarString.SkinCaptions)
                {
                    string defaultSkinCaptions = base.GetLocalizedString(id);
                    //В строковую переменную помещаются локализированные имена скинов
                    string newSkinCaptions = defaultSkinCaptions.Replace("|DevExpress Style|", "|My Favorite Skin|");
                    return newSkinCaptions;
                    //Возвращаемое значение содержит новую строку, в которой все вхождения заданной строки заменены
                }
                return base.GetLocalizedString(id);
            }
        }

        private void dxCloseAll_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            tabbedView.Controller.CloseAll();
            //Закрывает все текущие открытые документы
        }

        private void dxColorMixer_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            DevExpress.XtraEditors.ColorWheel.ColorWheelForm f = new DevExpress.XtraEditors.ColorWheel.ColorWheelForm();
            f.ShowDialog(this);
            //Инициализация цветового колеса
        }

        private void nbMain_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            string link = nbMain.PressedLink.Caption;
            //Строка с именем кликнутой ссылки

            if (e.Link.Group.Caption == "Документы")
                return;
            //При данном значении выполняется прерывание и передача управления вызывающему методу

            if (e.Link.Caption == "Контроль за уч. процессом" || e.Link.Caption == "Справочник рейтинга")
                return;

            ChildForm tableForm = new ChildForm(link) /* В форму передается аргумент с именем кликнутой ссылки, 
                                                                                в данном случае только таблиц */
            {
                MdiParent = this,
                Text = link
                //Установка новой инициализируемой форме заголовка из переменной link
            };
            tableForm.Show();
        }

        private void biControl_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            ChildForm tableForm = new ChildForm(biControl.Tag.ToString())
            { //Передача верного значения ссылки в качестве аргумента
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
            if (dxFullscreen.Checked) { //Проверяет значение, указывающее, является ли элемент нажатым
                nbMain.OptionsNavPane.NavPaneState = NavPaneState.Collapsed;
                //Скрытие навигационной панели
                ribbon.Minimized = true;
                //Минимизирование шапки программы
                this.WindowState = FormWindowState.Maximized;
                //Максимизирует окно формы
            }

            else {
                nbMain.OptionsNavPane.NavPaneState = NavPaneState.Expanded;
                //Возвращает навигационную панель в исходное состояние
                ribbon.Minimized = false;
                //Минимизирование неактивно
                this.WindowState = FormWindowState.Normal;
                //Окно с размерами по умолчанию
            }
        }

        private void scgiLookAndFeel_GalleryItemClick_1(object sender, DevExpress.XtraBars.Ribbon.GalleryItemClickEventArgs e)
        {
            Properties.Settings.Default.Skin = e.Item.Caption;
            //Программное свойство Skin заполняется именем последнего выбранного скина
            Properties.Settings.Default.Save();
            //Сохранение текущего значения свойства 
        }

        private void dxReportDesigner_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);
            //Создает и отображает форму ожидания и центрирует его относительно другой формы
            for (int i = 1; i <= 100; i++)
            {
                SplashScreenManager.Default.SetWaitFormDescription(i.ToString() + "%");
                //Устанавливает описание, которое меняется каждые 30 мс от 1 до 100
                Thread.Sleep(30);
            }

            Reports.ReportDesignerForm ReportForm = new Reports.ReportDesignerForm();

            SplashScreenManager.CloseForm(false);
            //Закрывает форму ожидания
            ReportForm.Show();
            //Отображает дизайнер отчетов
        }

        private void dxFloat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            tabbedView.Controller.Float(tabbedView.ActiveDocument);
            //Устанавливает активную таблицу в плавающее состояние
        }

        private void dxSearchName_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            SearchForm searchForm = new SearchForm();
            searchForm.Show();
            //Отображение формы поиска
        }

        private void tabbedView_DocumentActivated(object sender, DevExpress.XtraBars.Docking2010.Views.DocumentEventArgs e)
        {
            Data.ValueOfDoc = e.Document.Caption;
            //Каждая смена имени активной таблицы вносится в переменную
        }

        private static void DocumentLoading(string name) {
            Data.ValueOfReport = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, name);
            //Объединение пути к отчету и базового каталога в одну строку
            XtraReport report = new XtraReport();
            //Инициализирует новый экземпляр класса XtraReport с настройками по умолчанию
            ReportPrintTool printTool = new ReportPrintTool(report);
            //Инициализирует новый экземпляр класса ReportPrintTool с указанным отчетом

            ((XtraReport)printTool.Report).LoadLayout(Data.ValueOfReport);
            //Загрузка макета отчета из файла в формате REPX
        }

        private void docTitulList_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);
            //Создает и отображает форму ожидания и центрирует его относительно другой формы
            DocumentLoading("TitulList.repx");
            //Вызов функции и передача аргумента с фалом отчета
            SplashScreenManager.CloseForm(false);
            //Закрывает форму ожидания
        }

        private void docRatingMark_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);
            DocumentLoading("RatingMark.repx");
            SplashScreenManager.CloseForm(false);
        }

        private void docBookAllTeachers_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);
            DocumentLoading("AllPrepods.repx");
            SplashScreenManager.CloseForm(false);
        }

        private void docBookRating_LinkPressed(object sender, NavBarLinkEventArgs e)
        {
            SplashScreenManager.ShowForm(this, typeof(Base.Waiting), true, true, false);
            DocumentLoading("AllRating.repx");
            SplashScreenManager.CloseForm(false);
        }

        private void dxKnowledgeBase_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string PathToHelp = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "help/obzor_prilozheniya.html");
            //Объединение пути к справке и базового каталога в одну строку
            DevExpress.XtraEditors.XtraMessageBox.Show("Если вы используете браузер Internet Explorer, то вам необходимо настроить показ сценариев. " +
            "(Либо воспользуйтесь CHM справкой)" + "\r\n\r\n" +
            "Меню > Свойства обозревателя > Дополнительно" + Environment.NewLine +
            "Флажок: Разрешать запуск активного содержимого файлов на моем компьютере", "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Question);
            //Отображение диалогового окна с предупреждением для пользователей IE
            System.Diagnostics.Process.Start(PathToHelp);
            //Запуск ресурса процесса путем указания имени документа и связывание ресурса с новым компонентом
        }

        private void dxSource_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            System.Diagnostics.Process.Start("https://github.com/Exoticness/Elementors-arm");
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string PathToHelp = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "SQLite/sqlite.exe");
            //Комбинирование строки до редактора базы SQLite
            System.Diagnostics.Process.Start(PathToHelp);
            //Запуск ресурса
        }

        private void dxAbout_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Base.AboutForm about = new Base.AboutForm();
            about.Show();
            //Отображение формы о программе
        }

        private void bbKnowledgeBase_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string PathToHelp = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "help/obzor_prilozheniya.html");
            //Комбинирование строки до справки без предупреждения
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
            //Комбинирование строки до автономной справки
            Help.ShowHelp(this, PathToHelp);
            //Отображение содержимого справки
        }

    }
}

