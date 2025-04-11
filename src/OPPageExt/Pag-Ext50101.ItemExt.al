pageextension 50101 "Item Card Ext_OP" extends "Item Card"
{
    layout
    {
        modify("Search Description")
        {
            Caption = 'Display Name';
        }
        addafter(Description)
        {
            field("Search Description1"; Rec."Search Description")
            {
                ApplicationArea = All;
            }
        }

    }
    actions
    {
        addafter(ApplyTemplate)
        {
            action("Update Item Description")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    ItemAttributeValueSelectionOP: Record "Item Attribute Value Selection";
                begin
                    ItemAttributeValueSelectionOP.Reset();
                    ItemAttributeValueSelectionOP.SetRange("Inherited-From Key Value", rec."No.");
                    if ItemAttributeValueSelectionOP.FindSet() then
                        repeat
                            Rec."Search Description" += ItemAttributeValueSelectionOP."Attribute Name" + ' ' + ItemAttributeValueSelectionOP.Value;
                            rec.Modify();
                        until ItemAttributeValueSelectionOP.Next() = 0;
                    CurrPage.Update();
                end;
            }
        }
    }
}
