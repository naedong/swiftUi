
import SwiftUI

struct Any1View: View {
    
    @ObservedObject var pageModel = PageModel()
    @State var any1ItemList: [Any1Model] = []
    @State var showingAlert = false
    
    var body: some View {
        GeometryReader { geometry in
            let columns: [GridItem] = [GridItem()]
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(Array(any1ItemList.enumerated()), id:\.offset){ i, item in
                        Any1ItemView(item: item)
                            .onAppear(){
                                if(pageModel.maxCnt < i + 1){
                                    pageModel.maxCnt = i + 1
                                    if(pageModel.maxCnt % 10 == 0){
                                        tryLoadItem()
                                    }
                                }
                            }
                    }
                }
            }.onAppear(){
                print("onAppear")
                tryLoadItem()
            }
        }
        .alert("네트워크 통신 오류", isPresented: $showingAlert){
            Button("재시도", role: .cancel) {
                loadItems()
            }
            Button("취소", role: .destructive) {
                pageModel.current -= 1
            }
        } message: {
            Text("네트워크가 원할하지 않습니다. 재요청 하시겠습니까?")
        }
    }
    
    func tryLoadItem(){
        if(pageModel.hasMorePages){
            pageModel.current += 1
            loadItems()
        }
    }
    
    func loadItems(){
        print("loadItems")
        HttpClient<ResAny1>().alamofireNetworking(
            url: URLInfo.getItemListUrl(currentPage: pageModel.current),
            onSuccess: { (resData) in
                print("resData : \(resData)")
                pageModel.hasMorePages = resData.hasMorePages
                let loadItems = resData.items
                loadItems.forEach { loadItem in
                    print("loadItem : \(loadItem)")
                    any1ItemList.append(loadItem)
                }
            },
            onFailure: {
                showingAlert = true
            }
        )
    }
    
    
    
    
    //    func loadItems(){
    //        print("loadItems")
    //        if(pageModel.hasMorePages){
    //            pageModel.current += 1
    //            RequestAPI.shared.testFetch(currentPage: pageModel.current)
    //            let request = HttpCommon().httpCall(url: "https://s3.eu-west-2.amazonaws.com/com.donnywals.misc/feed-\(pageModel.current).json", method: "GET", body: nil)
    //            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    //                if error != nil || data == nil {
    //                    print("Client error!")
    //                    return
    //                }
    //                if let response = response as? HTTPURLResponse {
    //                    let statusCode = response.statusCode
    //                    print("response.statusCode : ", response.statusCode)
    //                    if(statusCode == 401){
    //                        print("401  Error")
    //                    } else if((404...500).contains(response.statusCode)){
    //                        print("비정상 접근 또는 서버 에러")
    //                    } else if((200...299).contains(response.statusCode)){
    //                        do {
    //                            let responseModel = try JSONDecoder().decode(ResponseModel<ItemModel>.self, from:data!)
    //                            pageModel.hasMorePages = responseModel.hasMorePages
    //                            let loadItems = responseModel.items
    //                            loadItems.forEach { loadItem in
    //                                print("loadItem : \(loadItem)")
    //                                itemList.append(loadItem)
    //                            }
    //                        } catch let e as NSError {
    //                            print("An error has occured while parsing JSON Obejt : \(e.localizedDescription)")
    //                        }
    //                    } else {
    //                        print("접속장애")
    //                    }
    //                }
    //            }
    //            task.resume()
    //        }
    //    }
}

struct Any1View_Previews: PreviewProvider {
    static var previews: some View {
        Any1View()
    }
}
