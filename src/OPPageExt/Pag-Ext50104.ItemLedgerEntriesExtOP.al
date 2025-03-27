pageextension 50104 "Item Ledger Entries_Ext_OP" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Item No.")
        {
            field("Lot Changed"; Rec."Lot Changed")
            {
                ApplicationArea = All;
            }
        }
    }
}
