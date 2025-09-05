pageextension 50103 "Dimension Value" extends "Dimension Values"
{
    layout
    {
        addafter(Blocked)
        {
            field("Description Creation"; Rec."Description Creation")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description Creation field.';
            }
        }
    }
}
