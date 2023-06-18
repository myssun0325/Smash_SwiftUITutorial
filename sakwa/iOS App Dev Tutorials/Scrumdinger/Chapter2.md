`.labelStyle()`  
기본으로 지원하는 .automatic, .iconOnly, .titleAndIcon, .titleOnly 말고도 LabelStyle을 상속 후 makeBody 메서드를 구현해주면 커스텀 스타일 생성 가능.  
-> 예시의 텍스트, 아이콘 순서 바꾸기나 VStack으로 만들수도 다양하게 활용 가능할 듯

`.listRowBackground()`  
이 modifier는 매개변수로 색상 말고 view를 넣을 수가 있다!
```Swift
CardView()
    .listRowBackground(
        VStack {
            Image(systemName: "star")
            Text("별이다~!")
        }
    )
```
<img width="301" alt="스크린샷 2023-06-18 21 05 38" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/efc9520c-d315-4083-88c9-c68e43f900e4">


