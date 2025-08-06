page 50151 ETACSelectedVendorsPage
{
    ApplicationArea = All;
    Caption = 'Selected Vendors';
    PageType = List;
    SourceTable = ETACSelectedVendorsTable;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.', Comment = '%';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.', Comment = '%';
                }
                field("Select Vendor"; Rec."Select Vendor")
                {
                    ToolTip = 'Specifies the value of the Select Vendor field.', Comment = '%';
                }
            }
        }
    }
}
