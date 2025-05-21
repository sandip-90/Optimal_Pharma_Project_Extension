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
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Questionaire; Rec.Questionaire)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Questionaire field.';
                }
                field(Answer; Rec.Answer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Answer field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }
}
