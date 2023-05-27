<h1><center> Data Flow Through SwiftUI [1주차] </center></h1>

###### tags: `💻 WWDC 스터디`
> [color=#724cd1][name=데릭]
> [Data Flow Through SwiftUI - wwdc](https://developer.apple.com/videos/play/wwdc2019/226/)

> [Blog](https://wlaxhrl.tistory.com/91)

> WWDC 2019 Session 중 하나인 `Data Flow Through SwiftUI`에 대해 알아보자

# 개요
SwiftUI는 UI개발의 복잡성을 해결하기 위해 새롭게 고안된 툴이다. 

## SwiftUI에서 살펴볼 사항들

**Principles of Data Flow**

- SwiftUI는 View의 계층에서 데이터를 Flow를 타는 툴이다.(View 계층에서 데이터가 왔다갔다 하는 것을 말한다.)

**Anatomy of an Update**

- SwiftUI는 항상 정확하고 일관된 데이터의 표현을 위해 뷰 계층을 업데이트한다. 내부적으로 어떻게 하는지 알아보자.

**Understanding Your Data**

- SwiftUI에서 제공해주는 Tool로 데이터에 어떤 게 적합한지 이해해보자.


## 데이터란?

SwiftUI에서 데이터는 `First Class Citizen`이다. 여기서의 데이터란 UI를 Drive하는 모든 정보들을 말하는 것이고, 다양한 형태를 가지고 있으며 모든 것이 데이터가 될 수 있다. 

**일급객체**
- 변수에 저장이 가능한가?
- 매개변수로 전달이 가능한가?
- 리턴값으로 사용가능한가?

예) Toggle State, Message Model을 가지는 객체 등 

## SwiftUI를 이해하기 위한 두가지 원칙

### 1. View에서 Data를 읽을 때마다 View는 Data에 의존성이 생긴다. 

- 데이터가 변경될 때마다 뷰는 새로운 값을 반영해야하기 때문에 의존성이 발생한다.

![](https://i.imgur.com/z9dboOm.png)
> 예제그림 01) View에 Data 의존성 부여

`PlayerView`에서 `isPlaying`(Bool Type의 Property) 데이터를 읽어야한다고 가정해보자.

`isPlaying` 에서 데이터가 변경될 때마다 `PlayerView`를 업데이트해야한다.

SwiftUI이전에는 코드로 직접 업데이트를 처리해야 했지만 더 이상 데이터와 뷰의 동기화를 따로 해줄 필요가 없어졌다. SwiftUI는 선언적(Declarative)이기 때문에 Data Dependency(데이터에 대한 의존성)을 지침만 따르면 나머지를 알아서 처리해준다. 

### 2. View의 계층에서 읽어들이는 모든 데이터들은 Source of Truth를 가진다. 

![](https://i.imgur.com/AUdvZSo.png)

> 예제 그림 02) SSOT

View에서 읽는 모든 데이터들은 결국 하나의 Source를 가진다는 뜻이다.

**NOTE**
> SSOT(Single Source of Truth): 데이터가 여러 곳에 존재하지 않고 오직 한 곳에서만 존재한다.

만약 데이터가 중복되어 존재할 경우, 항상 Sink를 맞춰야 한다. 일관적인 UI를 유지하는 것이 어렵고, 버그가 발생할 가능성이 높다.

![](https://i.imgur.com/ons5ExD.png)

> 예제 그림 03) 각각 Data를 가지고 있는 경우 Sink가 다를 수 있는 예제

> 예를 들면 위 그림에서는 View 두 개 각각을 위한 isPlaying 데이터가 각각 존재할 때,  `Notification`, `KV observing`, 그 외의 다른 이벤트 등으로 하나의 `isPlaying` 값이 변할 경우에는 항상 다른 하나의 `isPlaying` 값도 싱크를 맞춰 변경되어야 한다. 이런 복잡성이 버그를 유발한다.

![](https://i.imgur.com/mopQcDh.png)

> 예제 그림 04) 상위 View가 변수를 가지고 있게 해서 하위 뷰의 변수들의 Sink를 맞추는 예제

```swift
    final class VideoView: UIView {
        private var topMenu = VideoTopMenuView(frame: .zero)
        private var playControl = VideoPlayControlView(frame: .zero)
        
        /// 각 서브 뷰에서 isPlaying 변수를 가지고 있을 때, 이 데이터들의 싱크가 맞아야 일관된 UI를 가질 수 있다.
        var isPlaying: Bool = false {
            didSet {
                self.topMenu.isPlaying = self.isPlaying
                self.playControl.isPlaying = self.isPlaying
            }
        }
    }
```

## @State

![](https://i.imgur.com/T0rUUzZ.png)

> 예제 그림 05) 팟케스트 플레이어


```swift 
    struct PlayerView: View {
        let episode: Episode
        @State private var isPlaying: Bool = false
        
        var body: some View {
            VStack {
                Text(episode.title)
                    Text(episode.showTitle)
                .font(.caption)
                .foregroundColor(.gray)
                
        Button(action: {
            self.isPlaying.toggle()
        }) {
           Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }                
     }
   }
}

```

@State 프로퍼티 랩퍼를 적용해서 `해당 프로퍼티의 값이 변경될 수 있으며, 데이터 값에 따라 Self(PlayView)의 상태가 변경될 수 있다`를 시스템에 알린다.

![](https://i.imgur.com/bCuxPQN.png)

> 예제 그림 06) 부모 뷰가 State 프로퍼티를 가질 때

@State를 사용하면, `isPlaying` 변수를 영구적인 저장공간에 할당하여 시스템이 의존성을 가지게 되어 추적하게 된다. 일반적인 뷰는 시스템에 의해 자주 재생성되지만, @State가 붙으면 뷰가 여러 번 업데이트되어도 계속 저장공간에서 데이터 값을 유지한다. 

- 뷰 안에서만 `isPlaying`의 상태를 관리한다는 것을 확실히 하기 위해 private으로 처리한다.

@State 변수의 값이 변할 때 뷰의 렌더링이 달라져야 한다는 것은 SwiftUI에서 감지하게 된다.

![](https://i.imgur.com/7NrxkYR.png)

> 예제 그림 07) 부모 뷰와 하위 뷰 Sink

**`isPlaying`의 값이 `True`로 변하면 어떻게 될까?**

![](https://i.imgur.com/wIQYaFN.png)

> 예제 그림 08) isPlaying True일 때

유저의 인터랙션에 따라 재생 버튼의 액션이 실행되고, isPlaying 이라는 State 변수 값이 변하고, State가 변경되었으므로 뷰 자신과 자식 뷰들의 Body가 모두 새롭게 랜더링된다. (Button > isPlaying 값 변경 > PlayerView > 자식뷰인 Text, Text, Button 에 각각 전파 > 전체적인 뷰가 갱신됨) 단, 프레임워크에서 오직 변경된 것에 대해서만 다시 렌더링해주기 때문에 이 과정은 효율적으로 수행된다.

이런 Flow를 Framework가 Dependency를 관리해준다고 하는 것이다.

**NOTE**

> State를 정의할 때마다, 뷰가 소유하는 Source of truth가 새롭게 하나 정의된다는 것을 기억하자.

> 뷰는 더이상 연속된 이벤트의 집합이 아니다. 상태를 가지는 함수이다.

이전 방식은 직접적으로 View 계층을 변경하는 방법으로 이벤트에 응답했다.

예) 유저의 인터랙션이 발생할 때마다 직접 서브뷰를 추가/제거하거나 뷰의 알파값을 변경하는 코드를 실행하는 방식.

**SwiftUI**

![](https://i.imgur.com/Yg3XCeG.png)

> 예제 그림 09) SwiftUI에서 State의 역할

단순히 상태(State)만을 변경하면 된다. State가 Source of truth로써 동작하며, 자연스럽게 뷰가 변경된다. 이 부분이 선언적 구문이 빛나는 부분이다.

### 예제 코드

```swift 
// 기존의 완전히 수동적인 방식
class SampleView: UIView {
    var isHiddenCircle: Bool = false {
        didSet {
            self.circle.isHidden = self.isHiddenCircle
        }
    }
    var isHiddenRect: Bool = false {
        didSet {
            self.rect.isHidden = self.isHiddenRect
        }
    }
}

// 위를 조금 더 개선한 방식
class SampleView: UIView {
    var isHiddenCircle: Bool = false {
        didSet { self.updateAppearance() }
    }
    var isHiddenRect: Bool = false {
        didSet { self.updateAppearance() }
    }
    
    private func updateAppearance() {
        self.circle.isHidden = self.isHiddenCircle
        self.rect.isHidden = self.isHiddenRect
    }
}

// SwiftUI 방식
// 바로 위 코드와 비교해보면 원리는 같지만 좀 더 선언적인 문법, 효율성을 지님.
// 또한 @State & body 규약을 통해 예측 가능한 가독성 있는 코드이기 때문에
// 기존의 코드 룰을 모르는 제3자가 이 뷰를 건드릴 때에도 실수를 방지할 수 있다
// 이렇게 문법적으로 규약을 만들어 놓는 것의 장점이라고 생각한다
struct SampleView: View {
    @State var isHiddenCircle: Bool = false
    @State var isHiddenRect: Bool = false
    
    var body: some View {
        Circle()
            .isHidden(self.isHiddenCircle)
        Rectangle()
            .isHidden(self.isHiddenRect)
    }
}

```

## Binding

예제에서 여러 개의 재사용 가능한 컴포넌트로 UI를 분리해보자.

```swift 
    struct PlayerView: View {
        let episode: Episode
        @State private var isPlaying: Bool = false
        
        var body: some View {
            VStack {
                Text(episode.title)
                    Text(episode.showTitle)
                .font(.caption)
                .foregroundColor(.gray)
                
        Button(action: {
            self.isPlaying.toggle()
        }) {
           Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }                
     }
   }
}

// -> Button을 분리하자

    struct PlayButton: View {
        @State private var isPlaying: Bool = false
        
        var body: some View {

        Button(action: {
            self.isPlaying.toggle()
        }) {
           Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
   }
}
``

**문제점**

이렇게 분리하면 PlayButton의 isPlaying 프로퍼티는 또 다른 `Source of truth`를 만든다.

- PlayButton의 State 프로퍼티는 SuperView인 PlayView의 State와 항상 싱크가 되도록 구성한다. (isPlaying이라는 상태 데이터는 한 번에 한 곳에만 존재하면 되는 데이터이다.) PlayButton은 자신의 isPlaying을 따로 소유할 필요가 없으며, 단순의 PlayView가 소유하는 isPlaying 프로퍼티를 읽거나 변경할 수 있으면 된다.

```swift
  struct PlayButton: View {
        @Binding var isPlaying: Bool

        var body: some View {

        Button(action: {
            self.isPlaying.toggle()
        }) {
           Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
   }
      
   struct PlayerView: View {
    let episode: Episode
    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode.title)
                Text(episode.showTitle)
            .font(.caption)
            .foregroundColor(.gray)

    PlayButton(isPlaying: $isPlaying)        }
    }
}
```

**NOTE**

> PlayButton은 isPlaying 값의 복사본을 가지는 것이 아니라, 단순히 PlayView(SuperView)의 isPlaying 프로퍼티를 참조하는 것이다. 따라서 프로퍼티 간의 싱크를 신경쓸 필요가 없다.

> SuperView입장에서 보면, Binding은 자신의 State 프로퍼티에 대한 접근을 다른 컴포넌트에게 허용하는 것이다.


![](https://i.imgur.com/fkQSE9I.png)

> 예제 그림 09) SwiftUI이전의 방식

뷰 컨트롤러의 서브 뷰들이 동일한 프로퍼티를 각각 들고 있는 방식이다. 이런 구조에서는 뷰 컨트롤러에서 데이터의 값이 변경되면 자신의 모든 서브 뷰들에게 새로운 값을 셋팅해주는 과정(데이터 싱크를 맞추는 과정)이 필요하다.

![](https://i.imgur.com/76qXsFH.png)

> 예제 그림 10) SwiftUI 방식

데이터 Dependency를 정의하면 프레임워크가 나머지를 알아서 처리한다.

![](https://i.imgur.com/LwK1Rs4.png)
> 예제 그림 10) SwiftUI Binding 예제 코드

```swift 
// UIKit의 UISlider
class SampleView: UIView {
    
