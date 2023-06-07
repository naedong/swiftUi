//
//  ResponseModel.swift
//  example
//
//  Created by 이정훈 on 2022/12/13.
//

import Foundation

struct ResAny1: Decodable  {
    var items: [Any1Model]
    var hasMorePages: Bool
}
