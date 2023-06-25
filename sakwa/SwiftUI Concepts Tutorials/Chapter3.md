

`@Binding` Property Wrapper를 활용해 상위 뷰에서 선언한 프로퍼티를 하위 뷰에 넘겨서 해당 값이 변하면 UI 업데이트를 해줬는데 해당 값을 넘길 때 다음과 같이 했는데
```Swift
// 선언
@Binding var recipe: Recipe 

// 활용
StarRating(rating: $recipe.rating)
```
연산 프로퍼티로 다른 타입의 커스텀 Binding 인스턴스를 생성할 수 있고
```Swift
init(
    get: @escaping () -> Value,
    set: @escaping (Value) -> Void
)

// 이건 값이 업데이트 될때의 애니메이션? 효과?를 넣을 때 사용하는 것 같음
init(
    get: @escaping () -> Value,
    set: @escaping (Value, Transaction) -> Void
)
```

get, set 부분만 구현하면 `@Binding` 사용해서 값을 전달한 것 처럼 다른 뷰로 데이터를 전달할 수 있다.
```swift
 private var recipe: Binding<Recipe> {
        Binding {
            if let id = recipeId {
                return recipeBox.recipe(with: id) ?? Recipe.emptyRecipe()
            } else {
                return Recipe.emptyRecipe()
            }
        } set: { updatedRecipe in
            recipeBox.update(updatedRecipe)
        }
    }
```

이렇게 만들어진 프로퍼티를 사용할 땐 `$`를 앞에 안붙여도 되는데 이 프로퍼티는 `Binding` 자체를 반환하기 때문에 필요 없다고 한다.
```Swift
RecipeDetailView(recipe: recipe)
```

그럼 @Binding을 사용했을 땐 어떻게 반환하나 이렇게 선언하고 봤더니

```Swift
@Binding var test: Bool
```
<img width="106" alt="스크린샷 2023-06-25 20 08 01" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/c43e2969-f62d-4db2-a716-fd7bc2bcf55b">
<img width="176" alt="스크린샷 2023-06-25 20 08 05" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/4a245eeb-66b9-4b46-943f-80394a317b88">

`$`을 안붙이면 Binding이 참조하는 값이 반환되고 붙이면 해당 프로퍼티 타입이 Binding으로 한번 감싸진 타입의 값이 반환이 된다.
`$`을 붙인 경우에도 해당 타입의 값에 접근할 수 있는데 도큐먼트에도 이미 나와있었다..!
```Swift
// Bool 타입의 값 반환
$test.wrappedValue

// Binding<Bool> 반환
// 이렇게 쓰진 않고 그냥 $test 쓰면 된다!
$test.projectedValue
```
<img width="507" alt="스크린샷 2023-06-25 20 13 52" src="https://github.com/myssun0325/Smash_SwiftUITutorial/assets/41609708/a17c20bb-3b9d-4811-a8bf-4f6c20a9c156">


https://developer.apple.com/documentation/SwiftUI/Binding
