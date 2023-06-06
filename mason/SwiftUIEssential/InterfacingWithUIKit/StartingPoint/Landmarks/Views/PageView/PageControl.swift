//
//  PageControl.swift
//  Landmarks
//
//  Created by Mason on 2023/06/04.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
         var control: PageControl

         init(_ control: PageControl) {
             self.control = control
         }

         @objc
         func updateCurrentPage(sender: UIPageControl) {
             control.currentPage = sender.currentPage
         }
     }
}
