# Chapter 4 - Framework Integration

## Key Words

- `UIViewControllerRepresentable`


SwiftUI 인터페이스에서 UIViewController를 컨트롤하기 위해 해당 프로토콜을 채택해 사용

`makeCoordinator()` : ViewController에서 SwiftUI 인터페이스로 변경사항을 전달하기 위한 인스턴스 생성

`makeUIViewController(context:)` : UIViewController를 생성하고 초기화함

`updateUIViewContorller(*, context:)` : ViewController 업데이트가 필요할때 호출됨

`dismantleUIViewController(_: coordinator:)` : ViewController와 관련된 것을 정리할 때 사용

> 비슷하게 UIViewRepresentable도 있음
- `LinearGradient` 

UIKit에서는 startPoinst랑 endPoint가 CGPoint 타입이여서 특정 값을 넣어줬던 반면 SwiftUI에서는 UnitPoint 타입이여서 편하게 .top, .leading 같은 것으로 표현 가능
물론, CGFloat값 넣어서 생성도 가능

> UnitPoint: [https://developer.apple.com/documentation/swiftui/unitpoint](https://developer.apple.com/documentation/swiftui/unitpoint)
- `.lineLimit`

기본은 nil (모든 내용 다 보여줌)

0보다 작은 경우엔 1과 동일한 효과
- `Aligment(horizontal: , vertical: )`

```swift
// 둘은 동일
// Alignment = HorizontalAlignment + VerticalAlignment
ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top))
ZStack(alignment: .topTrailing)
```

<img width="450" alt="111" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/f79bc44e-2e02-4701-aa5a-cd1a626d8d99">

- `Commands` 

맥에서는 상단바에 메뉴들이 생김. 패드나 폰에서는 시뮬레이터에서는 커맨드 키 길게 누르면 메뉴 뜨고 단축어 사용하게끔 되어있음
`CommandMenu` 로 커스텀 메뉴를 생성 가능
- `FocusedValue` : focus 된 뷰나 상위 뷰로 부터 값을 관찰 가능

환경 요소를 관찰하는 것이 아니라 뷰 계층에서의 포커싱된 뷰를 관찰함 (Environment와 차이점)

`FocusedValueKey` : 이 프로토콜을 채택해서 관찰할 값의 타입을 정의하는 구조체를 생성 

`@FocusedBinding` : FocusedValue는 get-only이기 때문에 이 property wrapper를 사용해서 값을 변경하고 싶을 때 사용해서 값 변경 가능

> [https://swiftwithmajid.com/2021/03/03/focusedvalue-and-focusedbinding-property-wrappers-in-swiftui/](https://swiftwithmajid.com/2021/03/03/focusedvalue-and-focusedbinding-property-wrappers-in-swiftui/)

### Question

- Q: `ZStack`과 `.overlay`의 차이점?

A: [https://eunjin3786.tistory.com/339](https://eunjin3786.tistory.com/339)

### Info

- Property Wrappers 종류 정리된 블로그!

링크 : [https://swiftuipropertywrappers.com](https://swiftuipropertywrappers.com/)
- UIViewRepresentable랑 UIViewControllerRepresentable 은 같은 생명주기를 갖고 있음
- NavigationStack 쓰면 macOS에서 튜토리얼 처럼 안나옴 → 그럴땐 NavigationSplitView
<img width="604" alt="111" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/79f9e0de-83c7-466c-8e26-7a0b2c27c1c2">
<img width="629" alt="222" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/58569013-bea9-4da2-a62e-30455a5029d3">


```swift
NavigationSplitView(sidebar: {
            List {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue)
                                    .tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorite only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        }, detail: {
            Text("Select a Landmark")
        })
```
