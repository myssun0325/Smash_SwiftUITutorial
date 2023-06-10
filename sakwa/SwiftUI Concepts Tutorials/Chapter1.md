# Chapter 1 - SwiftUI Essentials

### Info
- `LazyVStack`
VStack과 다르게 많은 item이 있는 경우 활용
화면에 item에 표현되기 전에 item을 생성해서 성능 이득을 봄 

> 근데 왜 "Lazy"가 붙으면 init이 두번 호출되는 것 일까?
```Swift
// 서브 뷰 생성하는 부분
ForEach(1..<101) {
    Subview(number: $0)
}

// 서브 뷰
struct Subview: View {
    @State private var number: Int
    
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, \(number) world!")
        }
    }
    
    init(number: Int) {
        print("init with \(number)")
        self.number = number
    }
}
```
- `.padding()`
padding 값이 nil인 상태에서는 한단계 상위 뷰에 딱 맞는 레이아웃을 갖고 있다.
그래서 @main에서의 Scene에 들어가는 뷰(소스 상에서는 ContentView)는 처음에 safeArea 영역을 다 침범하고 있지만 1이라도 설정이 되면 safeArea 기준으로 padding이 설정된다.
