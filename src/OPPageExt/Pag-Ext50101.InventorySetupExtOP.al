pageextension 50101 "Inventory Setup_Ext_OP" extends "Inventory Setup"
{
    layout
    {
        addafter(Numbering)
        {
            group("Pharma.Ex")
            {
                field("Lot Change Template"; Rec."Lot Change Template")
                {
                    ApplicationArea = All;
                }
                field("Lot Change Batch"; Rec."Lot Change Batch")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}