//
//  DefecationRecordAddView.swift
//  UC-CD-App
//
//  Created by Engineer MacBook Air on 2026/02/15.
//

import SwiftUI

struct DefecationRecordAddView: View {
    
    @State private var normal: Bool = false
    @State private var hard: Bool = false
    @State private var soft: Bool = false
    @State private var diarrhea: Bool = false
    @State private var constipation: Bool = false
    @State private var bloody: Bool = false
    
    var addButton : () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                addButton()
                normal = false
                hard = false
                soft = false
                diarrhea = false
                constipation = false
                bloody = false
            }) {
                Image(systemName: "plus")
            }
            VStack(spacing: 15) {
                HStack(spacing: 20) {
                    Button(action: {
                        normal.toggle()
                    }) {
                        DefecationTypeView(color: normal ? .green.opacity(0.5) : .gray.opacity(0.15), height: 50, width: 100) {
                            Text("普通")
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        soft.toggle()
                    }) {
                        DefecationTypeView(color: soft ? .yellow.opacity(0.5) : .gray.opacity(0.15), height: 50, width: 100) {
                            Text("軟便")
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        constipation.toggle()
                    }) {
                        DefecationTypeView(color: constipation ? .gray.opacity(0.5) : .gray.opacity(0.15), height: 50, width: 100) {
                            Text("便秘")
                        }
                    }
                    .buttonStyle(.plain)
                }
                HStack(spacing: 20) {
                    Button(action: {
                        hard.toggle()
                    }) {
                        DefecationTypeView(color: hard ? .orange.opacity(0.5) : .gray.opacity(0.15), height: 50, width: 100) {
                            Text("硬便")
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        diarrhea.toggle()
                    }) {
                        DefecationTypeView(color: diarrhea ? .purple.opacity(0.5) : .gray.opacity(0.15), height: 50, width: 100) {
                            Text("下痢")
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        bloody.toggle()
                    }) {
                        DefecationTypeView(color: bloody ? .red.opacity(0.5) : .gray.opacity(0.15), height: 50, width: 100) {
                            Text("血便")
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    DefecationRecordAddView(addButton: {})
}
