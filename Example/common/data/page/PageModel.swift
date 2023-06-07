//
//  PageModel.swift
//  example
//
//  Created by 이정훈 on 2022/12/13.
//

import Foundation


class PageModel: ObservableObject {
    @Published var current: Int = 0
    @Published var maxCnt: Int = 0
    var hasMorePages:Bool = true
}
