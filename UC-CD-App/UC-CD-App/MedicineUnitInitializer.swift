
import SwiftData

enum MedicineUnitInitializer {
    
    static func insertDefaultIfNeeded(context: ModelContext) throws {
        
        let descriptor = FetchDescriptor<MedicineUnitModel>()
        let count = try context.fetchCount(descriptor)
        
        guard count == 0 else { return }
        
        context.insert(MedicineUnitModel(name: "-", isDeletable: false))
        context.insert(MedicineUnitModel(name: "錠", isDeletable: false))
        context.insert(MedicineUnitModel(name: "個"))
        context.insert(MedicineUnitModel(name: "mg"))
        
        try context.save()
    }
}
