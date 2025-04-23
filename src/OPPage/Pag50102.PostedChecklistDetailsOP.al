page 50102 "Posted Checklist Details_OP"
{
    ApplicationArea = All;
    Caption = 'Posted Checklist Details OP';
    PageType = List;
    SourceTable = "Posted Checklist Details_OP";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = All;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                }
                field(Questionaire; Rec.Questionaire)
                {
                    ApplicationArea = All;
                }
                field(Answer; Rec.Answer)
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
