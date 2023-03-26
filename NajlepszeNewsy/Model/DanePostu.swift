
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
        let miesiac = przytnijString(String:String(publishedAt), od: 5, do: 6)
        let dzien = przytnijString(String:String(publishedAt), od: 8, do: 9)
        let finalnaData = "\(dzien)-\(miesiac)-\(rok)"
        return finalnaData
    }
    
    let title: String
    let publishedAt: String
    let url: String
    
    func przytnijString(String stringDoPrzyciecia: String, od indexStart: Int, do indexEnd: Int) -> String {
        let start = stringDoPrzyciecia.index(stringDoPrzyciecia.startIndex, offsetBy: indexStart)
        let end = stringDoPrzyciecia.index(stringDoPrzyciecia.startIndex, offsetBy: indexEnd)
        let range = start...end
        return String(stringDoPrzyciecia[range])
    }
}


