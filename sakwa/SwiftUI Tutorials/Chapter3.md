# Chapter 3 - App Design and Layout

## Info

1. .listStyle에서의 .plain과 .inset의 차이점!?
디폴트는 .automatic == .insetGrouped / .plain과 .inset은 똑같아 보이는데 무슨 차이지?

- .plain:   
`.plain` 스타일은 각 행을 구분하지 않고 간단한 목록으로 표시합니다.  
 각 행이 서로 구분되지 않고 밝은 배경을 가지며, 행 사이에 구분선이 표시되지 않습니다. 이 스타일은 일반적으로 간단한 목록을 나타내는 데 사용
- .inset:  
`.inset` 스타일은 각 행을 구분하고 목록 행의 주위에 들여쓰기를 추가합니다.  
 행 간 구분선이 표시되며, 선택된 행은 강조 표시됩니다. 이 스타일은 목록에 구조를 주고 시각적으로 행을 구분하는 데 사용됩니다. `.inset` 스타일은 주로 계층 구조를 가진 목록이나 설정 메뉴와 같은 경우에 유용

<img width="312" alt="스크린샷 2023-05-30 23 31 37" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/da89c4a4-4aa3-44bc-80e5-ca958cd12c82">   

.listStyle(InsetListStyle(alternatesRowBackgrounds: true)) 로 했을때   

링크 : https://peterfriese.dev/posts/swiftui-listview-part3/

## Key Words

- `.listRowInsets(_ insets: EdgeInsets?)`  
  리스트 아이템들의 기본 padding값을 변경<

- `TabView`  
  TabView안에 담긴 View(보여줄 뷰)에다가 .tabItem modifier를 적용해서 만듬  
  .tabItem에는 Tab에 표현할 View를 만들어주면 된다
- `accessibilityLabel`
- `hueRotation`   
   색조(색상)을 변경 0, 360, 720은 변화 없음 ⇒ 0 ~ 359 랑 360 ~ 719 변화는 동일
- `.sheet` `.fullScreenCover`  
화면 전환!!
- `@Environment`  
환경과 관련된 여러 값을 갖고 있음

- `Menu`   
UIKit에서는 Context Menu라고 앱이나 사진을 3D 터치할 때 나오는 메뉴 뷰와 비슷  
간단한 필터나 간단한 선택을 하는 뷰가 필요할 때 유용해보임
- `Picker` 와 `.pickerStyle()`
