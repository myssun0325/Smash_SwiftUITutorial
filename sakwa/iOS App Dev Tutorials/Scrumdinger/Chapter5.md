# State management

`ObservableObject`  
클래스를 관찰 가능하도록 해서 해당 클래스 안에 있는 프로퍼티의 변화에 따라 UI 업데이트를 주고 싶은 경우에 ObservableObject 프로토콜을 채택하도록 한 뒤, `@Published` 를 각 프로퍼티 선언부에 추가하면 해당 프로퍼티에 따라 UI 업데이트가 된다.

`@MainActor`  
명시적으로 DispatchQueue.main.async 를 넣어서 UI 업데이트 하는 부분을 비동기 호출로 래핑하는 과정을 거쳤는데 Swift Concurrency를 사용할 때 이 어노테이션을 붙여주면 붙여진 클래스의 모든 프로퍼티와 메서드가 메인 스레드에서 자동으로 호출되고 접근된다는 것을 의미한다

(nonisolated / isolated 관련한 내용도 나오는데 Actor, Swift Concurrency 공부를 쫌 해봐야 할 것 같다..)

---

이번 WWDC 23 에서 Obseravation 프레임워크가 나오고 @Observation 매크로 덕분에 @State, @Environment, @Bindable 만 사용해도 된다고 한다. 그래서 @StateObject로 바인딩해서 구현된 예제를 wwdc23에 나온 Observation 프레임워크를 활용해서 개선해보려고 한다.

상태를 관찰할 ScrumTimer모델에 `@Observable` 매크로를 붙여주고 `@Published` 는 제거하고 프로퍼티 초기화 안된 곳을 다 초기화 해준다. 

```swift
import Observation

@Observable
class ScrumTimer {
	// 흐른 시간
	var secondsElapsed = 0
	// 남은 시간
	var secondsRemaining = 0
	
	private var lengthInMinutes: Int = 0
	...
	
	private func update() {
		guard let startDate, !timerStopped else { return }

    let secondsElapsed = Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
    secondsElapsedForSpeaker = secondsElapsed
		// UI 업데이트
    self.secondsElapsed = secondsPerSpeaker * speakerIndex + secondsElapsedForSpeaker
    guard secondsElapsed <= secondsPerSpeaker else { return }
    // UI 업데이트
    secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)

    if secondsElapsedForSpeaker >= secondsPerSpeaker {
	    changeToSpeaker(at: speakerIndex + 1)
	    speakerChangedAction?()
	  }
	}
}
```

여기까지 하면 모델 안에 프로퍼티 값의 변화를 관찰할 준비는 끝났고 이제 View에 바인딩해줘서 UI를 업데이트 해주면 된다. 이전에는 @StateObject 사용하던 곳은  scrumTimer는 뷰의 상태의 일부분 이기 때문에 @State를 사용하도록 바꿔주면 된다. 

```swift
@State var scrumTimer = ScrumTimer()
```
<img width="500" alt="스크린샷 2023-07-02 20 06 33" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/9ed0ff7f-362a-4b8d-a9c3-8076d091a979">

변환하면서 Task { } 로 감싼 부분이 @ObservedObject에서 @Observable로 변환하면서 필요없다고 해서 지우긴 했는데 자세한 설명이 없어서 아쉬운데 더 찾아보고 공부해야 할 듯 하다..

[https://developer.apple.com/forums/thread/731822](https://developer.apple.com/forums/thread/731822)
