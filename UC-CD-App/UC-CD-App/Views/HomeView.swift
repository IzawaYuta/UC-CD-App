
import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State private var selectedDate: Date = Date()
    @State private var showDefecationAddView: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Query private var records: [DefecationRecordModel]
    
    var body: some View {
        VStack {
            WeekCalendarView(selectedDate: $selectedDate)
            
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
                                DefecationRecordAddView(addButton: { addRecord()
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
                            HStack(spacing: 20) {
                                DefecationTypeView(color: .green.opacity(0.5), height: 30, width: 100) {
                                    Text("普通 × 2")
                                }
                                DefecationTypeView(color: .yellow.opacity(0.5), height: 30, width: 100) {
                                    Text("軟便 × 2")
                                }
                                DefecationTypeView(color: .gray.opacity(0.5), height: 30, width: 100) {
                                    Text("便秘 × 2")
                                }
                            }
                            HStack(spacing: 20) {
                                DefecationTypeView(color: .orange.opacity(0.5), height: 30, width: 100) {
                                    Text("硬便 × 2")
                                }
                                DefecationTypeView(color: .purple.opacity(0.5), height: 30, width: 100) {
                                    Text("下痢 × 2")
                                }
                                DefecationTypeView(color: .red.opacity(0.5), height: 30, width: 100) {
                                    Text("血便 × 2")
                                }
                            }
                        }
                        //                        .frame(height: 120)
                        //                        .padding(.bottom, 1)
                    }
                }
            }
            Spacer()
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
    
    private func addRecord() {
        let newRecord = DefecationRecordModel(type: "normal", time: selectedDate)
        modelContext.insert(newRecord)
        do {
            try modelContext.save()
            print("Saved DefecationRecord")
            print(newRecord)
        } catch {
            print("Failed to save DefecationRecord: \(error)")
        }

    }
}

#Preview {
    HomeView()
//        .modelContainer(for: DefecationRecordModel.self)
}
