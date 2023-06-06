# Chapter 2 - Drawing and Animation

## Drawing Paths ans Shapes

### Key Words
- `GeometryReader`

- `@frozen`  
struct / enum에 적용하는 attribute.  
타입에 대한 변화를 제한 할 수 있음. (enum에서는 case가 추가적으로 생겨나지 않는 것을 명시).  
컴파일러가 library evolution mode가 아니면 모든 struct와 enum은 암시적으로 frozen이고 해당 attribute는 무시됨.  
Link: [Attributes 문서](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/)

## Animaing Views and Transitions

### Key Words
- `asymmetric`  
나타날때와 사라질때의 애니메이션을 다르게 줄 수 있음

- `.combined(with: )`   
전환하느 효과들을 결합하는 용도?
```swift
// trailing에서 이동하면서 투명 -> 불투명 전환
.move(edge: .trailing).combined(with: .opacity)
```

## Review
Drawing Paths ans Shapes 내용은 사실 GeometryReader 라는 도화지 위에 Path나 Shape를 사용해서 그림을 그리는게 다였던 챕터라 차근차근해서 이해하는데에는 어려움이 없던 것 같다.   
Animating Views and Transitions 내용에서는 뷰에다가 애니메이션을 준다거나 전환 효과에 대한 내용들이여서 재밌게 튜토리얼을 진행했었다.   
UIKit을 사용할 땐 사실 라인같은 것을 사용해서 그림을 그려본 상황이 없었고 애니메이션 효과도 그리 많지는 않았었는데 SwiftUI로는 애니메이셔 효과를 쉽게 줄 수 있을 것 같아 깊게 더 공부해봐서 나중에 애니메이션 효과 잔뜩 넣는 작업도 해보고싶다.









