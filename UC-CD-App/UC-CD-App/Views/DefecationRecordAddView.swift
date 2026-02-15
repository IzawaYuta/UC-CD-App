
import SwiftUI

struct DefecationRecordAddView: View {
    
    @State private var normal: Bool = false
    @State private var hard: Bool = false
    @State private var soft: Bool = false
    @State private var diarrhea: Bool = false
    @State private var constipation: Bool = false
    @State private var bloody: Bool = false
    
//    @State private var keepSelection: Bool = false
    
//    @State private var selectedItems: [DefecationType] = []
    
    @Binding var selectedItems: [DefecationType]
    
    @AppStorage("keepSelection") private var keepSelection: Bool = false
    
    var addButton : () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                    selectedItems.removeAll()
                    
                    if normal { selectedItems.append(.normal) }
                    if hard { selectedItems.append(.hard) }
                    if soft { selectedItems.append(.soft) }
                    if diarrhea { selectedItems.append(.diarrhea) }
                    if constipation { selectedItems.append(.constipation) }
                    if bloody { selectedItems.append(.bloody) }
                    
                    addButton()
                    
                    if !keepSelection {
                        normal = false
                        hard = false
                        soft = false
                        diarrhea = false
                        constipation = false
                        bloody = false
                    }
                    
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityIdentifier("addPlusButton")
                .buttonStyle(.plain)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 100, height: 30)
                )
                
                Spacer()
                
                Button(action: {
                    keepSelection.toggle()
                }) {
                    Image(systemName: keepSelection ? "pin.fill" : "pin")
                        .foregroundColor(keepSelection ? .accentColor : .primary)
                }
                .accessibilityIdentifier("keepSelectionButton")
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 70)
            .padding(.vertical, 30)
            
            VStack(spacing: 15) {
                HStack(spacing: 20) {
                    Button(action: {
                        normal.toggle()
                    }) {
                        DefecationTypeView(color: normal ? .green.opacity(0.5) : .gray.opacity(0.15), height: 50) {
                            Text("普通")
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        soft.toggle()
                    }) {
                        DefecationTypeView(color: soft ? .yellow.opacity(0.5) : .gray.opacity(0.15), height: 50) {
                            Text("軟便")
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        constipation.toggle()
                    }) {
                        DefecationTypeView(color: constipation ? .gray.opacity(0.5) : .gray.opacity(0.15), height: 50) {
                            Text("便秘")
                        }
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 20) {
                    Button(action: {
                        hard.toggle()
                    }) {
                        DefecationTypeView(color: hard ? .orange.opacity(0.5) : .gray.opacity(0.15), height: 50) {
                            Text("硬便")
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        diarrhea.toggle()
                    }) {
                        DefecationTypeView(color: diarrhea ? .purple.opacity(0.5) : .gray.opacity(0.15), height: 50) {
                            Text("下痢")
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: {
                        bloody.toggle()
                    }) {
                        DefecationTypeView(color: bloody ? .red.opacity(0.5) : .gray.opacity(0.15), height: 50) {
                            Text("血便")
                        }
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 20)
            }
        }
        .onAppear {
            
            if keepSelection {
                normal = selectedItems.contains(.normal)
                hard = selectedItems.contains(.hard)
                soft = selectedItems.contains(.soft)
                diarrhea = selectedItems.contains(.diarrhea)
                constipation = selectedItems.contains(.constipation)
                bloody = selectedItems.contains(.bloody)
            } else {
                normal = false
                hard = false
                soft = false
                diarrhea = false
                constipation = false
                bloody = false
                
                selectedItems.removeAll()
            }
        }
    }
}

#Preview {
    PreviewWrapper()
}

struct PreviewWrapper: View {
    @State private var selectedItems: [DefecationType] = []
    
    var body: some View {
        DefecationRecordAddView(
            selectedItems: $selectedItems,
            addButton: {}
        )
    }
}
