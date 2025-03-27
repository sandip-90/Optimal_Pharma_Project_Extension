page 50104 "Checklist page_Ext_OP"
{
    ApplicationArea = All;
    Caption = 'Checklist page';
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
                    Style = Strong;
                    Editable = IsLineEditable;
                }
                field(Questionaire; Rec.Questionaire)
                {
                    Editable = IsLineEditable;
                }
                field("Type"; Rec."Type")
                {
                    Style = Strong;
                    Editable = false;
                    trigger OnValidate()
                    begin
                        UpdateLineEditability();
                    end;
                }
                field("Answer"; Rec.Answer)
                {
                    Editable = IsLineEditable;
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

    trigger OnAfterGetRecord()
    begin
        UpdateLineEditability();
    end;

    var
        IsLineEditable: Boolean;

    local procedure UpdateLineEditability()
    begin
        IsLineEditable := Rec."Type" <> Rec."Type"::Heading;
    end;
}