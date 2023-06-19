# ViewLayout
- label에 .font modifier를 적용하면 이미지 사이즈도 변함
```Swift 
Label("", systemImage: "")
    .font(.title)
```
- 배경색 줄 때 (in: Shape)에 모양에 대한 값 넣으면 해당 모양으로 배경색이 들어간다.
```Swift
// Shape 중에서도 InsettableShape 프로토콜을 채택한 Shape여야함
// ex. Rectangle, RoundedRectangle, UnevenRoundedRectangle...
.background(.purple.opacity(0.75), in:Capsule())
```

- `InsettableShape`  
스스로에게 inset 값을 주어 다른 모양을 만들 수 있는 모양 타입

- `UnevenRoundedRectangle`  
UIKit에서는 상단에만 곡선 모서리를 주고 싶을 땐 extension으로 따로 만들어서 했던 것 같은데 SwiftUI에서는 지원을 함.  
<img width="196" alt="upload_ecf23383c846da2875a56f4979d2b91c" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/ffe8d31e-116d-48da-9308-3177d688f50f">


```Swift
UnevenRoundedRectangle(
    cornerRadii: 
        RectangleCornerRadii(
            topLeading: 15, 
            bottomLeading: 0, 
            bottomTrailing: 0, 
            topTrailing: 15
        )
    )
```

```Swift
let keywords = ["chives", "fern-leaf lavender"]
#Preview {
    VStack {
        ForEach(keywords, id: \.self) { word in
            KeywordBubble(keyword: word, symbol: "leaf")
        }
     }
}
```

- `@ScaledMetric`  
사용자의 Dynamic Type 설정에 따라 자동적으로 scale해주는 값  
`relativeTo:` 파라미터를 사용해서 특정 폰트에만 적용도 가능


- Asset 추가  
color asset / image asset 가져오는 방식이 바뀜
```Swift
// 이미지도 동일
// Xcode 14
Color("TextContrast")

// Xcode 15
Color(.textContrast)
```
- 조건을 통해 뷰 숨김 여부 결정 가능한데 if말고 `.hidden modifier가 있는데 어떤 bool 값에 따라 hidden 여부를 주는 게 아니라 그냥 숨김 그 자체인듯..
