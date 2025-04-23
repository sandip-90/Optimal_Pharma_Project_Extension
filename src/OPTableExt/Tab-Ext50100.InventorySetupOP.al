tableextension 50100 "Inventory Setup OP" extends "Inventory Setup"
{

    fields
    {
        field(50100; "Pharma Attribute Dimension"; Code[20])
        {
            Caption = 'Pharma Attribute Dimension';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
    }
}
