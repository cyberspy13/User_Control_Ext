page 50150 ETACSelectedCustomersPage
{
    ApplicationArea = All;
    Caption = 'C&V Control Management';
    PageType = List;
    SourceTable = ETAC_CustVendControlMngmTable;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ShowMandatory = true;
                }

                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    Caption = 'User ID';
                    ShowMandatory = true;
                }
                field("Source Table";Rec."Source Table")
                {
                    
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor No.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Name';
                }
                field("Select Customer"; Rec."Select Customer")
                {
                    ApplicationArea = All;
                    Caption = 'Select All Customer';
                }
                field("Select Vendor"; Rec."Select Vendor")
                {
                    ApplicationArea = All;
                    Caption = 'Select All Vendor';
                }
            }
        }
    }
}
