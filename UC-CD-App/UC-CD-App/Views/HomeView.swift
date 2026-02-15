
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            WeekCalendarView()
            Spacer()
        }
        .padding(.vertical)
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    HomeView()
}
