tableextension 50101 "Inventory Setup Ext_OP" extends "Inventory Setup"
{
    fields
    {
        field(50100; "Lot Change Template"; Code[20])
        {
            Caption = 'Lot Change Template';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Template".Name;
        }
        field(50101; "Lot Change Batch"; Code[20])
        {
            Caption = 'Lot Change Batch';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Batch".Name;
        }
    }
}
