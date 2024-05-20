import SwiftUI

struct SettingView: View {
    
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            // Header
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -5) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("健行者之選")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 10) {
                    Text("找到你的完美路線")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    
                    Text("Hike 這款 App 是一個可以讓你找到最佳戶外活動路線的地方。你也可以與他人分享自己的路線。")
                        .font(.footnote)
                        .italic()
                    
                    Text("是時候探索世界！")
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.customGreenDark)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 8)
            }
            .listRowSeparator(.hidden)
            
            
            // Icons
            Section(header: Text("更換 App 圖示")) {
                // ScrollView 只控制滾動行為，所以內容顯示橫的還是要 HStack 包住
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { index in
                            Button {
                                // 設定 App 圖示
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[index]) { error in
                                    if let error = error {
                                        print("Error: \(error.localizedDescription)")
                                    } else {
                                        print("Success: App icon changed to \(alternateAppIcons[index])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[index])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                
                Text("選擇一個你喜歡的 App 圖示")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }
            .listRowSeparator(.hidden)
            
            // 關於
            Section(
                header: Text("關於此應用程式"),
                footer: HStack {
                    Spacer()
                    
                    // © -> option + g
                    Text("Copyright © All rights reserved.")
                    
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                // 基本 LabeledContent 實現
                // LabeledContent("Application", value: "Hike")
                
                // Advanced LabeledContent 實現
                CustomListRowView(
                    rowLabel: "應用程式",
                    rowIcon: "apps.iphone",
                    rowContent: "HIKE",
                    rowTintColor: .blue
                )
                
                CustomListRowView(
                    rowLabel: "相容性",
                    rowIcon: "info.circle",
                    rowContent: "iOS, iPadOS",
                    rowTintColor: .red
                )
                
                CustomListRowView(
                    rowLabel: "技術",
                    rowIcon: "swift",
                    rowContent: "Swift",
                    rowTintColor: .orange
                )
                
                CustomListRowView(
                    rowLabel: "版本",
                    rowIcon: "gear",
                    rowContent: "1.0",
                    rowTintColor: .purple
                )
                
                CustomListRowView(
                    rowLabel: "開發者",
                    rowIcon: "ellipsis.curlybraces",
                    rowContent: "Yucheng Liu",
                    rowTintColor: .mint
                )
                
                CustomListRowView(
                    rowLabel: "設計者",
                    rowIcon: "paintpalette",
                    rowContent: "Yucheng Liu",
                    rowTintColor: .pink
                )
                
                CustomListRowView(
                    rowLabel: "網站",
                    rowIcon: "globe",
                    rowTintColor: .indigo,
                    rowLinkLabel: "Our website",
                    rowLinkDestination: "https://www.apple.com"
                )
            }
        }
        
    }
}

#Preview {
    SettingView()
}
