//
//  DetailedView.swift
//  NajlepszeNewsy
//
//  Created by Mariusz Dziuba on 26/03/2023.
//

import SwiftUI
import WebKit

struct DetailedView: View {
    
    let url: String?
    init(url: String?) {
        self.url = url
    }
    
    var body: some View {
        WebView(urlString: url)    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(url: "https://www.wp.pl")
    }
}

