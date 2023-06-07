//
//  URLInfo.swift
//  example
//
//  Created by 이정훈 on 2022/12/18.
//

import Foundation

class URLInfo {
    
    static func getItemListUrl(currentPage: Int) -> String {
        return "https://s3.eu-west-2.amazonaws.com/com.donnywals.misc/feed-\(currentPage).json"
    }
    
    static func getLogin(currentPage : Int) -> String {
        return ""
    }
    
}

