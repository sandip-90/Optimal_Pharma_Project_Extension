page 50101 "Check List Master"
{
    ApplicationArea = All;
    Caption = 'Checklist Master';
    PageType = List;
    SourceTable = "CheckList Master";
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
