
import SwiftUI

struct CustomRoundedRectangleView: View {
    
    let hight: CGFloat
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 3, y: 5)
                .frame(height: hight)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
        }
    }
}

#Preview {
    CustomRoundedRectangleView(hight: 100)
}
