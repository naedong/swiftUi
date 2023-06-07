

import SwiftUI

struct TWebView: View {
    @State var bar: Int = 0
    @ObservedObject var viewModel = WebViewModel()
    
    var body: some View {
        VStack {
            //            WebView(url: "https://pgnt.tistory.com/", viewModel: viewModel)
//            WebView(url : "http://www.naver.com", viewModel: viewModel)
            
            WebView(url: "http://192.168.198.108:18080", viewModel: viewModel)
            HStack {
                Text("\(bar)")
                Button(action: {
                    self.viewModel.foo.send(bar)
                }) {
                    Text("핑")
                }
            }
        }
        // RunLoop: 입력 소스를 관리하는 개체에 대한 프로그래밍 방식 인터페이스 .main: 메인 스레드의 런 루프를 반환.
        .onReceive(self.viewModel.bar.receive(on: RunLoop.main)){ value in
            self.bar = value + 1
        }
    }
}

struct TWebView_Previews: PreviewProvider {
    static var previews: some View {
        TWebView()
    }
}
