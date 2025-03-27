page 50104 "CheckList Page_OP"
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
                    ApplicationArea = ALL;
                    Editable = FieldEditable;
                    Style = Strong;
                    Editable = false;
                    trigger OnValidate()
                    begin
                        UpdateLineEditability();
                    end;
                }
                field("Answer"; Rec.Answer)
                {
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = ALL;
                    Editable = FieldEditable;
                    Visible = false;
                }
                field("Sale/Purchase"; Rec."Sale/Purchase")
                {
                    ApplicationArea = ALL;
                    Caption = 'Posting Type';
                    Editable = FieldEditable;
                }
            }
        }
    }
}
