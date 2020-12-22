//
//  WaterfallLayoutApp.swift
//  WaterfallLayout
//
//  Created by Dirk Fritz on 21.12.20.
//

import SwiftUI

@main
struct WaterfallLayoutApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CategoriesScene()
            }.accentColor(.black)
        }
    }
}
