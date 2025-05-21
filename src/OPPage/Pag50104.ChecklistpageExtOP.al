page 50104 "CheckList Page_OP"
{
    ApplicationArea = All;
    Caption = 'Checklist Page OP';
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
                    ApplicationArea = ALL;
                    Editable = FieldEditable;
                    ToolTip = 'Specifies the value of the SN field.';
                }
                field(Questionaire; Rec.Questionaire)
                {
                    ApplicationArea = ALL;
                    Editable = FieldEditable;
                    ToolTip = 'Specifies the value of the Questionaire field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = ALL;
                    Editable = FieldEditable;
                    Style = Strong;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Answer"; Rec.Answer)
                {
                    ApplicationArea = ALL;
                    Editable = FieldEditable;
                    ToolTip = 'Specifies the value of the Answer field.';
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = ALL;
                    Editable = FieldEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Block field.';
                }
                field("Sale/Purchase"; Rec."Sale/Purchase")
                {
                    ApplicationArea = ALL;
                    Caption = 'Posting Type';
                    Editable = FieldEditable;
                    ToolTip = 'Specifies the value of the Posting Type field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        UpdateLineEditability();
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        UpdateLineEditability();
    end;

    local procedure UpdateLineEditability()
    var
        myInt: Integer;
    begin
        Clear(FieldEditable);
        if Rec.Type = Rec.Type::Heading then
            FieldEditable := false
        else
            FieldEditable := true;
    end;

    var
        FieldEditable: Boolean;
}
