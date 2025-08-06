tableextension 50152 ETACCustomersListTableExt extends Customer
{
    fields
    {
        field(50150; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
        }
        field(50151; "Select Customer"; Boolean)
        {
            Caption = 'Select Customer';
            DataClassification = ToBeClassified;
        }
    }
}
