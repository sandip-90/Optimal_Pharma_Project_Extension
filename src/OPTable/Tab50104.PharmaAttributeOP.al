table 50104 "Pharma Attribute_OP"
{
    Caption = 'Pharma Attribute';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Pharma Attribute"; Code[20])
        {
            Caption = 'Pharma Attribute';
            trigger OnLookup()
            var
                DimensionValueOP: Record "Dimension Value";
                InventorySetupOP: Record "Inventory Setup";

            begin
                InventorySetupOP.Get();
                DimensionValueOP.SetRange("Dimension Code", InventorySetupOP."Pharma Attribute Dimension");
                IF Page.RunModal(Page::"Dimension Values", DimensionValueOP) = Action::LookupOK then
                    "Pharma Attribute" := DimensionValueOP.Code;
            end;
        }
        field(2; "Pharma Attribute Value"; Text[100])
        {
            Caption = 'Pharma Attribute Value';
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }

    }
    keys
    {
        key(PK; "Pharma Attribute", "Item No.")
        {
            Clustered = true;
        }
    }
}
