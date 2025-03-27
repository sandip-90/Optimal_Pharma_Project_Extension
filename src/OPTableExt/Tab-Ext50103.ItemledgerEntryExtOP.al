tableextension 50103 "Item ledger Entry_Ext_OP" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "Lot Changed"; Boolean)
        {
            Caption = 'Lot Changed';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
