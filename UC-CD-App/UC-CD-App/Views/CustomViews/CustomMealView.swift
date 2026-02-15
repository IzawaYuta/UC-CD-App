//
//  CustomMealView.swift
//  UC-CD-App
//
//  Created by Engineer MacBook Air on 2026/02/15.
//

import SwiftUI

struct CustomMealView<Content: View>: View {
    
    let title: String
    let time: Date
    let content: Content
    
    init(title: String,
         time: Date,
         @ViewBuilder content: () -> Content) {
        self.title = title
        self.time = time
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.5))
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
            VStack(spacing:5) {
                HStack {
                    Text(title)
                        .foregroundColor(.black.opacity(0.8))
                    Spacer()
                    Text(time.formatted(date: .omitted, time: .shortened))
                        .foregroundColor(.black.opacity(0.8))
                }
                .padding(.horizontal, 30)
//                .padding(.top, 50)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 13)
                        .fill(Color.white)
                        .frame(height: 110)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
//                        .padding(.bottom, 60)
                    
                    content
                }
            }
        }
    }
}

#Preview {
    CustomMealView(title: "朝食", time: Date(), content: {})
        .background(Color.white)
        .ignoresSafeArea()
}
