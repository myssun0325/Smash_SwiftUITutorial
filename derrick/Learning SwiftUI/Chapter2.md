# [Chapter 2] Maintaining the adaptable sizes of built-in views

## Labels 

- Text와 Sysmbol 둘 다 사용하여 하나의 컴포넌트로 나타낼 때 사용하는 것이다.

```swift 
Label("Favorite Books", systemImage: "books.vertical")
    .labelStyle(.titleAndIcon)
    .font(.largeTitle)
```


## Controls

- `controlSize(_:)` 수정자를 활용하여 크기를 제어할 수 있고 `progressViewStyle(_:)` 수정자는 선형 혹은 구형 표현의 프로그레스바를 선택할 수 있다.

## Images

**AsyncImage**

- 비동기로 이미지를 로드하고 표시하는 뷰이다.

이 뷰는 URLSession 인스턴스를 사용하여 지정된 URL에서 이미지를 로드한 다음 표시한다.

```swift 
AsyncImage(url: URL(string: "https://example.com/icon.png"))
    .frame(width: 200, height: 200)
```

- 이미지가 로드될 때까지 뷰는 Placeholder를 띄운다. 로드가 성공하면 이미지로 업데이트 됨

```swift 
AsyncImage(url: URL(string: "https://example.com/icon.png")) { image in
    image.resizable()
} placeholder: {
    ProgressView()
}
.frame(width: 50, height: 50)
```

- Placeholder 뷰를 내가 지정할 수 있다.

**important**
> `resizable(capInsets:resizingMode:)`와 같은 image-specific 수정자에는 AsyncImage를 바로 적용할 수 없다. 대신, 뷰의 모양을 정의할 때 content 클로저가 가져오는 Image 인스턴스에 적용할 수 있다.

```swift 
AsyncImage(url: URL(string: "https://example.com/icon.png")) { phase in
    if let image = phase.image {
        image // Displays the loaded image.
    } else if phase.error != nil {
        Color.red // Indicates an error.
    } else {
        Color.blue // Acts as a placeholder.
    }
}
```

##  @ScaledMetric

- ScaledMetric 프로퍼티를 사용하면 dynamicTypeSize의 현재 값에 따라 비례적으로 크거나 작은값이 된다.

## ZStack vs overlay

**ZStack**

ZStack은 하위뷰를 overlay하여 두 축에 정렬하는 뷰이다.
- 연속하는 하위 뷰에 이전 하위 뷰보다 더 놓은 z축 값을 할당한다. 즉, 이휴 하위 뷰가 이전 하위 뷰의 위에 나타난다는 것.

```swift 

let colors: [Color] =
    [.red, .orange, .yellow, .green, .blue, .purple]


var body: some View {
    ZStack {
        ForEach(0..<colors.count) {
            Rectangle()
                .fill(colors[$0])
                .frame(width: 100, height: 100)
                .offset(x: CGFloat($0) * 10.0,
                        y: CGFloat($0) * 10.0)
        }
    }
}

```

**Overlay**

- iOS 17.0까지만 사용가능
- secondary view를 overlay하는 modifier 입니다. 

**차이점**

ZStack의 자식뷰들은 서로에 대해 독립접입니다. 

그리고 ZStack에 frame을 따로 주지 않은 이상 가장 큰 자식뷰를 기준으로 ZStack의 fit이 결정됩니다.

 

반면 overlay의 경우

overlay되는 view는 parent view에 종속됩니다.

항상 overlaid view는 parent view의 위에 위치하고 

parent view의 좌표 공간(coordinate space)에 있습니다