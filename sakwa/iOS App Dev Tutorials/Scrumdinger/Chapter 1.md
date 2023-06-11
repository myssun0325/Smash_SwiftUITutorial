# Discover ObserVation in SwiftUI

## Overview
`@Observation`은 Swift macros를 통해 만들어진 매크로?다.  
@Observation 매크로는 컴파일러한테 타입을 관찰(observed) 가능한 확장된 으로 변환하도록 한다.  
이때 새로 나오 매크로를 통해서 뚝딱뚝딱 변환해주는 것 같습니다!

```Swift 
@Observable class FoodTruckModel {
  var order: [Order] = []
  var donuts = Donut.all
  var orderCount: Int { orders.count } 
}

struct DonutMenu: View {
  let model: FoodTruckModel
    
  var body: some View {
    List {
      Section("Donuts") {
        // model 프로퍼티에 접근 시 해당 프로퍼티(donuts?)에 대한 모드 액세스를 탐지할 수 있다.
        ForEach(model.donuts) { donut in
          Text(donut.name)
        }
        Button("Add new donut") {
           // 값이 변하면 UI가 업데이트!
          model.addDonut()
        }
      }
      
      Section("Orders") {
        // LabeldContent를 그려주기 위해서 Model에 접근하게 되고 (orders.count) 때문에 orders 프로퍼티에 접근 가능
        LabeledContent("Count", value: "\(model.orderCount)")
      }
    }
  }
}
```
> 연산 프로퍼티 관련해서도 연산 프로퍼티 값이 변하면 UI 업데이트 된다. (Orders 부분) 


## SwiftUI Property wrappers
### @Bindable
단순하게 바인딩을 가능하게 만들어준다.  
@Binding에서 사용했던 것 처러 `$` 붙여주면 된다.
```Swift
@Observable class Donut {
  var name: String
}

struct DonutView: View {
  @Bindable var donut: Donut
  // var donut: Donut

  var body: some View {
    TextField("이름", text: $donut.name)
    // Text(donut.name)
  }
}
```


**Property wrapper 사용 기준**
<img width="1329" alt="스크린샷 2023-06-09 22 15 31" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/312a0cc2-7d6c-40e1-a0e3-148db646e938">


> 뒤에 Advanced Use나 ObservableObject를 @Observable로 바꾸는 내용도 있는데 관심있으시며 꼭꼭!! 챙겨보는시는 강추 드립니다!!   

WWDC 영상 - Discover Observation in SwiftUI : https://developer.apple.com/wwdc23/10149
