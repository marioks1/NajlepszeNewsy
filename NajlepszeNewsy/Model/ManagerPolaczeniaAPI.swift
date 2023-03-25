

import UIKit

class ManagerPolaczeniaAPI: ObservableObject {
    
    @Published var posty = [Post]()
    
    func pobierzDane() {
     if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=pl&apiKey=bd5f4ce9d4824352be6fe655e21f4f6b"){
            let sesja = URLSession(configuration: .default)
            let zlecenie = sesja.dataTask(with: url) { (dane, odpowiedz, blad) in
                if blad == nil {
                    let dekoder = JSONDecoder()
                    if let odczytaneDane = dane{
                        do{
                           let otrzymaneDane = try dekoder.decode(Rezultaty.self, from: odczytaneDane)
                            DispatchQueue.main.async {
                                self.posty = otrzymaneDane.articles
                            }
                            
                        } catch {
                            print(blad)
                        }
                        
                    }
                    
                    
                }
            }
         zlecenie.resume()
        }
        
    }
    
}
