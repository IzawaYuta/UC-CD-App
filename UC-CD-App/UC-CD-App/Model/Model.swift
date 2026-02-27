
import Foundation
import SwiftData
import SwiftUICore

//MARK: 日付
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

//MARK: 便のタイプ
enum DefecationType: String, Codable {
    case normal
    case hard
    case soft
    case diarrhea
    case constipation
    case bloody
}

//MARK: 排便記録
@Model
class DefecationRecordModel {
    
    var type: [DefecationType]
    var time: Date
    
    init(type: [DefecationType], time: Date) {
        self.type = type
        self.time = time
    }
}

//MARK: 食事記録
@Model
class MealRecordModel {
    
    var name: String
    var time: Date
    
    init(name: String, time: Date) {
        self.name = name
        self.time = time
    }
}

//MARK: 便のタイプ
enum TakingTiming: String, Codable {
    case wakeUp
    case beforeMeals
    case justBeforeMeals
    case immediatelyAfterMeals
    case afterMeal
    case beforeBedtime
    case temporaryClothes
}

//MARK: お薬記録
@Model
class MedicineModel {
    
    var image: Image
    var medicineName: String
    var dose: Int
    var timing: TakingTiming
    var time: [Date]
    var stock: Int
    var memo: String
    
    init(medicineName: String, dose: Int, timing: TakingTiming, time: [Date], stock: Int, memo: String) {
        self.medicineName = medicineName
        self.dose = dose
        self.timing = timing
        self.time = time
        self.stock = stock
        self.memo = memo
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
