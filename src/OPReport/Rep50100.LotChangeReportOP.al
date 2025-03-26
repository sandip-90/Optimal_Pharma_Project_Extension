report 50100 "Lot Change Report_OP"
{
    ApplicationArea = All;
    Caption = 'Lot Change Report_OP';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(LotNoInformation; "Lot No. Information")
        {

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Old Lot Information")
                {
                    field(OLDLotNo; OLDLotNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Old Lot No.';
                        TableRelation = "Lot No. Information"."Lot No.";
                        trigger OnValidate()
                        var
                            LotInformation: Record "Lot No. Information";
                        begin
                            LotNoInformation.SetRange("Lot No.", OLDLotNo);
                            if LotNoInformation.FindFirst() then begin
                                OldItemNo := LotNoInformation."Item No.";
                                OldVariantNo := LotNoInformation."Variant Code";
                            end
                            else begin
                                Clear(OldItemNo);
                                Clear(OldVariantNo);
                            end;
                        end;
                    }
                    field(OldItemNo; OldItemNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Old Item No.';
                        TableRelation = "Lot No. Information";
                        Editable = false;
                    }
                    field(OldVariantNo; OldVariantNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Old Variant No.';
                        TableRelation = "Lot No. Information"."Variant Code";
                        Editable = false;
                    }
                    group("New Lot Information")
                    {
                        field(NewLotNo; NewLotNo)
                        {
                            ApplicationArea = All;
                            Caption = 'New Lot No.';
                            TableRelation = "Lot No. Information"."Lot No.";
                            trigger OnValidate()
                            var
                                LotInformation: Record "Lot No. Information";
                                Text001: Label 'Warning! New Item No. must be same as old Item No.';
                            begin
                                LotNoInformation.SetRange("Lot No.", OLDLotNo);
                                If LotNoInformation.FindFirst() then begin
                                    NewItemNo := LotNoInformation."Item No.";
                                    NewVariantNo := LotNoInformation."Variant Code";
                                end
                                else begin
                                    Clear(NewItemNo);
                                    Clear(NewVariantNo);
                                end;
                                If OLDLotNo <> NewItemNo then
                                    Error('%1', Text001);
                            end;
                        }
                        field(NewItemNo; NewItemNo)
                        {
                            ApplicationArea = All;
                            Caption = 'New Item No.';
                            Editable = false;
                        }
                        field(NewVariantNo; NewVariantNo)
                        {
                            ApplicationArea = All;
                            Caption = 'New Variant No.';
                            Editable = false;
                            trigger OnValidate()
                            var
                                Text001: Label 'Warning! New Variant No. must be same as old New Variant No.';
                            begin
                                If NewVariantNo <> OldVariantNo then
                                    Error('%1', Text001);
                            end;
                        }
                        field(ExpiryDate; ExpiryDate)
                        {
                            ApplicationArea = All;
                            Caption = 'Expiry Date';
                        }
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        OLDLotNo: Code[20];
        OldItemNo: Code[20];
        OldVariantNo: Code[20];

        NewLotNo: Code[20];
        NewItemNo: Code[20];
        NewVariantNo: Code[20];
        ExpiryDate: Date;
}
