# Chapter 1 - SwiftUI Essentials

### Info

1. View를 그룹화하는 것에다가 modifier를 사용하면 그 안에 View들도 적용됨
<img width="397" alt="스크린샷 2023-05-23 22 57 18" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/5254e918-6d25-4e80-be6e-45a0310f53d6">     


2. List 사용시 간략   
모델이 Identifiable 프로토콜을 채택하도록 해 ID값을 강제하면 간략하게 사용가능   

| <img width="302" alt="스크린샷 2023-05-26 23 34 15" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/93a40527-35e2-42ab-a127-47c1d6053814"> | -> | <img width="271" alt="스크린샷 2023-05-26 23 34 30" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/aa491f1e-9a1a-4573-becf-5c0052a37aea"> |
|---|---|---|   


3. List listStyle 변경
```Swift
List {
  // View
}
.listStyle(.plain) // default가 .grouped
```


4. NavigationView - Deprecated => NavigationStack / NavigationSplitView 를 사용하라고 하네요!!   
[NavigationView](https://developer.apple.com/documentation/swiftui/navigationview)   
[WWDC22 - The SwiftUI cookbook for navigation](https://developer.apple.com/videos/play/wwdc2022/10054/)


### Key Words
- `App`    
앱의 시작점으로 해당 프로토콜을 채택하고 있는 구조체는 Scene프로토콜 타입의 body를 갖는다.   
Link: [App | Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/app)   
관련 키워드: `@main`, `Scene`, `WindowGroup`
  
- `@State`    
프로퍼티를 읽고 쓸수있는 property wrapper 타입   
인스턴스같은 참조타입을 저장하려면 `StateObject`를 사용하면 된다
관련 키워드: `$`, `StateObject`

-  `.constant(_ value: Value)`    
불변의 value값으로 고정 -> Preview에서 어떤 값으로 화면을 고정해서 보여줄 때 유용하게 사용 가능
```Swift
// FavoriteButton의 isSet 프로퍼티의 값을 true로 고정
FavoriteButton(isSet: .constant(true))
```

- `EnvironmentObject`   
하위 뷰에 데이터를 전달할때 사용!!   

### Question
- Xcode 14에서 `previewDevice()` 이거 사용하면 Preview에서 해당 디바이스로 나와야하는 것 같은데 안나오네요.. 빌드할 기기를 선택하면 Preview의 디바이스가 변경됩니다
