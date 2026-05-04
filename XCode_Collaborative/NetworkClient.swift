import SwiftUI


@Observable
class NetworkClient {
    private var monList:[pokemon]=[]
    private var itemList:[item]=[]
    private var moveList:[move]=[]
    private var mon: pokemon = pokemon(id: 0, name: "", abilities: [""])
    
    func getpokemon() async{
        var urlStr: String = "https://pokeapi.co/api/v2/pokemon/"
        let url: URL? = URL(string: urlStr)
        guard let urlUnwrapped = url else {
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            let _ = response as! HTTPURLResponse
            let monResp = try JSONDecoder().decode([pokemon].self, from: data)
            for mon in monResp{
                monList.append(mon)
            }
        } catch let error {
            print(error)
        }
    }
}
