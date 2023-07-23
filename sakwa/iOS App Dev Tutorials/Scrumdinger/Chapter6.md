# Adopting Swift concurrency

`async` 키워드를 붙여 비동기 메서드를 정의할 수 있다.

```swift
func asyncMethod() async { }
func asyncMethod() async -> String { }
```

비동기한 함수를 호출하기 위해서는 `await` 키워드가 필요하다. 
→ 비동기 함수는 실행을 중지 시킬 수 있고, 또 다른 비동기 함수의 안 같은 비동기 문맥에서 await를 사용할 수 있다.

await 키워드는 loadImage() 가 끝날때 까지 showImage() 함수를 시스템이 멈추는 것을 허용한다는 의미다.
함수가 멈추면 함수를 호출한 스레드는 다른 일을 할 수 있게 자유로워 진다. 그리고 loadImage()가 끝이나면 시스템은 showImage()의 다음 라인을 실행하게 되고 image를 반환하게 된다.

async 함수를 작성하면 함수는 코드에 나온 순서대로 실행되게 된다.

```swift
func loadProfileImage() async -> Image {
	let image = await loadImage()
	return image	
}
```

비동기 함수를 호출하기 위해서는 함수 호출은 반드시 비동기 문맥(비동기 함수의 내부나 클로저) 안에 있어야 한다. 근데 동기 문맥안에서 비동기 함수를 호출하게 되면 새로운 비동기 문맥인 `Task` 를 만들어야 한다. SwiftUI에서 Button의 액션은 동기 클로저 인데 이 안에서 비동기 함수를 호출하려고 한다면 Task로 묶어줘야 한다.

```swift
Button("이미지 로드하기") {
	Task {
		let image = await showImage()
	}
}
```

SwiftUI에서 `onAppear(perform:)` 을 사용해서 뷰가 나타날 때 어떤 행위를 할 수가 있는데 동기 클로저 이기 때문에 `.task(priority:_:)` 라는 뷰가 나타날 때 어떤 행위를 할 수 있는 비동기함수를 지원한다. 이 task의 생명주기는 뷰와 같기 때문에 뷰가 사라지게 되면 동작중인 task도 작업을 멈추게 된다.

예제에서는 데이터 모델과 뷰를 바인딩하기 위해서 프로퍼티에 `@State` `@Binding` 를 사용했고 뷰를 업데이트 해주기 위해서 해당 프로퍼티는 반드시 메인 스레드에서 실행되어야 한다. 비동기 함수는 백그라운드 스레드에서 실행되기 때문에 해당 프로퍼티들을 함수에서 수정하는 것은 에러가 발생할 수도 있다.

그래서 swift에는 메인 스레드와의 상호작용을 위해 `@MainActor` 어노테이션을 지원한다. 이 어노테이션을 붙여주면 클래스에 선언된 모든 프로퍼티들이 메인 스레드에 의해 변경됨을 보장하게 된다. 

아래 예제에서 `@MainActor` 어노테이션을 적용함으로써 profileImage 프로퍼티가 메인 스레드에서 변경된다는 것을 보장하고 `@Binding` 과 함께 안전하게 프로퍼티를 사용할 수 있게 해준다

```swift
@MainActor
class User: ObservableObject {
	@Published var profileImage: Image = Image()

	func loadProfileImage() async {
		profileImage = await loadImage()
		
	}

	func loadImage() async -> Image { 
		return Image() 
	}
}
```

---

### Task를 변수에 담는 이유?

A화면이 init될 때 이미지를 불러오는 로직이 있다고 한다. 근데 이미지를 다 불러오기 전에 A화면이 deinit 된다면 이 Task는 어떻게 될까? Task는 비동기 작업의 단위이기 때문에 deinit이 되어도 이미지를 불러오는 작업을 마무리할 것이다.  (어쩌피 그 화면은 사라졌는데 이미지 불러오는 작업을 하는 낭비가 발생!?)

```swift
// A화면 생성자
init() {
	Task {
			// 이미지 불러오기
	}
}
```

그래서 Task를 변수에 담은 다음 `Task변수.cancel()` 을 활용해서 화면 이동이나 해당 비동기 작업이 더 이상 필요하지 않는 경우에 작업을 취소할 수 있다.

```swift
init
Task start
// 취소됐다는 에러가 뜸!
Error Domain=NSURLErrorDomain Code=-999 "cancelled" UserInfo={NSErrorFailingURLStringKey=https://api.unsplash.com/photos?client_id=_qHlB1wp5K6j4OdRuXa_AXImQonuJjDDOIHUDJ27ppE&page=1&per_page=30&orientation=landscape, NSErrorFailingURLKey=https://api.unsplash.com/photos?client_id=_qHlB1wp5K6j4OdRuXa_AXImQonuJjDDOIHUDJ27ppE&page=1&per_page=30&orientation=landscape, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <925C9647-DFCD-461C-B8CB-F76B5D599E76>.<1>"
), _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <925C9647-DFCD-461C-B8CB-F76B5D599E76>.<1>, NSLocalizedDescription=cancelled}
deinit
```

### ScenePhase

Scene의 상태 (active, inactive, background)를 갖는 환경변수
onChange랑 같이 사용해 scene의 상태가 변함에 따라 다른 이벤트를 줄 수 있다!

### onChange(of: perform:)

of로 전달하는 변수의 값이 변할 때 perform에 해당하는 로직을 수행

---

# Observation

@Observable 매크로를 붙여주면 클래스 내의 모든 프로퍼티는 @ObservationTracked / @ObseravationIgnored 매크로가 붙게 되는데 말 그대로 프로퍼티 트래킹을 허용하냐 안하냐의 뜻이다. 
트래킹을 허용하지 않는다면 @ObservationIgnored를 붙여줘야 한다. 

아래 2개 영상은 SwiftUI의 새 Data Flow라고 Observation을 소개하는 영상  
[https://www.youtube.com/watch?v=xcKT_wgq_EQ&t=1393s](https://www.youtube.com/watch?v=xcKT_wgq_EQ&t=1393s)  
[https://www.youtube.com/watch?v=EK7SthdWV2w](https://www.youtube.com/watch?v=EK7SthdWV2w)
