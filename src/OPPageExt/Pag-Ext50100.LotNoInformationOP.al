pageextension 50103 "Lot No. Information_OP" extends "Lot No. Information Card"
{
    layout
    {

    }
    actions
    {
        addafter("&Lot No.")
        {
            action("Changes Batch No.")
            {
                ApplicationArea=All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Change;
                Caption = 'Changes Batch No.';
                trigger OnAction()
                var
                begin
                 Report.RunModal(Report::"Lot Change Report_OP",true,false);
                end;
            }
        }
    }
}
