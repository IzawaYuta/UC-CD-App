
import SwiftUI

struct CustomRoundedRectangleView<Content: View>: View {
    
    let height: CGFloat
    let title: String
    let content: Content
    
    init(height: CGFloat,
         title: String,
         @ViewBuilder content: () -> Content) {
        self.height = height
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .foregroundStyle(.gray)
                .padding(.horizontal, 15)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(radius: 3, y: 5)
                    .frame(height: height)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 10)
                
                content
                    .frame(height: height)  // ← 高さを制限
                    .clipped()              // ← はみ出た部分をカット
                    .padding(.horizontal, 10)  // ← RoundedRectangleと同じpadding
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    CustomRoundedRectangleView(height: 100, title: "記録", content: {})
}
