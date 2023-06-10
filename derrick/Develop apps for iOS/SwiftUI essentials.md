<h1><center> SwiftUI  </center></h1>

###### tags: `💻 Develop apps for iOS
`
> [color=#724cd1][name=데릭]
> [Chapter 1 -SwiftUI essentials 
Getting started with Scrumdinger
](https://developer.apple.com/tutorials/app-dev-training/getting-started-with-scrumdinger)

# 스크럼 딩거

## SwiftUI 개요

SwiftUI는 모든 Apple 플랫폼용 앱을 빌드하기 위한 선언적 프레임워크이다. SwiftUI는 앱의 사용자 인터페이스 및 플랫폼별 동작을 정의하는 데 사용할 수 있는 공통 API를 제공한다.

- 선언적 구문 : 간단한 Swift 구조를 사용하여 화면에 표시되는 뷰를 정의한다.
- 구성 API : 내장된 뷰 및 modifier를 사용하여 사용자 인터페이스를 빠르게 생성하고 반복한다. 간단한 뷰를 결합하여 더 복잡한 뷰를 구성
- 강력한 레이아웃 시스템 : 상위 뷰 및 서로에 대해 Screen에서 뷰를 쉽게 정렬한다. 뷰를 직접 그릴 수 있다.
- 앱 데이터를 반영하는 View : 뷰의 데이터 종속성을 정의하고 SwiftUI는 데이터가 변경될 때 뷰를 자동으로 업데이트하여 유효하지 않은 뷰 상태로 인한 오류를 방지한다.
- 자동 접근성 지원 : SwiftUI는 최소한의 노력으로 개선하는 방법을 배울 수 있는 기본 접근성을 추가한다.


# Accessibility modifiers
> [Accessibility modifiers](https://developer.apple.com/documentation/swiftui/view-accessibility)

모든 애플 UI 프레임워크와 마찬가지로 SwiftUI에는 내장된 접근성 지원이 제공된다. 프레임워크는 navigation views, lists, text fields, sliders, buttons 등 기본 접근성 레이블 및 값들을 제공한다. 이러한 표준 접근성 기능을 활성화하기 위해 추가 작업을 수행할 필요가 없다.

예를 들어,accessibilityLabel(_:) 또는accessibilityValue(_:) 보기 수정자를 사용하여 UI의 요소에 접근성 레이블을 명시적으로 추가할 수 있습니다.
