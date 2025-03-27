pageextension 50102 "Item Reclass Journal_EXT_OP" extends "Item Reclass. Journal"
{
    layout
    {
        addafter("Item No.")
        {
            field("Lot Change"; Rec."Lot Changed")
            {
                ApplicationArea = All;
            }
        }
    }
}
