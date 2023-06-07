//
//  WebClient.swift
//  Example
//
//  Created by E4 on 2022/12/27.
//

import Foundation

enum LoginTarget {
    case login(LoginRequest)
    case getUserDetails(UserDetailsRequest)
}

extension LoginTarget: TargetType {

    var baseURL: String {
        return "https://www.apiserver.com"
    }

    var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .getUserDetails: return .get
        }
    }

    var path: String {
        switch self {
        case .login: return "/login"
        case .getUserDetails: return "/details"
        }
    }

    var parameters: RequestParams {
        switch self {
        case .login(let request): return .body(request)
        case .getUserDetails(let request): return .body(request)
        }
    }

}
