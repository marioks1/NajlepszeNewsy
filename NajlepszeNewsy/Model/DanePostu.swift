
import Foundation

struct Rezultaty: Decodable {
    let articles: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String? {
        return self.title
    }
    var sformatowanaData: String {
        let rok = String(publishedAt.prefix(4))
        let miesiac = parametryzacjaDaty(indexStart: 5, indexEnd: 6)
        let dzien = parametryzacjaDaty(indexStart: 8, indexEnd: 9)
        let finalnaData = "\(dzien)-\(miesiac)-\(rok)"
        return finalnaData
    }
    
    let title: String
    let publishedAt: String
    let url: String
    
    func parametryzacjaDaty(indexStart: Int, indexEnd: Int) -> String {
        let start = String(publishedAt).index(String(publishedAt).startIndex, offsetBy: indexStart)
        let end = String(publishedAt).index(String(publishedAt).startIndex, offsetBy: indexEnd)
        let range = start...end
        return String(String(publishedAt)[range])
    }
}


