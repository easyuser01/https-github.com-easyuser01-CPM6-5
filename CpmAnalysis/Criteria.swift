// Criteria

import Foundation

struct Criteria: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let snow: Double
    let rainfall: Double
    let temperaturemin: Double
    let temperaturemax: Double
    let wind: Double
    
    static let exampleCriteria = Criteria(id: 1, name: "temporary construction", snow: 0.5 ,rainfall: 5 ,temperaturemin: 10, temperaturemax: 100, wind: 10 )
}

