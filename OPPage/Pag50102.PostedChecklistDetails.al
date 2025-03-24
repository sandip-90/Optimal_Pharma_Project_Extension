page 50102 "Posted Checklist Details"
{
    ApplicationArea = All;
    Caption = 'Posted Checklist Details';
    PageType = List;
    SourceTable = "Posted Checklist Details";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Order No"; Rec."Order No")
                {
                }
                field("Document No"; Rec."Document No")
                {
                }
                field(Questionaire; Rec.Questionaire)
                {
                }
                field(Answer; Rec.Answer)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Type"; Rec."Type")
                {
                }
            }
        }
    }
}
