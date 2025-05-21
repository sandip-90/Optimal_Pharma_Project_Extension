table 50104 "Pharma Attribute_OP"
{
    Caption = 'Pharma Attribute';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Pharma Attribute"; Code[20])
        {
            DataClassification = ToBeClassified;
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
            DataClassification = ToBeClassified;
        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(4; "Description Creation"; Boolean)
        {
            DataClassification = ToBeClassified;
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
