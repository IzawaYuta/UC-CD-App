
import SwiftUI

struct MedicineInfoView: View {
    
    @State private var medicineName: String = "" // お薬の名前
//    @State private var unit: MedicineUnitModel = .normal 
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width:100, height: 100)
                            .padding()
                        Image(systemName: "pill")
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("お薬の名前")
                            Spacer()
                            TextField("", text: $medicineName)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("単位")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("錠")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("用量")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("1回")
                                .foregroundColor(.primary)
                            Text("3錠")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("服用時間")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("起床後")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("時間を追加")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Image(systemName: "plus")
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("在庫")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Text("100錠")
                                .foregroundColor(.primary)
                        }
                    }
                    
                    MedicineCustomBack(height: 50) {
                        HStack {
                            Text("メモ")
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                        }
                    }
                    
                    Button(action: {
                        // 処理
                    }) {
                        Text("保存")
                            .frame(maxWidth: .infinity)
                            .frame(height: 10)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 70)
                    .padding(.vertical, 20)
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }
}

#Preview {
    MedicineInfoView()
}
