
import SwiftUI
import SwiftData

struct MedicineUnitPickerView: View {
    
    @Binding var selectedUnit: MedicineUnitModel?
    
    @Query(sort: \MedicineUnitModel.name)
    private var units: [MedicineUnitModel]
    
    var body: some View {
        VStack {
            ForEach(units) { unit in
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray.opacity(0.2))
                        HStack {
                            Text(unit.name)
                                .tag(Optional(unit))
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .padding(.leading, 20)
                    .padding(.trailing,2)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray.opacity(0.2))
                        
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .frame(width: 70, height: 50)
                    .padding(.leading, 2)
                    .padding(.trailing, 20)
                }
            }
            
            Button(action: {
                
            }) {
                Text("追加")
                    .frame(maxWidth: .infinity)
                    .frame(height: 10)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .foregroundColor(.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 70)
            .padding(.vertical, 20)
            .buttonStyle(.plain)
        }
    }
}


#Preview {
    let container = try! ModelContainer(
        for: MedicineUnitModel.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    
    let context = container.mainContext
    
    // 初期単位「錠」
    let tablet = MedicineUnitModel(
        name: "錠",
        isDeletable: false
    )
    
    context.insert(tablet)
    context.insert(MedicineUnitModel(name: "個"))
    context.insert(MedicineUnitModel(name: "mg"))
    
    return MedicineUnitPickerView(
        selectedUnit: .constant(tablet)
    )
    .modelContainer(container)
}
