pageextension 50151 ETACVendorsListPage extends "Vendor Card"
{
    trigger OnOpenPage()
    var
        Lrec_UserIDVendorList: Record ETAC_CustVendControlMngmTable;
    begin
        Lrec_UserIDVendorList.SetRange("User ID", UserId);
        Lrec_UserIDVendorList.SetRange("Vendor No.", Rec."No.");
        if not Lrec_UserIDVendorList.FindFirst() then begin
            CurrPage.Editable(false);
        end
        else
            CurrPage.Editable(true);
    end;
}
