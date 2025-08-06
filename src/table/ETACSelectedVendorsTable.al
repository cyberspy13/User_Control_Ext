table 50151 ETACSelectedVendorsTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Vendor No."; Code[20])
        {
            TableRelation = Vendor."No.";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Lrec_Vendor: Record ETACSelectedVendorsTable;
            begin
                Lrec_Vendor.reset;
                Lrec_Vendor.SetRange("Vendor No.", Rec."Vendor No.");
                if Lrec_Vendor.FindFirst() then
                    Error('Vendor No. %1 already exists.', Rec."Vendor No.");
            end;
        }
        field(3; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
        }
        field(5; "Select Vendor"; Boolean)
        {
            Caption = 'Select Vendor';
            DataClassification = CustomerContent;
        }
        field(6; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.", "Vendor No.", "User ID")
        {
            Clustered = true;
        }
        // key(FK; "User ID")
        // {
        //     Clustered = false;
        // }
    }
    trigger OnInsert()
    begin
        TestField("No.");
        TestField("Vendor No.");
    end;
}