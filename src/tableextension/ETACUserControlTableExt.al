tableextension 50150 ETACUserControlTableExt extends "User Setup"
{
    fields
    {
        field(50150; "All Customers/Vendors"; Boolean)
        {
            Caption = 'All Customers/Vendors';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Rec."All Customers/Vendors" = true then begin
                    Rec.Customers := '';
                    Rec.Vendors := '';
                end;
            end;

        }
        field(50151; Customers; Code[20])
        {
            Caption = 'Customers';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            trigger OnValidate()
            begin
                if Rec."All Customers/Vendors" = true then begin
                    Message('Please uncheck ''All Customers/Vendors'' to select a specific Customer.');
                    Rec.Customers := '';
                end else
                    Rec.Customers := Rec.Customers;
            end;
        }
        field(50152; Vendors; Code[20])
        {
            Caption = 'Vendors';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
            trigger OnValidate()
            begin
                if Rec."All Customers/Vendors" = true then begin
                    Message('Please uncheck ''All Customers/Vendors'' to select a specific Vendor.');
                    Rec.Vendors := '';
                end else
                    Rec.Vendors := Rec.Vendors;
            end;
        }
    }
}
