import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [
                    .white,
                    .customGreenLight,
                    .customGreenMedium
                ],
                startPoint: .top,
                endPoint: .bottom))
            
            // 透過 Stroke 在按鈕外面額外加個沒有填充的圓圈（邊框）
            Circle()
                .stroke(LinearGradient(colors: [
                    .customGrayLight,
                    .customGrayMedium
                ],
                startPoint: .top, endPoint: .bottom), lineWidth: 4)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom)
                )
        }
        // 設定按鈕大小
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .padding()
}

