//
//  ContentView.swift
//  example
//
//  Created by 이정훈 on 2022/12/12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navModel = NavModel()
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                
                NavView(navModel: navModel)
                    .frame(width: width, height: height)
                MenuView(navModel: navModel)
                    .frame(width: width)
                    .offset(x: navModel.isShowMenu ? 0 : -width)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
