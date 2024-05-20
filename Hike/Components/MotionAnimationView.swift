import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // 隨機位置
    // 使用 CGFloat 取得 View 中的精確位置
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    // 隨機大小
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    // 隨機縮放
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 隨機速度
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    // 隨機延遲
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    // 縮放效果
                    // scaleEffect 為 View 的一個變形效果，可以將視圖放大或縮小
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    }
                    )
            }
        }
        .frame(width: 256, height: 256)
        // 裁剪效果，讓小圓圈不超過 Circle 的範圍
        .mask(Circle())
        // 提高性能，將視圖的內容繪製到單個圖層中
        // .drawingGroup()
    }
}

#Preview {
    ZStack {
        Color.teal.ignoresSafeArea()
        MotionAnimationView()
    }
    
}
