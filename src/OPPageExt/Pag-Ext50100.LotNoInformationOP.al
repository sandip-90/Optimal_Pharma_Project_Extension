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
                trigger OnAction()
                var
                begin

                end;
            }
        }
    }
}
