/import Foundation

struct Criteria: Decodable {
    let id: Int
    let name: String
    let snow: Double
    let rainfall: Double
    let temperaturemin: Double
    let temperaturemax: Double
    let wind: Double
}

func fetchCriteria(for atype: String) -> Criteria? {
    guard let fileURL = Bundle.main.url(forResource: "criterias", withExtension: "json") else {
        print("JSON 파일을 찾을 수 없습니다.")
        return nil
    }
    
    do {
        let jsonData = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let criteria = try decoder.decode([Criteria].self, from: jsonData)
        
        if let matchingCriteria = criteria.first(where: { $0.name == atype }) {
            return matchingCriteria
        }
        
        print("해당 사업 종류의 기준이 존재하지 않습니다.")
        return nil
    } catch {
        print("JSON 디코딩 오류: \(error)")
        return nil
    }
}
