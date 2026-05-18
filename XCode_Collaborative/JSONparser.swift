import Foundation

struct move: Codable{
    var id: Int;
    var name: String;
    var effect_chance: Double;
    var pp: Int;
    var priority: Int;
    var power: Int;
}

struct item: Codable{
    var id: Int;
    var name: String;
    var description: String;
}

struct pokemon: Codable{
    var id:Int;
    var name:String;
    var abilities: [Ability];
    var stats: [Stat];
    var types: [String]
}

struct Ability: Codable {
    var is_hidden: Bool;
    var slot: Int
}

struct Stat: Codable {
    var base_stat: Int
    var desc: [notes]
}

struct notes: Codable {
    var name: String;
    var URL: String;
}
