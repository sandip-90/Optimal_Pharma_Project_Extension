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
                    Editable = FieldEditable;
                    ApplicationArea = ALL;
                }
                field(Questionaire; Rec.Questionaire)
                {
                    Editable = FieldEditable;
                    ApplicationArea = ALL;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = ALL;
                    Editable = FieldEditable;
                    Style = Strong;
                }
                field("Answer"; Rec.Answer)
                {
                    Editable = FieldEditable;
                    ApplicationArea = ALL;
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

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Clear(FieldEditable);
        if Rec.Type = Rec.Type::Heading then
            FieldEditable := false
        else
            FieldEditable := true;

    end;

    trigger OnAfterGetRecord()
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