    var sliderValue: Float = 0 {
        // UI 싱크를 맞추기 위해 아래와 같은 처리들을 하는 경우가 종종 있었다
        didSet { self.slider.value = self.sliderValue }
    }
    
    private let slider = UISlider(frame: .zero)
}


// SwiftUI의 Slider
struct SampleView: View {
    
    // 이 값이 변경되면 자동으로 UI도 갱신된다
    @State var sliderValue: Float = 0
    
    var body: some View {
        Slider(value: $sliderValue)
    }
}

```


## Working With External Data

![image](https://github.com/derrickkim0109/WWDC-Study/assets/59466342/85357c84-437a-45bd-b68a-35ccb4a9a764)

> 예제 그림 11) SwiftUI 외부 데이터

SwiftUI에는 데이터 관리를 위한 많은 방법들이 있다. 

@Environment, ObservableObject에 대해 알아보자. 

- Timer fired > State 변경
- Notification > State 변경
- 그 외 등등 > State 변경


![image](https://github.com/derrickkim0109/WWDC-Study/assets/59466342/6862756e-4398-40c9-8272-67eb043dfc12)

이처럼 SwiftUI에서는 외부 이벤트라도 결국 State의 변화로 이어진다. 즉, 앞의 예제에서 유저의 interaction(Action)이 발생해 State가 변경되었던 것과 결과적으로 차이가 없다.

- 이런 외부 이벤트들을 Publisher라고 한다. Publisher는 Combine Framework로부터 발생된 것이다. 
    - Combine은 시간에 따라 값을 처리하기 위해 선언적인 API

## Publisher 적용

```swift 
   struct PlayerView: View {
    let episode: Episode
    @State private var isPlaying: Bool = false
    @State private var currentTime: TimeInterval = 0.0

    var body: some View {
        VStack {
            Text(episode.title)
            .foregroundColor(isPlaying ? .white : .gray)
                Text(episode.showTitle)
            .font(.caption)
            .foregroundColor(.gray)

    PlayButton(isPlaying: $isPlaying) 
    
    Text("\(currentTime, formatter: currentTimeFormatter)")
        }
        .onReceive(PodcastPlayer.currentTimePublisher) { newCurrentTime in
            self.currentTime = newCurrentTime
        }
    }
}

