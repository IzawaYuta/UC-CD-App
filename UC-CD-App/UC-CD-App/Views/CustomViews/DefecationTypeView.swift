
import SwiftUI

struct DefecationTypeView<Content: View>: View {
    
    let color: Color
    let height: CGFloat
    let width: CGFloat
    let content: Content
    
    init(color: Color, height: CGFloat, width: CGFloat,
         @ViewBuilder content: () -> Content) {
        self.color = color
        self.height = height
        self.width = width
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: width, height: height)
            
            content
        }
    }
}

#Preview {
    DefecationTypeView(color: .orange, height: 50, width: 300, content: {})
}
