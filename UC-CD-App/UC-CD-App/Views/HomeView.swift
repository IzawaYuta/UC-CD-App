
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            WeekCalendarView()
            Spacer()
        }
        .padding(.vertical)
    }
}

#Preview {
    HomeView()
}
