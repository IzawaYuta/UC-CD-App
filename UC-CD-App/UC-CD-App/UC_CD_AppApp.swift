import SwiftUI
import SwiftData

@main
struct UC_CD_AppApp: App {
    
    var container: ModelContainer {
        let schema = Schema([
            DailyRecordModel.self,
            DefecationRecordModel.self,
            MealRecordModel.self,
            MedicineModel.self,
            MedicineUnitModel.self,
            HospitalVisitModel.self
        ])
        
        let configuration = ModelConfiguration(schema: schema)
        
        do {
            return try ModelContainer(for: schema, configurations: configuration)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .task {
                    try? MedicineUnitInitializer.insertDefaultIfNeeded(
                        context: container.mainContext
                    )
                }
        }
        .modelContainer(container)
    }
}