```

VStack 하단에 onReceive modifire를 추가하였다. 이제 타임스탬프가 변경되면 onReceive 블럭 안에서 currentTime 이 새로운 값으로 변경될 것이다. currentTime 은 State 변수이다. 따라서 State가 변경된 것으로 취급되고, body 를 통해 뷰의 렌더링이 다시 이루어진다. 그러면 currentTIme 에 대한 UI 갱신이 자동으로 이루어진다. 이런 과정을 거치는 동안 수동으로 작성된 코드나 invalid 체크 코드는 필요하지 않다는 것이 장점이다.

NOTE
>부연설명: onReceive 는 Combine에서 제공해주는 것으로, Publisher가 receive(on:) 메서드를 통해 특정 큐/쓰레드에서 돌도록 지정한 것을 여기서 받아 처리할 수 있게 된다. 위 코드는 현재 타임스탬프가 변경될 때 fire되는 Publisher가 미리 작성되어 있다는 가정 하에 작성된 것이다.

## ObservableObject

- ObservableObject 는 이미 소유/관리중인 모델이 있을 경우, 이 모델과 뷰의 동기화를 편하게 만들어주는 프로토콜들이다.
    - 데이터가 변경되었을 때, 그 상태를 알릴 필요가 있는 모델이라면(=값의 변경을 외부에서 감지할 필요가 있는 모델) ObservableObject 프로토콜을 따르도록 하자.

```swift 
protocol ObservableObject : AnyObject
```

```swift 
class PodcastPlayerStore {
    var currentTime: TimeInterval
    var isPlaying: Bool
    var currentEpisode: Episode
    
