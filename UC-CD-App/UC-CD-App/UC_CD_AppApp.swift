//
//  UC_CD_AppApp.swift
//  UC-CD-App
//
//  Created by Engineer MacBook Air on 2026/02/15.
//

import SwiftUI
import SwiftData

@main
struct UC_CD_AppApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
//        .modelContainer(sharedModelContainer)
        .modelContainer(
            for: [
                DailyRecordModel.self,
                DefecationRecordModel.self,
                MealRecordModel.self,
                HospitalVisitModel.self
            ]
        )
    }
}
