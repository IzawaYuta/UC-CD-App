
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            WeekCalendarView()
            
            ZStack {
                CustomRoundedRectangleView(height: 180, title: "排便記録") {
                    //                    ZStack() {
                    VStack {
                        HStack {
                            // 左上
                            Text("5")
                                .font(.system(size: 50))
//                                .padding(.vertical, 10)
//                                .padding(.horizontal, 40)
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 30))
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
//                            .padding(.vertical, 25)
//                            .padding(.horizontal, 30)
                            .buttonStyle(.plain)
                            
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
                                DefecationTypeView(color: .green.opacity(0.5)) {
                                    Text("普通 × 2")
                                }
                                DefecationTypeView(color: .yellow.opacity(0.5)) {
                                    Text("軟便 × 2")
                                }
                                DefecationTypeView(color: .gray.opacity(0.5)) {
                                    Text("便秘 × 2")
                                }
                            }
                            HStack(spacing: 20) {
                                DefecationTypeView(color: .orange.opacity(0.5)) {
                                    Text("硬便 × 2")
                                }
                                DefecationTypeView(color: .purple.opacity(0.5)) {
                                    Text("下痢 × 2")
                                }
                                DefecationTypeView(color: .red.opacity(0.5)) {
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
    }
}

#Preview {
    HomeView()
}
