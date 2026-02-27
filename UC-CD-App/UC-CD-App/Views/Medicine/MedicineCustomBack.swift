
import SwiftUI

struct MedicineCustomBack<Content: View>: View {
    
    let height: CGFloat
    let content: Content
    
    init(height: CGFloat,
         @ViewBuilder content: () -> Content) {
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
//                    .frame(width: geometry.size.width - 32, height: height)  // 左右16ずつ
                
                content
                    .frame(width: geometry.size.width - 42)  // 32 + 左右20ずつ = 72
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: height)
        .padding(.horizontal, 20)
    }
}

#Preview {
    MedicineCustomBack(height: 50, content: {Text("あいうえお")})
        .background(Color.gray.opacity(0.2))
}
