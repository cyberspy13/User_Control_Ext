codeunit 50150 SelectUserID
{
    procedure ProcessUserSelectedCustomers(UserID: Code[50])
    
    begin
        Lint_CustomerUserID := UserID;
    end;

    procedure AssignUserIDToCustomer(CustomerNo: Code[20])
    CustomerRecord: Record Customer;
    begin
        Lint_CustomerNo := CustomerNo;
        CustomerRecord.Get(Lint_CustomerNo);
        CustomerRecord."User ID" := Lint_CustomerUserID;
        CustomerRecord.Modify();
    end;

    var
        Lint_CustomerUserID: Code[50];
        Lint_CustomerNo: Code[20];


}
