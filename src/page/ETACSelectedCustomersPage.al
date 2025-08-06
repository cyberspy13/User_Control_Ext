page 50150 ETACSelectedCustomersPage
{
    ApplicationArea = All;
    Caption = 'Selected Customers';
    PageType = List;
    SourceTable = ETACSelectedCustomersTable;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No"; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Select Customer"; Rec."Select Customer")
                {
                    ToolTip = 'Specifies whether the customer is selected.', Comment = '%';
                }

            }
        }
    }
}
