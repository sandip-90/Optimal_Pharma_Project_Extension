pageextension 50102 "ItemCardExt_OP" extends "Item Card"
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
    }
}