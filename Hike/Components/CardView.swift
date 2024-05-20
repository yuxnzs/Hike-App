import SwiftUI

struct CardView: View {
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
            // 如果隨機數字與現在數字一樣，就會一直重複直到不一樣
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("健行")
                            .fontWeight(.black)
                        // .system 為系統字型
                            .font(.system(size: 52))
                        // 字元間距
                            .tracking(7)
                            .foregroundStyle(
                                LinearGradient(colors:[
                                    .customGrayLight,
                                    .customGrayMedium
                                ], startPoint: .top, endPoint: .bottom)
                            )
                        
                        Spacer()
                            .frame(width: 75)
                        
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingView()
                                // 顯示給使用者的關閉拖曳指示器
                                .presentationDragIndicator(.visible)
                                // sheet 點開放大後的大小
                                // 一開始為 .medium 50% 的大小，並且可以放大到 .large 100% 的大小
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("享受與家人及朋友的戶外時光")
                        .multilineTextAlignment(.leading)
                        .fontWeight(.black)
                        .foregroundStyle(Color.customGrayMedium)
                        .tracking(2)
                }
                .padding(.horizontal, 30)
                
                
                // 圖片
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 0.5), value: imageNumber)
                }
                
                // 底部按鈕
                Button {
                    randomImage()
                } label: {
                    Text("探索更多")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25),
                                radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
                
            }
        }
        .frame(width: 320, height: 570)
        
        
    }
    
}

#Preview {
    CardView()
}

