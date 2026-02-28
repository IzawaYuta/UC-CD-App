import SwiftUI
import SwiftData

// アプリ内で扱うスキーマバージョンの定義
// 将来的にバージョンを切り替える際の管理用
enum SchemaVersion: Int, CaseIterable {
    case v1 = 1
    case v2 = 2
    
    // 現在使用中のバージョン
    static var current: SchemaVersion { .v1 }
}

// ===== Version 1 スキーマ定義 =====
enum SchemaV1: VersionedSchema {
    
    // スキーマのバージョン識別子（1.0.0）
    static var versionIdentifier = Schema.Version(1, 0, 0)
    
    // V1で管理するモデル一覧
    static var models: [any PersistentModel.Type] {
        [
            DailyRecordModel.self,
            DefecationRecordModel.self,
            MealRecordModel.self,
            MedicineModel.self,
            MedicineUnitModel.self,
            HospitalVisitModel.self
        ]
    }
}

// ===== Version 2 スキーマ定義 =====
enum SchemaV2: VersionedSchema {
    
    // スキーマのバージョン識別子（2.0.0）
    static var versionIdentifier = Schema.Version(2, 0, 0)
    
    // V2で管理するモデル一覧
    // 将来的にプロパティ追加などがあればここに反映
    static var models: [any PersistentModel.Type] {
        [
            DailyRecordModel.self,
            DefecationRecordModel.self,
            MealRecordModel.self,
            MedicineModel.self,
            MedicineUnitModel.self,
            HospitalVisitModel.self
        ]
    }
}

// ===== マイグレーション計画 =====
enum AppMigrationPlan: SchemaMigrationPlan {
    
    // アプリで扱う全スキーマバージョン
    static var schemas: [any VersionedSchema.Type] {
        [SchemaV1.self, SchemaV2.self]
    }
    
    // マイグレーションステージ
    // 現在は変更がないため空
    // 将来、V1→V2でデータ変換が必要になったらここに追加
    static var stages: [MigrationStage] {
        []
    }
}

@main
struct UC_CD_AppApp: App {
    
    // SwiftDataの永続コンテナ
    let container: ModelContainer
    
    init() {
        // 使用するスキーマを指定（現在はV1）
        let schema = Schema(versionedSchema: SchemaV1.self)
        
        // 永続化設定
        // isStoredInMemoryOnly: false → ディスク保存
        // allowsSave: true → 書き込み許可
        let configuration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            allowsSave: true
        )
        
        do {
            // マイグレーション計画を指定してコンテナ生成
            container = try ModelContainer(
                for: schema,
                migrationPlan: AppMigrationPlan.self,
                configurations: configuration
            )
        } catch {
            // コンテナ生成失敗時はクラッシュさせる
            fatalError("Failed to create ModelContainer: \(error.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .onAppear {
                    // アプリ起動時に初期データをチェック
                    initializeDefaultData()
                }
        }
        .modelContainer(container)
    }
    
    // 初期データ（MedicineUnit）の存在確認と挿入
    private func initializeDefaultData() {
        let context = container.mainContext
        
        // MedicineUnitModel全件取得用ディスクリプタ
        let descriptor = FetchDescriptor<MedicineUnitModel>()
        
        do {
            // 既存データ取得
            let existingUnits = try context.fetch(descriptor)
            
            // 何も存在しない場合のみデフォルト挿入
            if existingUnits.isEmpty {
                try? MedicineUnitInitializer.insertDefaultIfNeeded(context: context)
            }
        } catch {
            // 取得失敗時はログ出力のみ
            print("Failed to check existing data: \(error)")
        }
    }
}
