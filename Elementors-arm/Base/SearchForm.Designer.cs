namespace Elementors_arm
{
    partial class SearchForm
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SearchForm));
            this.repositoryItemTextEdit3 = new DevExpress.XtraEditors.Repository.RepositoryItemTextEdit();
            this.ribbon = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.applicationMenu = new DevExpress.XtraBars.Ribbon.ApplicationMenu(this.components);
            this.dxHome = new DevExpress.XtraBars.BarButtonItem();
            this.barAndDockingController = new DevExpress.XtraBars.BarAndDockingController(this.components);
            this.dxReset = new DevExpress.XtraBars.BarButtonItem();
            this.dxSearch = new DevExpress.XtraBars.BarButtonItem();
            this.dxName = new DevExpress.XtraBars.BarEditItem();
            this.dxTemplate = new DevExpress.XtraBars.BarEditItem();
            this.repositoryItemComboBox1 = new DevExpress.XtraEditors.Repository.RepositoryItemComboBox();
            this.tabHome = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.dxbActions = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.repositoryItemTextEdit1 = new DevExpress.XtraEditors.Repository.RepositoryItemTextEdit();
            this.ribbonStatusBar = new DevExpress.XtraBars.Ribbon.RibbonStatusBar();
            this.barEditItem1 = new DevExpress.XtraBars.BarEditItem();
            this.gridControl = new DevExpress.XtraGrid.GridControl();
            this.gridView = new DevExpress.XtraGrid.Views.Grid.GridView();
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemTextEdit3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbon)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.applicationMenu)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.barAndDockingController)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemComboBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemTextEdit1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).BeginInit();
            this.SuspendLayout();
            // 
            // repositoryItemTextEdit3
            // 
            this.repositoryItemTextEdit3.AutoHeight = false;
            this.repositoryItemTextEdit3.LookAndFeel.SkinMaskColor = System.Drawing.Color.Transparent;
            this.repositoryItemTextEdit3.LookAndFeel.SkinMaskColor2 = System.Drawing.Color.Transparent;
            this.repositoryItemTextEdit3.LookAndFeel.SkinName = "Visual Studio 2013 Light";
            this.repositoryItemTextEdit3.LookAndFeel.TouchUIMode = DevExpress.LookAndFeel.TouchUIMode.False;
            this.repositoryItemTextEdit3.Name = "repositoryItemTextEdit3";
            // 
            // ribbon
            // 
            this.ribbon.ApplicationButtonDropDownControl = this.applicationMenu;
            this.ribbon.ApplicationIcon = ((System.Drawing.Bitmap)(resources.GetObject("ribbon.ApplicationIcon")));
            this.ribbon.Controller = this.barAndDockingController;
            this.ribbon.ExpandCollapseItem.Id = 0;
            this.ribbon.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.ribbon.ExpandCollapseItem,
            this.dxHome,
            this.dxReset,
            this.dxSearch,
            this.dxName,
            this.dxTemplate});
            this.ribbon.Location = new System.Drawing.Point(0, 0);
            this.ribbon.MaxItemId = 13;
            this.ribbon.Name = "ribbon";
            this.ribbon.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.tabHome});
            this.ribbon.RepositoryItems.AddRange(new DevExpress.XtraEditors.Repository.RepositoryItem[] {
            this.repositoryItemTextEdit1,
            this.repositoryItemComboBox1});
            this.ribbon.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonControlStyle.Office2007;
            this.ribbon.ShowApplicationButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbon.ShowToolbarCustomizeItem = false;
            this.ribbon.Size = new System.Drawing.Size(690, 149);
            this.ribbon.StatusBar = this.ribbonStatusBar;
            this.ribbon.Toolbar.ShowCustomizeItem = false;
            // 
            // applicationMenu
            // 
            this.applicationMenu.AllowRibbonQATMenu = false;
            this.applicationMenu.ItemLinks.Add(this.dxHome);
            this.applicationMenu.Name = "applicationMenu";
            this.applicationMenu.Ribbon = this.ribbon;
            // 
            // dxHome
            // 
            this.dxHome.Caption = "Назад";
            this.dxHome.Glyph = ((System.Drawing.Image)(resources.GetObject("dxHome.Glyph")));
            this.dxHome.Id = 1;
            this.dxHome.ItemInMenuAppearance.Hovered.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.dxHome.ItemInMenuAppearance.Hovered.Options.UseFont = true;
            this.dxHome.ItemInMenuAppearance.Normal.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.dxHome.ItemInMenuAppearance.Normal.Options.UseFont = true;
            this.dxHome.ItemInMenuAppearance.Pressed.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.dxHome.ItemInMenuAppearance.Pressed.Options.UseFont = true;
            this.dxHome.Name = "dxHome";
            this.dxHome.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.dxHome.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.dxHome_ItemClick);
            // 
            // barAndDockingController
            // 
            this.barAndDockingController.AppearancesRibbon.Item.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.barAndDockingController.AppearancesRibbon.Item.Options.UseFont = true;
            this.barAndDockingController.AppearancesRibbon.ItemDisabled.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.barAndDockingController.AppearancesRibbon.ItemDisabled.Options.UseFont = true;
            this.barAndDockingController.AppearancesRibbon.ItemHovered.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.barAndDockingController.AppearancesRibbon.ItemHovered.Options.UseFont = true;
            this.barAndDockingController.AppearancesRibbon.ItemPressed.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.barAndDockingController.AppearancesRibbon.ItemPressed.Options.UseFont = true;
            this.barAndDockingController.PropertiesBar.AllowLinkLighting = false;
            this.barAndDockingController.PropertiesBar.DefaultGlyphSize = new System.Drawing.Size(16, 16);
            this.barAndDockingController.PropertiesBar.DefaultLargeGlyphSize = new System.Drawing.Size(32, 32);
            // 
            // dxReset
            // 
            this.dxReset.Caption = "Сброс";
            this.dxReset.Glyph = ((System.Drawing.Image)(resources.GetObject("dxReset.Glyph")));
            this.dxReset.Id = 3;
            this.dxReset.Name = "dxReset";
            this.dxReset.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.dxReset.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.dxReset_ItemClick);
            // 
            // dxSearch
            // 
            this.dxSearch.Caption = "Поиск";
            this.dxSearch.Enabled = false;
            this.dxSearch.Glyph = ((System.Drawing.Image)(resources.GetObject("dxSearch.Glyph")));
            this.dxSearch.Id = 4;
            this.dxSearch.Name = "dxSearch";
            this.dxSearch.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.dxSearch.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.dxSearch_ItemClick);
            // 
            // dxName
            // 
            this.dxName.Edit = null;
            this.dxName.Id = 12;
            this.dxName.Name = "dxName";
            // 
            // dxTemplate
            // 
            this.dxTemplate.Caption = "Шаблон   ";
            this.dxTemplate.Edit = this.repositoryItemComboBox1;
            this.dxTemplate.EditHeight = 25;
            this.dxTemplate.Glyph = ((System.Drawing.Image)(resources.GetObject("dxTemplate.Glyph")));
            this.dxTemplate.Id = 11;
            this.dxTemplate.ItemAppearance.Hovered.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.dxTemplate.ItemAppearance.Hovered.Options.UseFont = true;
            this.dxTemplate.ItemAppearance.Normal.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.dxTemplate.ItemAppearance.Normal.Options.UseFont = true;
            this.dxTemplate.ItemAppearance.Pressed.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.dxTemplate.ItemAppearance.Pressed.Options.UseFont = true;
            this.dxTemplate.ItemInMenuAppearance.Normal.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.dxTemplate.ItemInMenuAppearance.Normal.Options.UseFont = true;
            this.dxTemplate.LargeGlyph = ((System.Drawing.Image)(resources.GetObject("dxTemplate.LargeGlyph")));
            this.dxTemplate.Name = "dxTemplate";
            this.dxTemplate.Width = 188;
            this.dxTemplate.EditValueChanged += new System.EventHandler(this.dxTemplate_EditValueChanged);
            // 
            // repositoryItemComboBox1
            // 
            this.repositoryItemComboBox1.Appearance.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.repositoryItemComboBox1.Appearance.Options.UseFont = true;
            this.repositoryItemComboBox1.AutoHeight = false;
            this.repositoryItemComboBox1.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.repositoryItemComboBox1.Items.AddRange(new object[] {
            "Давыдова А.А.",
            "Демина Г.Н.",
            "Дроздова Л.И.",
            "Клюйкова Н.В.",
            "Самойлова Е.В.",
            "Семенова Е.В."});
            this.repositoryItemComboBox1.Name = "repositoryItemComboBox1";
            // 
            // tabHome
            // 
            this.tabHome.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.dxbActions});
            this.tabHome.Name = "tabHome";
            this.tabHome.Text = "Главная";
            // 
            // dxbActions
            // 
            this.dxbActions.ItemLinks.Add(this.dxHome, true);
            this.dxbActions.ItemLinks.Add(this.dxReset, true);
            this.dxbActions.ItemLinks.Add(this.dxSearch, true);
            this.dxbActions.ItemLinks.Add(this.dxName);
            this.dxbActions.ItemLinks.Add(this.dxTemplate);
            this.dxbActions.Name = "dxbActions";
            this.dxbActions.ShowCaptionButton = false;
            this.dxbActions.Text = "Действия";
            // 
            // repositoryItemTextEdit1
            // 
            this.repositoryItemTextEdit1.Appearance.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.repositoryItemTextEdit1.Appearance.Options.UseFont = true;
            this.repositoryItemTextEdit1.AppearanceFocused.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.repositoryItemTextEdit1.AppearanceFocused.Options.UseFont = true;
            this.repositoryItemTextEdit1.AutoHeight = false;
            this.repositoryItemTextEdit1.Name = "repositoryItemTextEdit1";
            // 
            // ribbonStatusBar
            // 
            this.ribbonStatusBar.Location = new System.Drawing.Point(0, 488);
            this.ribbonStatusBar.Name = "ribbonStatusBar";
            this.ribbonStatusBar.Ribbon = this.ribbon;
            this.ribbonStatusBar.Size = new System.Drawing.Size(690, 23);
            // 
            // barEditItem1
            // 
            this.barEditItem1.Caption = "barEditItem1";
            this.barEditItem1.Edit = this.repositoryItemTextEdit3;
            this.barEditItem1.Id = 6;
            this.barEditItem1.Name = "barEditItem1";
            // 
            // gridControl
            // 
            this.gridControl.Cursor = System.Windows.Forms.Cursors.Default;
            this.gridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridControl.EmbeddedNavigator.AccessibleRole = System.Windows.Forms.AccessibleRole.ButtonDropDownGrid;
            this.gridControl.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.gridControl.Location = new System.Drawing.Point(0, 149);
            this.gridControl.MainView = this.gridView;
            this.gridControl.MenuManager = this.ribbon;
            this.gridControl.MinimumSize = new System.Drawing.Size(400, 200);
            this.gridControl.Name = "gridControl";
            this.gridControl.Size = new System.Drawing.Size(690, 339);
            this.gridControl.TabIndex = 8;
            this.gridControl.UseEmbeddedNavigator = true;
            this.gridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView});
            // 
            // gridView
            // 
            this.gridView.Appearance.ColumnFilterButton.Font = new System.Drawing.Font("Tahoma", 10F);
            this.gridView.Appearance.ColumnFilterButton.Options.UseFont = true;
            this.gridView.Appearance.FilterPanel.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.gridView.Appearance.FilterPanel.Options.UseFont = true;
            this.gridView.Appearance.FocusedCell.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.gridView.Appearance.FocusedCell.Options.UseFont = true;
            this.gridView.Appearance.HeaderPanel.Font = new System.Drawing.Font("Tahoma", 10F);
            this.gridView.Appearance.HeaderPanel.Options.UseFont = true;
            this.gridView.Appearance.Preview.Font = new System.Drawing.Font("Tahoma", 10F);
            this.gridView.Appearance.Preview.Options.UseFont = true;
            this.gridView.Appearance.Row.Font = new System.Drawing.Font("Tahoma", 10F);
            this.gridView.Appearance.Row.Options.UseFont = true;
            this.gridView.Appearance.RowSeparator.Font = new System.Drawing.Font("Tahoma", 9.25F);
            this.gridView.Appearance.RowSeparator.Options.UseFont = true;
            this.gridView.Appearance.TopNewRow.Font = new System.Drawing.Font("Tahoma", 9F);
            this.gridView.Appearance.TopNewRow.Options.UseFont = true;
            this.gridView.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.gridView.FocusRectStyle = DevExpress.XtraGrid.Views.Grid.DrawFocusRectStyle.None;
            this.gridView.GridControl = this.gridControl;
            this.gridView.IndicatorWidth = 30;
            this.gridView.Name = "gridView";
            this.gridView.OptionsBehavior.AllowDeleteRows = DevExpress.Utils.DefaultBoolean.True;
            this.gridView.OptionsBehavior.EditingMode = DevExpress.XtraGrid.Views.Grid.GridEditingMode.EditFormInplaceHideCurrentRow;
            this.gridView.OptionsDetail.AllowOnlyOneMasterRowExpanded = true;
            this.gridView.OptionsFind.AlwaysVisible = true;
            this.gridView.OptionsFind.FindDelay = 400;
            this.gridView.OptionsFind.SearchInPreview = true;
            this.gridView.OptionsSelection.EnableAppearanceFocusedCell = false;
            this.gridView.OptionsSelection.InvertSelection = true;
            this.gridView.OptionsSelection.MultiSelect = true;
            this.gridView.OptionsView.ColumnAutoWidth = false;
            this.gridView.OptionsView.ColumnHeaderAutoHeight = DevExpress.Utils.DefaultBoolean.True;
            this.gridView.OptionsView.RowAutoHeight = true;
            // 
            // SearchForm
            // 
            this.ActiveGlowColor = System.Drawing.Color.Blue;
            this.AllowFormGlass = DevExpress.Utils.DefaultBoolean.False;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(690, 511);
            this.Controls.Add(this.gridControl);
            this.Controls.Add(this.ribbonStatusBar);
            this.Controls.Add(this.ribbon);
            this.FormBorderEffect = DevExpress.XtraEditors.FormBorderEffect.Glow;
            this.InactiveGlowColor = System.Drawing.Color.Red;
            this.MaximizeBox = false;
            this.MinimumSize = new System.Drawing.Size(604, 400);
            this.Name = "SearchForm";
            this.Ribbon = this.ribbon;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.StatusBar = this.ribbonStatusBar;
            this.Text = "Поиск по инициалам";
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemTextEdit3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbon)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.applicationMenu)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.barAndDockingController)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemComboBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.repositoryItemTextEdit1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevExpress.XtraBars.Ribbon.RibbonControl ribbon;
        private DevExpress.XtraBars.Ribbon.RibbonPage tabHome;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup dxbActions;
        private DevExpress.XtraBars.BarButtonItem dxHome;
        private DevExpress.XtraBars.BarButtonItem dxReset;
        private DevExpress.XtraBars.BarButtonItem dxSearch;
        private DevExpress.XtraBars.BarEditItem dxName;
        private DevExpress.XtraEditors.Repository.RepositoryItemTextEdit repositoryItemTextEdit1;
        private DevExpress.XtraBars.BarEditItem barEditItem1;
        private DevExpress.XtraBars.BarEditItem dxTemplate;
        private DevExpress.XtraEditors.Repository.RepositoryItemComboBox repositoryItemComboBox1;
        private DevExpress.XtraEditors.Repository.RepositoryItemTextEdit repositoryItemTextEdit3;
        private DevExpress.XtraBars.Ribbon.ApplicationMenu applicationMenu;
        private DevExpress.XtraBars.BarAndDockingController barAndDockingController;
        private DevExpress.XtraGrid.GridControl gridControl;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView;
        private DevExpress.XtraBars.Ribbon.RibbonStatusBar ribbonStatusBar;
    }
}