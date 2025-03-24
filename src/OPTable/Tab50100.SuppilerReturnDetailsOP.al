table 50100 SuppilerReturnDetails_OP
{
    Caption = 'SuppilerReturnDetails_OP';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
