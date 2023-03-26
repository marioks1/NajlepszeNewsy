
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
        let miesiac = przytnijString(stringDoPrzyciecia:String(publishedAt), indexStart: 5, indexEnd: 6)
        let dzien = przytnijString(stringDoPrzyciecia:String(publishedAt), indexStart: 8, indexEnd: 9)
        let finalnaData = "\(dzien)-\(miesiac)-\(rok)"
        return finalnaData
    }
    
    let title: String
    let publishedAt: String
    let url: String
    
    func przytnijString(stringDoPrzyciecia: String, indexStart: Int, indexEnd: Int) -> String {
        let start = stringDoPrzyciecia.index(stringDoPrzyciecia.startIndex, offsetBy: indexStart)
        let end = stringDoPrzyciecia.index(stringDoPrzyciecia.startIndex, offsetBy: indexEnd)
        let range = start...end
        return String(stringDoPrzyciecia[range])
    }
}


