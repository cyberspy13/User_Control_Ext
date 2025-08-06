pageextension 50152 ETACCustomersListPage extends "Customer List"
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
            field("Select Customer"; Rec."Select Customer")
            {
                ApplicationArea = All;
                ToolTip = 'Select this customer as a customer for the user.';
            }
        }
    }
    actions
    {
        addlast(navigation)
        {
            action(SelectedCustomers)
            {
                ApplicationArea = All;
                Caption = 'Select Customer';
                Image = Add;
                trigger OnAction()
                var
                    UserIDCodeunit: Codeunit SelectUserID;
                begin
                    UserIDCodeunit.AssignUserIDToCustomer(Rec."No.");
                end;
            }
        }
    }
}
