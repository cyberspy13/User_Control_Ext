pageextension 50153 ETACCustomerCardPage extends "Customer Card"
{
    trigger OnOpenPage()
    var
        Lrec_UserIDCustomerList: Record ETAC_CustVendControlMngmTable;
        Lrec_Customer: Record Customer;
    begin
        Lrec_UserIDCustomerList.SetRange("User ID", UserId);
        Lrec_UserIDCustomerList.FindFirst();
        if Lrec_UserIDCustomerList."Select Customer" = true then
            CurrPage.Editable(true)
        else begin
            Lrec_UserIDCustomerList.SetRange("Customer No.", Rec."No.");
            if not Lrec_UserIDCustomerList.FindFirst() then begin
                //Error('You are not allowed to modify the Customer Card for this User ID.');
                CurrPage.Editable(false);
            end;
        end;

        // Lrec_UserIDCustomerList.SetRange("User ID", UserId);
        // if Lrec_UserIDCustomerList.FindSet() then begin
        //     repeat
        //         if Lrec_UserIDCustomerList."Select Customer" then begin
        //             CurrPage.Editable(true);
        //             exit;
        //         end;
        //     until Lrec_UserIDCustomerList.Next() = 0;
        // end else begin
        //     Lrec_UserIDCustomerList.SetRange("Customer No.", Rec."No.");
        //     if not Lrec_UserIDCustomerList.FindFirst() then begin
        //         //Error('You are not allowed to modify the Customer Card for this User ID.');
        //         CurrPage.Editable(false);
        //     end;
        // end;
    end;
}
