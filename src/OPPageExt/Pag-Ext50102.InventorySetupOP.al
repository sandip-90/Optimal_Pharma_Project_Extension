pageextension 50102 "Inventory Setup_OP" extends "Inventory Setup"
{

    layout
    {
        addafter("Package Nos.")
        {
            group("Pharma Details")
            {
                Caption = 'Pharma Details';
                field("Pharma attribute Dimension"; Rec."Pharma Attribute Dimension")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pharma attribute Dimension field.';
                }
            }
        }

    }
}
