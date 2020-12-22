//
//  CategoriesScene.swift
//  WaterfallLayout
//
//  Created by Dirk Fritz on 21.12.20.
//

import SwiftUI

struct CategoriesScene: View {
    struct Const {
        static let bigCardHeight: CGFloat = 320
        static let smallCardHeight: CGFloat = 200
        static let horizontalSpacing: CGFloat = 16
    }
    
    let cards: [Card] = [
        .init(title: "Kick Boxing",
              imageName: "kickboxing"),
        .init(title: "Boxing",
              imageName: "boxing"),
        .init(title: "Intervals",
              imageName: "intervals"),
        .init(title: "Yoga",
              imageName: "yoga"),
        .init(title: "Pilates",
              imageName: "yoga"),
        .init(title: "Balance",
              imageName: "balance"),
        .init(title: "Running",
              imageName: "running"),
        .init(title: "Fitness",
              imageName: "intervals")
    ]
    
    var leftCards: [Card] {
        cards.enumerated()
            .filter { $0.offset % 2 == 0 }
            .map { $0.element }
    }
    
    var rightCards: [Card] {
        cards.enumerated()
            .filter { $0.offset % 2 != 0 }
            .map { $0.element }
    }
    
    var body: some View {
        ScrollView {
            HStack(spacing: Const.horizontalSpacing) {
                VStack {
                    ForEach(Array(leftCards.enumerated()), id: \.element) { offset, card in
                        CardView(card: card)
                            .frame(height: offset % 2 == 0 ? Const.bigCardHeight : Const.smallCardHeight)
                    }
                    Spacer()
                }
                VStack {
                    ForEach(Array(rightCards.enumerated()), id: \.element) { offset, card in
                        CardView(card: card)
                            .frame(height: offset % 2 != 0 ? Const.bigCardHeight : Const.smallCardHeight)
                    }
                    Spacer()
                }
            }.padding()
        }.navigationTitle("Categories")
        .navigationBarItems(leading: Button {} label: {Image(systemName: "arrow.backward")},
                            trailing: Button {} label: {Image(systemName: "magnifyingglass")})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoriesScene()
        }
        .accentColor(.black)
    }
}
