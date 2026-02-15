//
//  DefecationTypeView.swift
//  UC-CD-App
//
//  Created by Engineer MacBook Air on 2026/02/15.
//

import SwiftUI

struct DefecationTypeView: View {
    
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(width: 100, height: 50)
    }
}

#Preview {
    DefecationTypeView(color: .orange)
}
