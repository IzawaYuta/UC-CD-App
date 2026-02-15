
import Foundation
import SwiftData

@Model
class DailyRecordModel {
    
    var date: Date
    
    @Relationship(deleteRule: .cascade)
    var defecations: [DefecationRecordModel] = []
    
    @Relationship(deleteRule: .cascade)
    var meals: [MealRecordModel] = []
    
    @Relationship(deleteRule: .cascade)
    var hospitalVisits: [HospitalVisitModel] = []
    
    init(date: Date) {
        self.date = date
    }
}

@Model
class DefecationRecordModel {
    
    var type: String
    var time: Date
    
    init(type: String, time: Date) {
        self.type = type
        self.time = time
    }
}

@Model
class MealRecordModel {
    
    var name: String
    var time: Date
    
    init(name: String, time: Date) {
        self.name = name
        self.time = time
    }
}

@Model
class HospitalVisitModel {
    
    var hospitalName: String
    var memo: String
    var visitDate: Date
    
    init(hospitalName: String, memo: String, visitDate: Date) {
        self.hospitalName = hospitalName
        self.memo = memo
        self.visitDate = visitDate
    }
}
