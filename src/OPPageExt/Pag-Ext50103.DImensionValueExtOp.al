pageextension 50103 "DImension Value Ext_Op" extends "Dimension Values"
{
    layout
    {
        addbefore(Blocked)
        {
            field("Sequence No."; Rec."Sequence No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sequence No. field.';
            }
        }
    }
}
