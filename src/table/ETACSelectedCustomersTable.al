table 50150 ETACSelectedCustomersTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Lrec_Customer: Record ETACSelectedCustomersTable;
            begin
                Lrec_Customer.reset;
                Lrec_Customer.SetRange("Customer No.", Rec."Customer No.");
                if Lrec_Customer.FindFirst() then
                    Error('Customer No. %1 already exists.', Rec."Customer No.");
            end;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
        }
        field(5; "Select Customer"; Boolean)
        {
            Caption = 'Select Customer';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.", "Customer No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        TestField("No.");
        TestField("Customer No.");
    end;
}