
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
                Medicine(name: "ペンタサああああああああああああああ", dosage: "1錠"),
                Medicine(name: "アサコール", dosage: "2錠"),
                Medicine(name: "コレチメント", dosage: "1錠"),
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
    let records: [MedicineRecord] = MedicineRecord.sampleData
//     let records: [MedicineRecord] = []
    
    var body: some View {
        ZStack {
            CustomRoundedRectangleView(
                height: medicineRecordButton ? 300 : 150,
                title: "服用記録"
            ) {
                
                VStack(spacing: 5) {
                    
                    if records.isEmpty {
                        
                        // ✅ データがない場合
                        Spacer()
                        
                        Text("服用記録はありません")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        
                        Spacer()
                        
                    } else {
                        
                        let displayedRecords = medicineRecordButton
                        ? records
                        : Array(records.prefix(1))
                        
                        ScrollView {
                            VStack(spacing: 20) {
                                
                                ForEach(displayedRecords) { record in
                                    
                                    HStack(alignment: .top, spacing: 12) {
                                        
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 7)
                                            .foregroundColor(.gray.opacity(0.3))
                                        
                                        HStack(alignment: .top, spacing: 30) {
                                            
                                            Text(record.time)
                                                .font(.headline)
                                            
                                            VStack(alignment: .leading, spacing: 4) {
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
                            withAnimation {
                                medicineRecordButton.toggle()
                            }
                        }) {
                            Image(systemName: medicineRecordButton ? "chevron.up" : "chevron.down")
                        }
                        .padding(.vertical, 15)
                    }
                }
            }
        }
    }
}

#Preview {
    MedicineRecordView()
}

