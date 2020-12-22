//
//  CardView.swift
//  WaterfallLayout
//
//  Created by Dirk Fritz on 21.12.20.
//

import SwiftUI

struct CardView: View {
    struct Const {
        static let cornerRadius: CGFloat = 10
        static let opacity: Double = 0.33
        static let textPadding: CGFloat = 8
    }
    let card: Card
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(card.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width,
                           height: proxy.size.height)
                    .clipped()
                    .cornerRadius(Const.cornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: Const.cornerRadius)
                            .fill(
                                Color(.gray)
                                    .opacity(Const.opacity))
                    )
                Text(card.title)
                    .font(.title3)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(Const.textPadding)
                    .foregroundColor(.white)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(card: .init(title: "Running", imageName: "running"))
                .previewLayout(.fixed(width: 163.5, height: 320.0))
            CardView(card: .init(title: "Running", imageName: "running"))
                .previewLayout(.fixed(width: 163.5, height: 200.0))
        }
    }
}
