page 50104 "Checklist page_Ext_OP"
{
    ApplicationArea = All;
    Caption = 'Checklist page_Ext_OP';
    PageType = List;
    SourceTable = "CheckList Master_OP";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SN; Rec.SN)
                {
                }
                field(Questionaire; Rec.Questionaire)
                {
                }
                field("Type"; Rec."Type")
                {
                    Style = Strong;
                }
                field("Answer"; Rec.Answer)
                {
                }
                field(Block; Rec.Block)
                {
                    Visible = false;
                }
                field("Sale/Purchase"; Rec."Sale/Purchase")
                {
                    Caption = 'Posting Type';
                }
            }
        }
    }
}
