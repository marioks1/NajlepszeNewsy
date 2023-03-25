import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{

    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let zabezpieczonyUrl = urlString{
            if let url = URL(string: zabezpieczonyUrl){
                let zapytanie = URLRequest(url: url)
                uiView.load(zapytanie)
            }
        }
        
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "https://www.wp.pl")
    }
}
