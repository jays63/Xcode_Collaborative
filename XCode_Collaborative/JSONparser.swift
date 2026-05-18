import Foundation

struct move: Codable{
    var id: Int;
    var name: String;
    var effect_chance: Double;
    var pp: Int;
    var priority: Int;
    var power: Int;
}

struct pokemonItem: Codable{
    var id: Int;
    var name: String;
    var abilities: [String];
    var forms: [String];
}

struct pokemon: Codable{
    var id:Int;
    var name:String;
    var abilities: [String];
}
