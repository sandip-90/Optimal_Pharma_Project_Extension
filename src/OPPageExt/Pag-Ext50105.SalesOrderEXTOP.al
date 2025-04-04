pageextension 50105 "SalesOrder EXT_OP" extends "Sales Order"
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
                trigger OnAction()
                var
                    CheckListMasterOP: Record "CheckList Master_OP";
                begin
                    CheckListMasterOP.SetRange("Sale/Purchase", CheckListMasterOP."Sale/Purchase"::Sale);
                    Page.RunModal(Page::"CheckList Page_OP", CheckListMasterOP);
                end;
            }
        }
    }
}
