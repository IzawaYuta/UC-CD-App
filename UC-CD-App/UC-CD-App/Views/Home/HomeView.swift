
import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State private var selectedDate: Date = Date()
    @State private var showDefecationAddView: Bool = false
    @State private var medicineRecordButton: Bool = false // 服用記録高さ
    @Environment(\.modelContext) private var modelContext
    @Query private var records: [DefecationRecordModel]
    @State private var selectedItems: [DefecationType] = []
    
    var body: some View {
        VStack {
            WeekCalendarView(selectedDate: $selectedDate)
            
            ScrollView {
                VStack(spacing: 20) {
                    ZStack {
                        CustomRoundedRectangleView(height: 180, title: "排便記録") {
                            //                    ZStack() {
                            VStack {
                                HStack {
                                    // 左上
                                    Text("\(defecationCount)")
                                        .font(.system(size: 50))
                                    //                                .padding(.vertical, 10)
                                    //                                .padding(.horizontal, 40)
                                    
                                    Button(action: {
                                        showDefecationAddView.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                            .font(.system(size: 30))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    //                            .padding(.vertical, 25)
                                    //                            .padding(.horizontal, 30)
                                    .buttonStyle(.plain)
                                    .sheet(isPresented: $showDefecationAddView) {
                                        DefecationRecordAddView(selectedItems: $selectedItems, addButton: { addRecord(type: selectedItems)
                                            showDefecationAddView = false
                                        })
                                        .presentationDetents([.height(250)])
                                    }
                                    
                                    //                    }
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 50)
                                
                                .frame(height: 70)   // ← 高さを固定
                                
                                Divider()
                                    .frame(maxWidth: .infinity)
                                //                            .frame(height: 10)
                                    .padding(.horizontal, 25)
                                
                                VStack(spacing: 15) {
                                    HStack {
                                        DefecationTypeView(color: .green.opacity(0.5), height: 30) {
                                            Text("普通 × \(count(of: .normal))")
                                        }
                                        
                                        DefecationTypeView(color: .yellow.opacity(0.5), height: 30) {
                                            Text("軟便 × \(count(of: .soft))")
                                        }
                                        
                                        DefecationTypeView(color: .gray.opacity(0.5), height: 30) {
                                            Text("便秘 × \(count(of: .constipation))")
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    HStack {
                                        DefecationTypeView(color: .orange.opacity(0.5), height: 30) {
                                            Text("硬便 × \(count(of: .hard))")
                                        }
                                        
                                        DefecationTypeView(color: .purple.opacity(0.5), height: 30) {
                                            Text("下痢 × \(count(of: .diarrhea))")
                                        }
                                        
                                        DefecationTypeView(color: .red.opacity(0.5), height: 30) {
                                            Text("血便 × \(count(of: .bloody))")
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                //                        .frame(height: 120)
                                //                        .padding(.bottom, 1)
                            }
                        }
                    }
                    
                    ZStack {
                        CustomRoundedRectangleView(height: 170, title: "食事記録") {
                            ScrollView(.horizontal) {
                                HStack(spacing: 1) {
                                    ForEach(1..<4) { _ in
                                        CustomMealView(title: "朝食", time: Date(), items: ["白ごはん", "味噌汁", "納豆", "あいうえおかきくけこさしすせそたちつてと"], color: .red)
                                    }
                                }
                            }
                        }
                    }
                    
                    ZStack {
                        CustomRoundedRectangleView(height: medicineRecordButton ? 300 : 150, title: "服用記録") {
                            VStack(spacing: 5) {
                                ScrollView(medicineRecordButton ? .vertical : []) {
                                    VStack(spacing: 0) {
                                        // 1つ目のイベント
                                        HStack(alignment: .top, spacing: 12) {
                                            // 左側: タイムライン
                                            VStack(spacing: 0) {
                                                Circle()
                                                    .frame(width: 20, height: 20)
                                                
                                                Rectangle()
                                                    .frame(width: 1.5)
                                                    .frame(height: 80)
                                            }
                                            
                                            // 右側: コンテンツ
                                            HStack(alignment: .top, spacing: 30) {
                                                Text("8:00")
                                                    .font(.headline)
                                                
                                                VStack(alignment: .leading, spacing: 2) {
                                                    HStack {
                                                        Text("ペンタサ")
                                                        Spacer()
                                                        Text("2錠")
                                                    }
                                                    HStack {
                                                        Text("アサコール")
                                                        Spacer()
                                                        Text("2錠")
                                                    }
                                                    HStack {
                                                        Text("コレチメント")
                                                        Spacer()
                                                        Text("1錠")
                                                    }
                                                }
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        // 2つ目のイベント
                                        HStack(alignment: .top, spacing: 12) {
                                            // 左側: タイムライン
                                            VStack(spacing: 0) {
                                                Circle()
                                                    .frame(width: 20, height: 20)
                                                
                                                Rectangle()
                                                    .frame(width: 1.5)
                                                    .frame(height: 80)
                                            }
                                            
                                            // 右側: コンテンツ
                                            HStack(alignment: .top, spacing: 30) {
                                                Text("12:00")
                                                    .font(.headline)
                                                
                                                VStack(alignment: .leading, spacing: 2) {
                                                    HStack {
                                                        Text("ペンタサ")
                                                        Spacer()
                                                        Text("2錠")
                                                    }
                                                    HStack {
                                                        Text("アサコール")
                                                        Spacer()
                                                        Text("2錠")
                                                    }
                                                    HStack {
                                                        Text("コレチメント")
                                                        Spacer()
                                                        Text("1錠")
                                                    }
                                                }
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                    }
                                    .padding()
                                }
                                Button(action: {
                                    medicineRecordButton.toggle()
                                }) {
                                    Image(systemName: medicineRecordButton ? "chevron.up" :  "chevron.down")
                                }
                                .padding(.vertical, 5)
                            }
                        }
                    }
                    
                    ZStack {
                        CustomRoundedRectangleView(height: 150, title: "通院予定") {
                            VStack(alignment: .leading, spacing: 8) {
                                    Text("2026年02月28日")
                                    .padding(.horizontal, 5)
                            HStack(spacing: 20) {
                                Text("10:00")
                                Text("〇〇病院")
                            }
                            .padding(.horizontal, 5)
                                
                                HStack(spacing: 8) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.purple.opacity(0.5))
                                            .frame(width: 90, height: 30)
                                        Text("経過観察")
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.purple.opacity(0.5))
                                            .frame(width: 90, height: 30)
                                        Text("血液検査")
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(15)
                        }
                    }
                }
            }
            //            Spacer()
        }
        .padding(.vertical)
        .background(Color.gray.opacity(0.2))
        .onAppear {
            print("records count:", records.count)
        }
        
    }
    
    private var defecationCount: Int {
        records.filter {
            Calendar.current.isDate($0.time, inSameDayAs: selectedDate)
        }.count
    }
    
    private func addRecord(type: [DefecationType]) {
        let newRecord = DefecationRecordModel(type: type, time: selectedDate)
        modelContext.insert(newRecord)
        do {
            try modelContext.save()
            print("Saved DefecationRecord")
            print(newRecord)
        } catch {
            print("Failed to save DefecationRecord: \(error)")
        }
        
    }
    
    private var todayRecords: [DefecationRecordModel] {
        records.filter {
            Calendar.current.isDate($0.time, inSameDayAs: selectedDate)
        }
    }
    
    
    private func count(of type: DefecationType) -> Int {
        todayRecords.reduce(0) { result, record in
            result + record.type.filter { $0 == type }.count
        }
    }
    
}

#Preview {
    HomeView()
    //        .modelContainer(for: DefecationRecordModel.self)
}
