import SwiftUI
import SwiftData

struct MedicineListView: View {
    
    @Query(sort: \MedicineModel.medicineName) private var medicines: [MedicineModel]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                VStack {
                    if medicines.isEmpty {
                        emptyStateView
                    } else {
                        medicineListView
                    }
                    
                    Spacer()
                    
                    addMedicineButton
                }
            }
            .navigationTitle("お薬リスト")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: MedicineInfoView(medicine: nil)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    // 空の状態のビュー
    private var emptyStateView: some View {
        VStack {
            Spacer()
            Image(systemName: "pill")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            Text("登録されているお薬はありません")
                .foregroundColor(.gray)
                .padding()
            Spacer()
        }
    }
    
    // リストビュー
    private var medicineListView: some View {
        List {
            ForEach(medicines) { medicine in
                NavigationLink(destination: MedicineInfoView(medicine: medicine)) {
                    medicineRow(medicine: medicine)
                }
            }
            .onDelete(perform: deleteMedicine)
        }
        .scrollContentBackground(.hidden)
    }
    
    // リストの各行
    private func medicineRow(medicine: MedicineModel) -> some View {
        HStack {
            Image(systemName: "pill.fill")
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(medicine.medicineName)
                    .font(.headline)
                
                HStack {
                    Text("\(medicine.dose)\(medicine.unit.name)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("・")
                        .foregroundColor(.gray)
                    
                    Text(medicine.timing.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("在庫")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("\(medicine.stock)\(medicine.unit.name)")
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 4)
    }
    
    // 追加ボタン
    private var addMedicineButton: some View {
        NavigationLink(destination: MedicineInfoView(medicine: nil)) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 20))
                Text("お薬を追加")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
    
    private func deleteMedicine(at offsets: IndexSet) {
        for index in offsets {
            let medicine = medicines[index]
            modelContext.delete(medicine)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("削除失敗: \(error)")
        }
    }
}

#Preview {
    MedicineListView()
        .modelContainer(for: [MedicineModel.self, MedicineUnitModel.self])
}
