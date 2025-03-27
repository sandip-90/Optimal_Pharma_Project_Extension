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
                }
                field(Questionaire; Rec.Questionaire)
                {
                    ApplicationArea = all;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = all;
                    Style = Strong;
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = all;
                }
                field("Sale/Purchase"; Rec."Sale/Purchase")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

}
