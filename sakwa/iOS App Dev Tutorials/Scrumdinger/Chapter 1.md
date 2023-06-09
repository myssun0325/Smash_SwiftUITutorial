# Discover ObserVation in SwiftUI

## Overview
`@Observation`은 Swift macros를 통해 만들어진 매크로?다.  
@Observation 매크로는 컴파일러한테 타입을 관찰(observed) 가능한 확장된 으로 변환하도록 한다.  
이때 새로 나오 매크로를 통해서 뚝딱뚝딱 변환해주는 것 같습니다!

```Swift 
@Observable class FoodTruckModel {
  var order: [Order] = []
  var donuts = Donut.all
}

struct DonutMenu: View {
  let model: FoodTruckModel
    
  var body: some View {
    List {
      Section("Donuts") {
        // 여기!! model 프로퍼티에 접근 시 해당 프로퍼티에 대한 모드 액세스를 탐지할 수 있다.
        // 값이 변하면 UI가 업데이트!
        ForEach(model.donuts) { donut in
          Text(donut.name)
        }
        Button("Add new donut") {
          model.addDonut()
        }
      }
    }
  }
}
```
> 연산 프로퍼티 관련해서도 연산 프로퍼티 값이 변하면 UI 업데이트 된다.


## SwiftUI Property wrappers
### @Bindable


**Property wrapper 사용 기준**
<img width="1329" alt="스크린샷 2023-06-09 22 15 31" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/312a0cc2-7d6c-40e1-a0e3-148db646e938">




## Advanced uses
이건 더 공부해보고 

## ObservableObject


출처 : https://developer.apple.com/wwdc23/10149
