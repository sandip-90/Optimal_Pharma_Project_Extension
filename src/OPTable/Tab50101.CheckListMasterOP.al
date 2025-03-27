table 50101 "CheckList Master_OP"
{
    Caption = 'CheckList Master OP';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "SN"; Code[20])
        {
            Caption = 'SN';
        }
        field(2; Questionaire; Text[200])
        {
            Caption = 'Questionaire';
        }
        field(3; "Type"; Enum CheckListEnum)
        {
            Caption = 'Type';
        }
        field(4; Block; Boolean)
        {
            Caption = 'Block';
        }
        field(5; "Sale/Purchase"; Enum SalesPurchaseEnum)
        {
            Caption = 'Posting Type';
        }
        field(6; Answer; Enum AnswerEnum)
        {
            Caption = 'Answer';
        }
    }
    keys
    {
        key(PK; "SN")
        {
            Clustered = true;
        }
    }
}
