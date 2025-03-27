pageextension 50105 SalesOrder_EXT_OP extends "Sales Order"
{
    actions
    {
        addafter("Archive Document")
        {
            action(CheckList)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = CheckList;
                Caption = 'Checklist';
                RunObject = Page "Checklist Page_OP";
            }
        }
    }
}
