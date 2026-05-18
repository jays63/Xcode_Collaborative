import SwiftUI

enum searcher {
    case mon, item, move
}

@Observable
class NetworkClient {
    private var monList:[pokemon]=[]
    private var moveList:[move]=[]
    private var mon: pokemon = pokemon(id: 0, name: "", abilities: [])
    private var singleItem: item = pokemonItem(id: 0, name: "", description: "")
    private var annoyance: move = move(id: 0, name: "", effect_chance: 0.0, pp: 0, priority: 0, power: 0)
    
    func getpokemon(input: String) async{
        let urlStr: String = "https://pokeapi.co/api/v2/pokemon/\(input)"
        let url: URL? = URL(string: urlStr)
        guard let urlUnwrapped = url else {
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            let _ = response as! HTTPURLResponse
            mon = try JSONDecoder().decode(pokemon.self, from: data)
        } catch let error {
            print(error)
        }
    }
    
    func getItem(input: String) async {
        let urlStr: String = "https://pokeapi.co/api/v2/items/\(input)"
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
        let urlStr: String = "https://pokeapi.co/api/v2/moves/\(input)"
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
    
    func search(input: String, queryType: searcher) async{
        let URLbase: String = "https://pokeapi.co/api/v2/\(queryType)/\(input)"
        let url: URL? = URL(string: URLbase)
        guard let urlUnwrapped = url else {
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
            let _ = response as! HTTPURLResponse
            switch queryType {
            case .mon:
                await getpokemon(input: input)
            case .item:
                await getItem(input: input)
            case .move:
                await getMove(input: input)
            }
        } catch let error {
            print(error)
        }
    }
}
