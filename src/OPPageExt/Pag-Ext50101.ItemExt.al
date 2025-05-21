pageextension 50101 "Item Card Ext_OP" extends "Item Card"
{
    layout
    {
        modify("ItemPicture")
        {
            Visible = false;
        }
        addbefore(ItemPicture)
        {
            part(ItemPictures; "Item Pictures_OP")
            {
                ApplicationArea = All;
                SubPageLink = "Item No." = FIELD("No.");
            }
        }
        modify("Search Description")
        {
            Caption = 'Display Name';
        }
        addafter(Description)
        {
            field("Search Description1"; Rec."Search Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies a search description that you use to find the item in lists.';
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
                PromotedCategory = New;
                ToolTip = 'Executes the Update Item Description action.';
                trigger OnAction()
                var
                    ItemAttributeValueSelectionOP: Record "Item Attribute Value Selection";
                    PharmaAttributeOP: Record "Pharma Attribute_OP";
                    PharmaAttributeValue: Text;
                    Text001: Label 'Item Description has been updated.';
                begin
                    Clear(Rec.Description);
                    Clear(PharmaAttributeValue);
                    PharmaAttributeOP.Reset();
                    PharmaAttributeOP.SetRange(PharmaAttributeOP."Item No.", Rec."No.");
                    if PharmaAttributeOP.FindSet() then begin
                        repeat
                            if PharmaAttributeValue <> '' then
                                PharmaAttributeValue += ' ' + PharmaAttributeOP."Pharma Attribute Value"
                            else
                                PharmaAttributeValue := PharmaAttributeOP."Pharma Attribute Value";
                        until PharmaAttributeOP.Next() = 0;
                        Rec.Description := PharmaAttributeValue;
                        rec.Modify();
                        Message('%1', Text001);
                    end;
                    CurrPage.Update();
                end;
            }
            action("Pharma Attributes")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = New;
                ToolTip = 'Executes the Pharma Attributes action.';
                trigger OnAction()
                var
                    PharmaAttributeOP: Record "Pharma Attribute_OP";
                begin
                    PharmaAttributeOP.SetRange("Item No.", Rec."No.");
                    Page.RunModal(Page::"Pharma Attributes", PharmaAttributeOP);
                end;
            }
        }
    }
}
