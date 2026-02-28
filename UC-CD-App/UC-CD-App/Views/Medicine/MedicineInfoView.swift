
import SwiftUI
import SwiftData

struct MedicineInfoView: View {
    
    @Query private var units: [MedicineUnitModel]
    @Environment(\.modelContext) private var modelContext
    @State private var medicineName: String = "" // お薬の名前
    @State private var selectedUnit: MedicineUnitModel?
    @State private var dose: Int = 1
    @State private var timing: TakingTiming = .wakeUp
    @State private var times: [Date] = []
    @State private var stock: Int = 0
    @State private var memo: String = ""
    
    let medicine: MedicineModel?  // 編集時は既存データ、新規作成時はnil
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width:100, height: 100)
                            .padding()
                        Image(systemName: "pill")
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("お薬の名前")
                            Spacer()
                            TextField("", text: $medicineName)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("単位")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("錠")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("用量")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("1回")
                                .foregroundColor(.primary)
                            Text("3錠")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("服用時間")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("起床後")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("時間を追加")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: "plus")
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("在庫")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("100錠")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("メモ")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                        }
                    }
                    
                    Button(action: {
                        saveMedicine()
                    }) {
                        Text("保存")
                            .frame(maxWidth: .infinity)
                            .frame(height: 10)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 70)
                    .padding(.vertical, 20)
                    
                    Spacer()
                }
                .onAppear {
                    if selectedUnit == nil {
                        selectedUnit = units.first { $0.name == "錠" }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }
    
    // 保存メソッド
//    private func saveMedicine() {
//        // 空チェック
//        guard !medicineName.isEmpty else {
//            print("お薬の名前を入力してください")
//            return
//        }
//        guard let unit = selectedUnit else {
//            return
//        }
//        
//        // 新規作成
//        let newMedicine = MedicineModel(
//            medicineName: medicineName,
//            unit: unit,
//            dose: dose,
//            timing: timing,
//            time: times,
//            stock: stock,
//            memo: memo
//        )
//        
//        modelContext.insert(newMedicine)
////        
//        // 保存
//        do {
//            try modelContext.save()
//            print("保存成功: \(medicineName)")
//            
//            // 保存後、入力欄をクリア
//            medicineName = ""
//        } catch {
//            print("保存失敗: \(error)")
//        }
//    }
    
    private func loadMedicineData() {
        if let medicine = medicine {
            // 編集モード: 既存データを読み込む
            medicineName = medicine.medicineName
            selectedUnit = medicine.unit
            dose = medicine.dose
            timing = medicine.timing
            times = medicine.time
            stock = medicine.stock
            memo = medicine.memo
        } else {
            // 新規作成モード: デフォルト値を設定
            if selectedUnit == nil {
                selectedUnit = units.first { $0.name == "錠" }
            }
        }
    }
    private func saveMedicine() {
        guard !medicineName.isEmpty else {
            print("お薬の名前を入力してください")
            return
        }
        guard let unit = selectedUnit else {
            return
        }
        
        if let medicine = medicine {
            // 編集モード: 既存データを更新
            medicine.medicineName = medicineName
            medicine.unit = unit
            medicine.dose = dose
            medicine.timing = timing
            medicine.time = times
            medicine.stock = stock
            medicine.memo = memo
        } else {
            // 新規作成モード: 新しいデータを作成
            let newMedicine = MedicineModel(
                medicineName: medicineName,
                unit: unit,
                dose: dose,
                timing: timing,
                time: times,
                stock: stock,
                memo: memo
            )
            modelContext.insert(newMedicine)
        }
        
        do {
            try modelContext.save()
            print("保存成功: \(medicineName)")
            dismiss()  // 前の画面に戻る
        } catch {
            print("保存失敗: \(error)")
        }
    }
}

#Preview {
    NavigationStack {
        MedicineInfoView(medicine: nil)
            .modelContainer(for: [MedicineModel.self, MedicineUnitModel.self])
    }
}
