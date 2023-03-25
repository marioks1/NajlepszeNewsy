

import SwiftUI

struct ContentView: View {
    
   
   @ObservedObject var managerPolaczeniaAPI = ManagerPolaczeniaAPI()
    
  var body: some View {
      VStack(){
            Text("Najlepsze Newsy")
                .font(.title)
                .fontWeight(.bold)
            NavigationView{
                List(managerPolaczeniaAPI.posty){ post in
                    NavigationLink(destination: DetailedView(url: post.url)) {
                        HStack(alignment: .top){
                            Text(post.sformatowanaData)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                              
                                
                            Text(post.title)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                        }
                    
                    }
                }
                .onAppear{
                    self.managerPolaczeniaAPI.pobierzDane()
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



