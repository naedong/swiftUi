//
//  ListItem.swift
//  example
//
//  Created by 이정훈 on 2022/12/13.
//
import SwiftUI

struct Any1ItemView: View {
    let item: Any1Model
    
    var body: some View {
        ZStack(alignment: .center) {
            Button(action: {
                print("item.label : \(item.label)   item.id : \(item.id)")
            }){
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white)
                    .overlay(
                        VStack{
                            Text(item.id)
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                                .padding(.bottom, 10)
                            Text(item.label)
                                .foregroundColor(.black)
                        }
                    )
                    .shadow(color: .gray, radius: 2, x: CGFloat(2), y: CGFloat(2))
            }
        }
        .frame(height: 72)
    }
}
