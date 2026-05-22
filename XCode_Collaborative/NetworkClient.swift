import SwiftUI

enum searcher {
    case mon, item, move
}

@Observable
class NetworkClient {
    private(set) var mon: pokemon = pokemon(id: 0, name: "", abilities: [], stats: [], types: [])
    private(set) var singleItem: item = item(id: 0, name: "", effect_entries: Note(short_effect: ""))
    private(set) var annoyance: move = move(id: 0, name: "", accuracy: 0, effect_chance: 0, pp: 0, priority: 0, power: 0, damage_class: damageClass(name: "", url: ""), effect_entries: entry(short_effect: ""))
    
    func getpokemon(input: String) async{
        let urlStr: String = "https://pokeapi.co/api/v2/pokemon/\(input)"
        print(urlStr)
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
            singleItem = try JSONDecoder().decode(item.self, from: data)
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
            annoyance = try JSONDecoder().decode(move.self, from: data)
        } catch let error {
            print(error)
        }
    }
    
    func search(input: String, queryType: searcher) async{
        switch queryType {
        case .mon:
            await getpokemon(input: input)
        case .item:
            await getItem(input: input)
        case .move:
            await getMove(input: input)
        }
    }
}
