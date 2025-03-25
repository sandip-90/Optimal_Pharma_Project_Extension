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
                }
                field(Questionaire; Rec.Questionaire)
                {
                }
                field("Type"; Rec."Type")
                {
                }
                field(Block; Rec.Block)
                {
                }
                field("Sale/Purchase"; Rec."Sale/Purchase")
                {
                }
            }
        }
    }
}
