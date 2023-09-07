//
//  ApiPracticeApp.swift
//  ApiPractice
//
//  Created by 임지성 on 2023/08/09.
//

import OrderedCollections
import SwiftUI

@main
struct ApiPracticeApp: App {

    init() {
        let myApiPractice2 = MyApiPractice2()
        myApiPractice2.getData()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
