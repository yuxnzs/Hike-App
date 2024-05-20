import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            if rowContent != nil {
                Text(rowContent ?? "")
                    .foregroundStyle(Color.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                // Link：點擊後跳轉到指定網址
                Link(
                    rowLinkLabel ?? "",
                    destination: URL(string: rowLinkDestination ?? "")!
                )
                .foregroundStyle(Color.blue)
                .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(Color.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
        .padding(.vertical, 3.5)
    }
}

#Preview {
    List(0 ..< 5) { item in
        CustomListRowView(
            rowLabel: "Designer",
            rowIcon: "paintpalette",
            rowContent: "Taylor Swift",
            rowTintColor: Color.blue,
            rowLinkLabel: "Our website",
            rowLinkDestination: "https://www.apple.com"
        )
    }
}
