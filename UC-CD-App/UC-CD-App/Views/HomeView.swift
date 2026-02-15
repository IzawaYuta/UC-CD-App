
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            WeekCalendarView()
            
            ZStack {
                CustomRoundedRectangleView(height: 200, title: "排便記録") {
                    //                    ZStack() {
                    VStack {
                        HStack {
                            // 左上
                            Text("5")
                                .font(.system(size: 50))
                                .padding(.vertical, 10)
                                .padding(.horizontal, 40)
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 30))
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.vertical, 25)
                            .padding(.horizontal, 30)
                            .buttonStyle(.plain)
                            
                            //                    }
                        }
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
