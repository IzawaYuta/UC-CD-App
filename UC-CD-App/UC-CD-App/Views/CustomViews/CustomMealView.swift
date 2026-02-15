//
//  CustomMealView.swift
//  UC-CD-App
//
//  Created by Engineer MacBook Air on 2026/02/15.
//

import SwiftUI

struct CustomMealView: View {
    
    let title: String
    let time: Date
    let items: [String]
    let color: Color

//    init(title: String,
//         time: Date,
//         @ViewBuilder content: () -> Content) {
//        self.title = title
//        self.time = time
//        self.content = content()
//    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(color.opacity(0.2))
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
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 11)
                        .fill(Color.white)
//                        .padding(.bottom, 60)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(items, id: \.self) { item in
                                Text("・" + breakEverySix(item))
                                    .font(.system(size: 13))
                                    .foregroundColor(.black.opacity(0.8))
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
                    }
                }
                .frame(height: 110)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 18)
            }
        }
    }
    
    // 7文字ごとに改行
    func breakEverySix(_ text: String) -> String {
        var result = ""
        for (index, char) in text.enumerated() {
            if index != 0 && index % 7 == 0 {
                result.append("\n")
            }
            result.append(char)
        }
        return result
    }
}

#Preview {
    CustomMealView(title: "朝食", time: Date(), items: ["あああ"], color: .orange.opacity(0.1))
        .background(Color.white)
        .ignoresSafeArea()
}
