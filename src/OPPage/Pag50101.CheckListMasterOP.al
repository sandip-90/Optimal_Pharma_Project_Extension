page 50103 "Check List Master_OP"
{
    ApplicationArea = All;
    Caption = 'Checklist Master OP';
    PageType = List;
    SourceTable = "CheckList Master_OP";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("SN"; Rec."SN")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the SN field.';
                }
                field(Questionaire; Rec.Questionaire)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Questionaire field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = all;
                    Style = Strong;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Block field.';
                }
                field("Sale/Purchase"; Rec."Sale/Purchase")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Posting Type field.';
                }
            }
        }
    }
}
