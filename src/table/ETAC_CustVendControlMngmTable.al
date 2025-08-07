table 50150 ETAC_CustVendControlMngmTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(15; "Source Table"; Enum ControlSource)
        {
            Caption = 'Source Table';
            DataClassification = ToBeClassified;
        }
        field(4; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Grec_CustVend.reset;
                Grec_CustVend.SetRange("Customer No.", Rec."Customer No.");
                Grec_CustVend.SetRange("User ID", Rec."User ID");
                if Grec_CustVend.FindFirst() then
                    Error('Customer No. %1 already exists for this Customer or already selected on All Customer Option.', Rec."Customer No.");

                if Rec."Select Customer" = true then begin
                    Error('Customer No. %1 cannot be selected as it is already marked for selection.', Rec."Customer No.");
                end;
            end;
        }
        field(5; "Vendor No."; Code[20])
        {
            TableRelation = Vendor."No.";
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Grec_CustVend.reset;
                Grec_CustVend.SetRange("Vendor No.", Rec."Vendor No.");
                Grec_CustVend.SetRange("User ID", Rec."User ID");
                if Grec_CustVend.FindFirst() then
                    Error('Vendor No. %1 already exists for this Vendor or already selected on All Vendor Option.', Rec."Vendor No.");

                if Rec."Select Vendor" = true then begin
                    Error('Vendor No. %1 cannot be selected as it is already marked for selection.', Rec."Vendor No.");
                end;
            end;
        }
        field(6; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
        }
        field(7; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
        }
        field(8; "Select Customer"; Boolean)
        {
            Caption = 'Select All Customer';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if (Rec."Select Customer" = true) and (Rec."Customer No." <> '') then begin
                    Rec."Customer No." := '';
                    Rec."Customer Name" := '';
                end
                else if Rec."Select Customer" = true then begin
                    Grec_CustVend.reset;
                    Grec_CustVend.SetRange("User ID", Rec."User ID");
                    Grec_CustVend.SetRange("Select Customer", true);
                    if Grec_CustVend.FindFirst() then
                        Error('Select All Customers option already exists for this Customer.', Rec."Customer No.");
                end;
            end;
        }
        field(9; "Select Vendor"; Boolean)
        {
            Caption = 'Select All Vendors';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if (Rec."Select Vendor" = true) and (Rec."Vendor No." <> '') then begin
                    Rec."Vendor No." := '';
                    Rec."Vendor Name" := '';
                end
                else if Rec."Select Vendor" = true then begin
                    Grec_CustVend.reset;
                    Grec_CustVend.SetRange("User ID", Rec."User ID");
                    if Grec_CustVend.FindFirst() then
                        Error('Select All Vendors option already exists for this Vendor.', Rec."Vendor No.");
                end;
            end;
        }
        field(10; "Source No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Source No.';
        }
        field(11; "View Record"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'View Record';
        }
        field(12; "Edit Record"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Edit Record';
        }
        field(13; "Delete Record"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Delete Record';
        }
        field(14; "Insert Record"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Insert Record';
        }
    }

    keys
    {
        key(PK; "No.", "Source Table", "Source No.")
        {
            Clustered = true;
        }
        key(FK; "Customer No.", "Vendor No.", "User ID")
        {
            Clustered = false;
        }
    }
    trigger OnInsert()
    begin
        TestField("No.");
        //TestField("User ID");
    end;

    var
        Grec_CustVend: Record ETAC_CustVendControlMngmTable;
}