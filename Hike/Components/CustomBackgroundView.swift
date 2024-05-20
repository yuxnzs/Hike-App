import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // 最底層：深綠色背景
            Color.customGreenDark
                .clipShape(.rect(cornerRadius: 40))
                .offset(y: 12)
            
            // 中間層：淺綠色背景
            Color.customGreenLight
                .clipShape(.rect(cornerRadius: 40))
                .offset(y: 3)
                .opacity(0.85)
            
            // 最上層：Linear Gradient 背景
            LinearGradient(
                colors: [
                    .customGreenLight,
                    .customGreenMedium,
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(.rect(cornerRadius: 40))
        }
        
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}

