- `.toolBar` 위치 수정
ToolbarItem의 placement 매개변수에 위치 전달하면 가능
```Swift
ToolbarItem(placement: .topBarLeading) {
    Button(action: {} ) {
        Image(systemName: "plus")
    }
    .frame(width: 30)
    // UIKit과 같이 사이즈는 못바꾸고 자동으로 너비가 결정되는 듯? (42~45)
}
```
<img width="316" alt="upload_2acde6f80c423416988e721e0b49833a" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/76aacac7-b0ad-4cdf-92a0-b1fe8ea0f4a8">


- `Section(header: ,content:)` Deprecated..
```Swift
// Deprecated
init(header: Parent, @ViewBuilder content: () -> Content)

// Use instead
init(@ViewBuilder content: () -> Content, @ViewBuilder header: () -> Parent)
```

- `Form`
Stack처럼 여러가지 뷰를 담을 수 있는 컨테이너 뷰.  
설정 앱처럼 꾸밀 때 사용해 볼 수 있을 것 같다!!

- `.onDelete`
DynamicViewContent의 프로토콜 안에 선언되어있는 메서드로 예제에는 ForEach에 modifier로써 하나의 행을 삭제하는 행동을 한다.
```Swift
ForEach(scrum.attendees) { attendee in
    Text(attendee.name)
}
.onDelete { indices in
    scrum.attendees.remove(atOffsets: indices)
}
```
그럼 ForEach가 DynamicViewContent 프로토콜을 채택하고 있는건가? 맞다.. 그래서 body 안에서 for보다 ForEach 사용해 Content를 반환하고 뷰를 그리고 있었던 것이다..!
ForEach 도큐먼트 가면 다 있었는데 몰랐었네요!!

```Swift
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ForEach : DynamicViewContent where Content : View {
}
```
[ForEach Documentation](https://developer.apple.com/documentation/swiftui/foreach)
