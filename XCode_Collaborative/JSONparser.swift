import Foundation

struct move: Codable{
    var id: Int;
    var name: String;
    var accuracy: Int;
    var effect_chance: Int;
    var pp: Int;
    var priority: Int;
    var power: Int;
    var damage_class: damageClass;
    var effect_entries: entry;
}

struct entry: Codable {
    var short_effect: String;
}

struct damageClass: Codable {
    var name: String;
    var url: String;
}

struct item: Codable{
    var id: Int;
    var name: String;
    var effect_entries: Note;
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

struct Note: Codable{
    var short_effect: String;
}
