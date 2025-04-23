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
                trigger OnAction()
                var
                    ItemAttributeValueSelectionOP: Record "Item Attribute Value Selection";
                    PharmaAttributeOP: Record "Pharma Attribute_OP";
                begin
                    PharmaAttributeOP.Reset();
                    PharmaAttributeOP.SetRange(PharmaAttributeOP."Item No.", rec."No.");
                    if PharmaAttributeOP.FindFirst() then begin
                        Rec."Search Description" := PharmaAttributeOP."Pharma Attribute" + ' ' + PharmaAttributeOP."Pharma Attribute Value";
                        rec.Modify();
                    end;
                    CurrPage.Update();
                end;
            }
        }
    }
}
