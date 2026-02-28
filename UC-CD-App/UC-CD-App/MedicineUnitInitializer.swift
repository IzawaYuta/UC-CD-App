
import SwiftData

enum MedicineUnitInitializer {
    
    static func insertDefaultIfNeeded(context: ModelContext) throws {
        
        let descriptor = FetchDescriptor<MedicineUnitModel>()
        let count = try context.fetchCount(descriptor)
        
        guard count == 0 else { return }
        
        context.insert(MedicineUnitModel(name: "-", order: 1, isDeletable: false))
        context.insert(MedicineUnitModel(name: "錠", order: 2, isDeletable: false))
        context.insert(MedicineUnitModel(name: "個", order: 3))
        context.insert(MedicineUnitModel(name: "mg", order: 4))
        
        try context.save()
    }
}
