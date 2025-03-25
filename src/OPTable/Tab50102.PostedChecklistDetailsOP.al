table 50102 "Posted Checklist Details_OP"
{
    Caption = 'Posted Checklist Details OP';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Order No"; Code[20])
        {
            Caption = 'Order No';
        }
        field(2; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(3; Questionaire; Text[200])
        {
            Caption = 'Questionaire';
        }
        field(4; Answer; Enum AnswerEnum)
        {
            Caption = 'Answer';
        }
        field(5; Remarks; Text[50])
        {
            Caption = 'Remarks';
        }
        field(6; "Type"; Enum PostedChecklistEnum)
        {
            Caption = 'Type';
        }
    }
    keys
    {
        key(PK; "Document No")
        {
            Clustered = true;
        }
    }
}
