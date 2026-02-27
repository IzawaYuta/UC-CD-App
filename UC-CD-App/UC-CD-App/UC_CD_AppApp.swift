import SwiftUI
import SwiftData

@main
struct UC_CD_AppApp: App {
    
    let container: ModelContainer = {
        try! ModelContainer(
            for: 
                DailyRecordModel.self,
            DefecationRecordModel.self,
            MealRecordModel.self,
            MedicineModel.self,
            MedicineUnitModel.self,
            HospitalVisitModel.self
            
        )
    }()
    
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
