//
//  PageViewController.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/30.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator { /* SwiftUI는 makeUIViewController(context:) 함수를 부르기 전에 이 함수를 부른다. 따라서 ViewController 를 configure할 때 사용한다. 이 coordinate를 우리는 일반적인 Cocoa pattern들을 이용해 적용할 수 있다. (delegate, data source, target-action을 통한 이벤트)*/
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController { /* SwiftUI가 이 함수를 뷰가 display 할 준비가 됐을때 한번 부른다. 그리고 view controller의 라이프 사이클을 관리한다. */
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) { /* SwiftUI는 `context` 파라미터에서 제공되는 새로운 상태정보에 따라 어떤 변화던지 알맞은 view controller를 업데이트 한다. */
        pageViewController.setViewControllers(
//            [UIHostingController(rootView: pages[0])], /* 지금은 임시로 매 업데이트마다 page라는 SwiftUI의 view를 hosting 해주는 UIHostingController를 만든다. 더 효율적인 방식인 아래 방식으로 적용 */
            [context.coordinator.controllers[currentPage]],
            direction: .forward,
            animated: true
        )
    }

    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]() /* coordinator는 시스템에서 view controller를 업데이트하기 전에 오직 한번만 생성시키는 것을 보장하기 때문에 controller들을 저장해두기에 좋은 장소다. */

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}

