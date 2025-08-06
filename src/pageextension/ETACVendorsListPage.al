pageextension 50151 ETACVendorsListPage extends "Vendor List"
{
    layout
    {
        addlast(Control1)
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = All;
                Caption = 'User ID';
            }
            field("Select Vendor"; Rec."Select Vendor")
            {
                ApplicationArea = All;
                ToolTip = 'Select this vendor as a vendor for the user.';
            }
        }
    }
}
