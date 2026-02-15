//
//  DefecationTypeView.swift
//  UC-CD-App
//
//  Created by Engineer MacBook Air on 2026/02/15.
//

import SwiftUI

struct DefecationTypeView<Content: View>: View {
    
    let color: Color
    let content: Content
    
    init(color: Color,
         @ViewBuilder content: () -> Content) {
        self.color = color
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: 100, height: 30)
            
            content
        }
    }
}

#Preview {
    DefecationTypeView(color: .orange, content: {})
}
