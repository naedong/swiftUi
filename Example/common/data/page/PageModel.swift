

import Foundation


class PageModel: ObservableObject {
    @Published var current: Int = 0
    @Published var maxCnt: Int = 0
    var hasMorePages:Bool = true
}
