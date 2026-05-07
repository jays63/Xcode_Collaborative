import SwiftUI


@Observable
class NetworkClient {
    private var monList:[pokemon]=[]
    private var itemList:[pokemonItem]=[]
    private var moveList:[move]=[]
    private var mon: pokemon = pokemon(id: 0, name: "", abilities: [""])
    private var singleItem: pokemonItem = pokemonItem(id: 0, name: "", description: "")
    private var annoyance: move = move(id: 0, name: "", effect_chance: 0.0, pp: 0, priority: 0, power: 0)
    
    func getpokemon(input: String) async{
        var urlStr: String = "https://pokeapi.co/api/v2/pokemon/\(input)"
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
    
    func getItem(input: String) async {
        var urlStr: String = "https://pokeapi.co/api/v2/items/\(input)"
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
    
    func getMove(input: String) async {
        var urlStr: String = "https://pokeapi.co/api/v2/moves/\(input)"
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
