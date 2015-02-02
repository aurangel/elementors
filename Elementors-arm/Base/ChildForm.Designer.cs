namespace Elementors_arm
{
    partial class ChildForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ChildForm));
            this.ribbon = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.barInfoItem = new DevExpress.XtraBars.BarButtonItem();
            this.gridControl = new DevExpress.XtraGrid.GridControl();
            this.gridView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.popupMenu = new DevExpress.XtraBars.PopupMenu(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.ribbon)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.popupMenu)).BeginInit();
            this.SuspendLayout();
            // 
            // ribbon
            // 
            this.ribbon.ExpandCollapseItem.Id = 0;
            this.ribbon.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.ribbon.ExpandCollapseItem,
            this.barInfoItem});
            this.ribbon.Location = new System.Drawing.Point(0, 0);
            this.ribbon.MaxItemId = 3;
            this.ribbon.Name = "ribbon";
            this.ribbon.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonControlStyle.TabletOfficeEx;
            this.ribbon.ShowApplicationButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbon.ShowCategoryInCaption = false;
            this.ribbon.ShowExpandCollapseButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbon.ShowFullScreenButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbon.ShowPageHeadersMode = DevExpress.XtraBars.Ribbon.ShowPageHeadersMode.Hide;
            this.ribbon.Size = new System.Drawing.Size(692, 32);
            // 
            // barInfoItem
            // 
            this.barInfoItem.Caption = "Информация о...";
            this.barInfoItem.Glyph = ((System.Drawing.Image)(resources.GetObject("barInfoItem.Glyph")));
            this.barInfoItem.Id = 2;
            this.barInfoItem.LargeGlyph = ((System.Drawing.Image)(resources.GetObject("barInfoItem.LargeGlyph")));
            this.barInfoItem.Name = "barInfoItem";
            this.barInfoItem.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.barInfoItem_ItemClick);
            // 
            // gridControl
            // 
            this.gridControl.Cursor = System.Windows.Forms.Cursors.Default;
            this.gridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridControl.EmbeddedNavigator.AccessibleRole = System.Windows.Forms.AccessibleRole.ButtonDropDownGrid;
            this.gridControl.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.gridControl.Location = new System.Drawing.Point(0, 32);
            this.gridControl.MainView = this.gridView;
            this.gridControl.MenuManager = this.ribbon;
            this.gridControl.MinimumSize = new System.Drawing.Size(400, 200);
            this.gridControl.Name = "gridControl";
            this.gridControl.Size = new System.Drawing.Size(692, 364);
            this.gridControl.TabIndex = 7;
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
            this.gridView.OptionsBehavior.AllowAddRows = DevExpress.Utils.DefaultBoolean.True;
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
            this.gridView.RowClick += new DevExpress.XtraGrid.Views.Grid.RowClickEventHandler(this.gridView_RowClick);
            // 
            // popupMenu
            // 
            this.popupMenu.ItemLinks.Add(this.barInfoItem);
            this.popupMenu.Name = "popupMenu";
            this.popupMenu.Ribbon = this.ribbon;
            // 
            // ChildForm
            // 
            this.ActiveGlowColor = System.Drawing.Color.Blue;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(692, 396);
            this.Controls.Add(this.gridControl);
            this.Controls.Add(this.ribbon);
            this.FormBorderEffect = DevExpress.XtraEditors.FormBorderEffect.Shadow;
            this.MaximizeBox = false;
            this.Name = "ChildForm";
            this.Ribbon = this.ribbon;
            this.RibbonVisibility = DevExpress.XtraBars.Ribbon.RibbonVisibility.Hidden;
            this.ShowIcon = false;
            ((System.ComponentModel.ISupportInitialize)(this.ribbon)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.popupMenu)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevExpress.XtraBars.Ribbon.RibbonControl ribbon;
        private DevExpress.XtraGrid.GridControl gridControl;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView;
        private DevExpress.XtraBars.PopupMenu popupMenu;
        private DevExpress.XtraBars.BarButtonItem barInfoItem;

    }
}