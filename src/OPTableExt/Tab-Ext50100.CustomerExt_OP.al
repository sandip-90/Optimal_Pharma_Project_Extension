tableextension 50100 CustomerExt_OP extends Customer
{
    fields
    {
        field(50100; "Optimal Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}
