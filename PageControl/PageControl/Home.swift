//
//  Home.swift
//  PageControl
//
//  Created by 홍승현 on 2022/11/20.
//

import SwiftUI

struct Home: View {
  
  var colors: [Color] = [.red, .blue, .pink, .purple]
  
  @State var offset: CGFloat = 0
  
  
  var body: some View {
    ScrollView(.init()) {
      TabView {
        ForEach(colors.indices, id: \.self) { index in
          if index == 0 {
            colors[index]
              .overlay(
                GeometryReader { proxy -> Color in
                  
                  let minX = proxy.frame(in: .global).minX
                  
                  DispatchQueue.main.async {
                    withAnimation(.default) {
                      self.offset = -minX
                    }
                  }
                  
                  return .clear
                }
                  .frame(width: 0, height: 0),
                alignment: .leading
              )
          } else {
            colors[index]
          }
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
      .overlay(
        // Animated Indicators
        HStack(spacing: 15) {
          ForEach(colors.indices, id: \.self) { index in
            Capsule()
              .fill(.white)
              .frame(width: getIndex() == index ? 20 : 7, height: 7)
          }
        }
        // Smooth Sliding Effect..
          .overlay(
            Capsule()
              .fill(.white)
              .frame(width: 20, height: 7)
              .offset(x: getOffset()),
            alignment: .leading
          )
          .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
          .padding(.bottom, 10),
        alignment: .bottom
      )
    }
    .ignoresSafeArea()
  }
  
  // getting index...
  func getIndex() -> Int {
    let index = Int(round(Double(offset / getWidth())))
    return index
  }
  
  // getting Offset for Capsule Shape...
  func getOffset() -> CGFloat {
    
    // spacing = 15
    // Circle width = 7
    // so total = 22
    
    let progress = offset / getWidth()
    
    return 22 * progress
  }
}

// extending View to get width
extension View {
  func getWidth() -> CGFloat {
    return UIScreen.main.bounds.width
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
