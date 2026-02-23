//
//  MedicineRecord.swift
//  UC-CD-App
//
//  Created by Engineer MacBook Air on 2026/02/22.
//

import SwiftUI

// 1. データモデル定義
struct MedicineRecord: Identifiable {
    let id = UUID()
    let time: String
    let medicines: [Medicine]
}

struct Medicine {
    let name: String
    let dosage: String
}

// 2. サンプルデータ
extension MedicineRecord {
    static let sampleData: [MedicineRecord] = [
        MedicineRecord(
            time: "8:00",
            medicines: [
                Medicine(name: "ペンタサ", dosage: "2錠"),
                Medicine(name: "アサコール", dosage: "2錠"),
                Medicine(name: "コレチメント", dosage: "1錠")
            ]
        ),
        MedicineRecord(
            time: "12:00",
            medicines: [
                Medicine(name: "ペンタサ", dosage: "1錠"),
                Medicine(name: "アサコール", dosage: "2錠"),
                Medicine(name: "コレチメント", dosage: "1錠"),
                Medicine(name: "ペンタサ", dosage: "2錠"),
                Medicine(name: "アサコール", dosage: "2錠"),
                Medicine(name: "コレチメント", dosage: "1錠")
            ]
        ),
        MedicineRecord(
            time: "18:00",
            medicines: [
                Medicine(name: "ペンタサ", dosage: "1錠"),
                Medicine(name: "アサコール", dosage: "2錠"),
                Medicine(name: "コレチメント", dosage: "1錠"),
                Medicine(name: "ペンタサ", dosage: "2錠"),
                Medicine(name: "アサコール", dosage: "2錠"),
                Medicine(name: "コレチメント", dosage: "1錠")
            ]
        )
    ]
}

// 3. View実装
struct MedicineRecordView: View {
    @State private var medicineRecordButton: Bool = false
    let records = MedicineRecord.sampleData
    
    var body: some View {
        ZStack {
            CustomRoundedRectangleView(height: medicineRecordButton ? 300 : 150, title: "服用記録") {
                VStack(spacing: 5) {
                    ScrollView(medicineRecordButton ? .vertical : []) {
                        VStack(spacing: 0) {
                            ForEach(Array(records.enumerated()), id: \.element.id) { index, record in
                                HStack(alignment: .top, spacing: 12) {
                                    // 左側: タイムライン
                                    VStack(spacing: 0) {
                                        Circle()
                                            .frame(width: 20, height: 20)
                                        
                                        // 最後の要素以外はRectangleを表示
                                        if index < records.count - 1 {
                                            Rectangle()
                                                .frame(width: 1.5)
                                                .frame(height: medicineRecordButton ? nil : 40)
                                        }
                                    }
                                    
                                    // 右側: コンテンツ
                                    HStack(alignment: .top, spacing: 30) {
                                        Text(record.time)
                                            .font(.headline)
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            ForEach(record.medicines.indices, id: \.self) { index in
                                                HStack {
                                                    Text(record.medicines[index].name)
                                                    Spacer()
                                                    Text(record.medicines[index].dosage)
                                                }
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Button(action: {
                        medicineRecordButton.toggle()
                    }) {
                        Image(systemName: medicineRecordButton ? "chevron.up" : "chevron.down")
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 15)
                }
            }
        }
    }
}

#Preview {
    MedicineRecordView()
}