    func advance() { ... }
    func skipForward() { ... }
    func skipBackward() { ... }
}
```

- 싱크를 맞추기 위해 사용할 모델을 하나 정의하였다. 이제 이 모델을 ObservableObject 프로토콜에 따르게 해보자.

> 이 프로토콜이 요구하는 것은 데이터가 변경되었을 때를 위한 Publisher이며 objectWillChange 프로퍼티에 이 Publisher를 정의해두어야 한다.

```swift 
class PodcastPlayerStore: ObservableObject {
    
    // ...
    
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    func advance() {
        self.currentEpisode = nextEpisode
        self.currentTIme = 0.0
        // Notify subscribers that the player changed
        self.objectWillChange.send()
    }
}

```

위 코드에서는 objectWillChange 프로퍼티에 PassthroughSubject 라는 Publisher를 하나 정의하였고, 데이터의 변경이 발생하는 advance() 메서드 안에서 이 Publisher의 send() 를 호출해주고 있다. 이 Publisher를 subscribe 하여 데이터의 변경 시점을 정확히 알 수 있게 된다. 즉, 언제 뷰를 업데이트해야 할지 알게 된다는 것이다.

![](https://hackmd.io/_uploads/S1xc2t8XEn.png)

> 예제그림 12) ObservedObject

> View는 @ObservedObject라는 Property Wrapper를 사용해 ObservableObject Model에 의존할 수 있다. Automatic dependency tracking(모델이 변경될 때 뷰가 알아서 변경됨) 관점에서만 보면 앞서 다루었던 @State 와 다르지 않다.

> MVVM 예제코드를 보면 ViewModel이 채택하고 있음
[SwiftUI - MVVM](https://github.com/stevencurtis/SwiftCoding/tree/master/SwiftUI/MVVMNetworking/MVVMNetworking)


```swift 
struct MyView: View {
    @ObservedObject var model: PodcastPlayerStore
    ...
}

