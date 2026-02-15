
import SwiftUI

struct WeekCalendarView: View {
//    @State private var selectedDate: Date = Date()
    @Binding var selectedDate: Date
    @State private var weekOffset: Int = 0
    
    private let calendar = Calendar.current
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            
            HStack {
                // 選択された年月日表示（初期は今日）
                Text(dateFormat(selectedDate))
                    .font(.title2)
                    .foregroundColor(.black.opacity(0.8))
                    .bold()
                
                Button(action: {
                    selectedDate = Date()
                    weekOffset = 0
                }) {
                    Text("Today")
                }
            }
            .padding(.leading, 12)
            
            // 週表示（今日を中央に）
            TabView(selection: $weekOffset) {
                ForEach(-52...52, id: \.self) { offset in
                    weekView(for: offset)
                        .tag(offset)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 80)
        }
        .padding(.horizontal, 1)
    }
    
    private func dateFormat(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: date)
    }
    
    // 今日を中央（±3日）に配置
    private func weekView(for offset: Int) -> some View {
        let centerDate = calendar.date(byAdding: .weekOfYear, value: offset, to: Date())!
        
        return HStack(spacing: 15) {
            ForEach(-3...3, id: \.self) { dayOffset in
                let date = calendar.date(byAdding: .day, value: dayOffset, to: centerDate)!
                dayCell(for: date)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func dayCell(for date: Date) -> some View {
        let isSelected = calendar.isDate(date, inSameDayAs: selectedDate)
        let isToday = calendar.isDateInToday(date)
        
        return VStack(spacing: 6) {
            Text(date.formatted(.dateTime.weekday(.short)))
                .font(.caption)
            
            Text(date.formatted(.dateTime.day()))
                .font(.headline)
        }
        .frame(width: 43, height: 60)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(isSelected ? Color.gray : (isToday ? Color.gray.opacity(0.3) : Color.clear))
        )
        .foregroundColor(isSelected ? .white : .primary)
        .onTapGesture {
            selectedDate = date
        }
    }
}

#Preview {
    WeekCalendarView(selectedDate: .constant(Date()))
}
