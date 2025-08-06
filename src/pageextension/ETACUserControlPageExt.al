pageextension 50150 ETACUserControlPageExt extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("All Customers/Vendors"; Rec."All Customers/Vendors")
            {
                ApplicationArea = All;
                ToolTip = 'Select this option to apply the user setup to all customers and vendors.';
            }
            field(Customers; Rec.Customers)
            {
                ApplicationArea = All;
                ToolTip = 'Select a specific customer for this user setup.';
            }
            field(Vendors; Rec.Vendors)
            {
                ApplicationArea = All;
                ToolTip = 'Select a specific vendor for this user setup.';
            }

        }
    }
    actions
    {
        addlast(Processing)
        {
            action(SelectedCustomers)
            {
                ApplicationArea = All;
                Caption = 'Select Customers';
                Image = Action;
                trigger OnAction()
                var
                    CustomerPage: Page "Customer List";
                    Lrec_Customer: Record Customer;
                    Lcdu_UserIDCodeunit: Codeunit SelectUserID;
                begin
                    Lcdu_UserIDCodeunit.ProcessUserSelectedCustomers(Rec."User ID");
                    CustomerPage.SetTableView(Lrec_Customer);
                    CustomerPage.RunModal();

                end;
            }
            action(SelectedVendors)
            {
                ApplicationArea = All;
                Caption = 'Select Vendors';
                Image = Action;
                trigger OnAction()
                var
                    VendorPage: Page "Vendor List";
                    Lrec_Vendor: Record Vendor;
                begin
                    VendorPage.SetTableView(Lrec_Vendor);
                    VendorPage.RunModal();
                end;
            }
        }
    }
}