MyView(model: modelInstance)

```

MyView는 PodcastPlayerStore모델의 상태가 변경될 때(ex: 다음 에피소드 재생을 위한 advance 함수가 불렸을 때) 자동으로 그것을 알아채고 뷰를 업데이트할 수 있게 되었다.

## EnvironmentObject

SwiftUI의 Environment는 뷰 계층에게 데이터를 넣어주는 캡슐화 방법이다.

![](https://hackmd.io/_uploads/SyXQsLX4n.png)

> 예제그림 13) EnvironmentObject

`.environmentObject(_:)` 를 통해 PodcastPlayerStore를 Environment로 만들고, MyView 에서는 @Environment Property Wrapper 를 붙여서 이 모델에 대한 의존성을 정의해둘 수 있다.


```swift 
@frozen @propertyWrapper struct EnvironmentObject<ObjectType> where ObjectType : ObservableObject
```

```swift 

   struct PlayerView: View {
    @EnvironmentObject var player: PodcastPlayStore
    
    var body: some View {
        VStack {
            Text(player.currentEpisode.title)
            .foregroundColor(isPlaying ? .white : .gray)
                Text(player.currentEpisode.showTitle)
            .font(.caption)
            .foregroundColor(.gray)

    PlayButton(isPlaying: $player.isPlaying) 
    
    Text("\(player.currentTime, formatter: playheadTimeFormatter)")
        }
    }
}
```

> ObservedObject로 사용하던 때와 마찬가지로, player 프로퍼티의 상태가 변경될 때마다 뷰가 자동으로 업데이트 될 것이다.


**언제 ObservedObject를 쓰고 언제 EnvironmentObject를 쓰면 좋은 것일까**

- 기본적으로는 ObservedObject를 사용하면 된다. 그러나 때때로 모델이 변경되었음을 여러 뷰를 거치며 전달해야 할 상황이 있을 것이다. 


간단히 예를 들어 아래와 같은 뷰 계층이 있다고 해보자.

![](https://hackmd.io/_uploads/B1hwpLQNh.png)
> 예제 그림 13) EnvironmentObject

특정 모델이 변경되었을 때 초록색 뷰들이 업데이트되어야 한다면, 모델이 변경되었음을 전달하기 위해 실제로는 그 정보가 필요하지 않은 파란색 뷰들을 경유해야 할 것이다. 이런 케이스에서 EnvironmentObject를 사용하면 깔끔하게 처리할 수 있다.

![](https://hackmd.io/_uploads/Sk4_pLmN3.png)


## 어떤 것을 어디에 적용하면 좋을까?

1. 데이터의 생성/관리 주체 관점에서 생각하면 다음과 같이 나눠볼 수 있다.

![](https://hackmd.io/_uploads/HkUja8QE2.png)

**@State**

- Value Type
- 뷰의 로컬 데이터 (내부 프로퍼티)
- 뷰에서 소유되고 관리되어야 하는 데이터
- (ex) SwiftUI 프레임워크의 Button의 highlight 여부는 Button 내부에서 @State로 관리되고 있다. Touch 중일 때 highlighted 상태, Touch가 끝났을 때 highlighted 가 아닌 상태라는 것을 외부에서 관리할 필요없이 Button 내부에서만 관리하면 되기 때문이다.

**ObservableObject**

- Reference Type
- 이미 관리(소유)하고 있는 데이터에 적용하면 좋음
- 외부로부터의 데이터를 표현할 때


2. 재사용가능한 컴포넌트를 만드는 경우도 생각해보자. 이 경우에는 데이터의 성격이 Read-only인지 Read-write인지에 따라 다음과 같이 나눠볼 수 있다.

 ![](https://hackmd.io/_uploads/r1SC6874n.png)

**Read-only 데이터**

- 재사용을 위한 뷰에서 굳이 데이터를 변경할 필요가 없는 경우
- Swift Property, Environment 등을 사용하기 (데이터 변경 시, 감지하여 알아서 뷰가 업데이트 됨)


**Read-write 데이터**

- 재사용을 위한 뷰에서도 데이터를 변경할 일이 있는 경우 (ex: SwiftUI의 Toggle)
- @Binding을 사용하기 (값을 소유하지 않으면서도 읽고 쓸 수 있음)
- 예로 든 Toggle의 경우, on/off 데이터가 어디서 발생되었고 누가 관리하는지 Toggle View 자체에서는 알 필요가 없다. 따라서 isOn 여부를 Binding으로 받고 있는 것이다(참고).

