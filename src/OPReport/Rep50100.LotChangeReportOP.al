report 50100 "Lot Change Report_OP"
{
    ApplicationArea = All;
    Caption = 'Lot Change Report_OP';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = const(1));
            trigger OnAfterGetRecord()
            var
                InventorySetupOP: Record "Inventory Setup";
                ItemJournalLineOP: Record "Item Journal Line";
                LotNoInformationOP: Record "Lot No. Information";
                Text001: Label 'Warning! Lot Change Template OR Lot Change Batch must not be blank.';
                EntryNo: Integer;
            begin
                InventorySetupOP.Get();
                If (InventorySetupOP."Lot Change Template" = '') AND (InventorySetupOP."Lot Change Batch" = '') then
                    Error('%1', Text001);

                If ItemJournalLineOP.FindLast() then
                    EntryNo := ItemJournalLineOP."Line No." + 10000
                else
                    EntryNo := 10000;
                ItemJournalLineOP.Init();
                ItemJournalLineOP."Journal Template Name" := InventorySetupOP."Lot Change Template";
                ItemJournalLineOP."Journal Batch Name" := InventorySetupOP."Lot Change Batch";
                ItemJournalLineOP."Line No." := EntryNo;
                ItemJournalLineOP."Posting Date" := WorkDate();
                ItemJournalLineOP.Validate("Item No.", NewItemNo);
                ItemJournalLineOP.Validate("Variant Code", NewVariantNo);
                ItemJournalLineOP.Validate("Lot No.", OLDLotNo);

                LotNoInformationOP.SetRange("Lot No.", OLDLotNo);
                IF LotNoInformationOP.FindFirst() then begin
                    LotNoInformationOP.CalcFields(Inventory);
                    ItemJournalLineOP.Validate(Quantity, LotNoInformationOP.Inventory);
                end;
                ItemJournalLineOP."New Lot No." := NewLotNo;
                ItemJournalLineOP."New Item Expiration Date" := ExpiryDate;
                ItemJournalLineOP.Insert(true);

            end;
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
                            LotInformation.SetRange("Lot No.", OLDLotNo);
                            if LotInformation.FindFirst() then begin
                                OldItemNo := LotInformation."Item No.";
                                OldVariantNo := LotInformation."Variant Code";
                            end
                            else
                                if OLDLotNo = '' then begin
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
                            begin
                                LotInformation.SetRange("Lot No.", NewLotNo);
                                If LotInformation.FindFirst() then begin
                                    NewItemNo := LotInformation."Item No.";
                                    NewVariantNo := LotInformation."Variant Code";
                                end
                                else If NewLotNo = '' then begin
                                    Clear(NewItemNo);
                                    Clear(NewVariantNo);
                                end;
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
    trigger OnPreReport()
    var
        Text001: Label 'Warning! New Item No. must be same as old Item No.';
        Text002: Label 'Warning! New Variant No. must be same as old New Variant No.';
    begin
        If OldItemNo <> NewItemNo then
            Error('%1', Text001);
        If OldVariantNo <> NewVariantNo then
            Error('%1', Text002);
    end;

    var
        OLDLotNo: Code[20];
        OldItemNo: Code[20];
        OldVariantNo: Code[20];

        NewLotNo: Code[20];
        NewItemNo: Code[20];
        NewVariantNo: Code[20];
        ExpiryDate: Date;
}
