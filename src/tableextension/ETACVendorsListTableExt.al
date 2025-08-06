tableextension 50151 ETACVendorsListTableExt extends Vendor
{
    fields
    {
        field(50150; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
        }
        field(50151; "Select Vendor"; Boolean)
        {
            Caption = 'Select Vendor';
            DataClassification = ToBeClassified;
        }
    }
}
