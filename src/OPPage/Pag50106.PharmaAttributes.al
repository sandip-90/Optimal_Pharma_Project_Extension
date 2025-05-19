page 50106 "Pharma Attributes"
{
    ApplicationArea = All;
    Caption = 'Pharma Attributes';
    PageType = List;
    SourceTable = "Pharma Attribute_OP";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Pharma Attribute"; Rec."Pharma Attribute")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pharma Attribute field.';
                }
                field("Pharma Attribute Value"; Rec."Pharma Attribute Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pharma Attribute Value field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
            }
        }
    }
}
