//
//  CriteriaInformation.swift
//  CpmAnalysis
//
//  Created by snlcom on 2023/06/03.
//

import Foundation

//let url = Bundle.main.url(forResource: "criterias", withExtension: "json")
//    let jsonData = try? Data(contentsOf: url)
//    let decoder = JSONDecoder()
//    do {
//        let workConditions = try decoder.decode([WorkCondition].self, from: jsonData)
//        // 여기서 workConditions는 [WorkCondition] 타입의 배열입니다.
//    } catch {
//        print("Error decoding WorkCondition data: \(error)")
//    }
//


//...
//class criteriaList : ObservableObject {
//    public let criterias : [CriteriaData]
//    init() {
//        if let url = Bundle.main.url(forResource: "criterias", withExtension: "json"),
//           let data = try? Data(contentsOf: url){
//            if let criteriasCheck = try? JSONDecoder().decode([CriteriaData].self, from: data){
//                self.criterias = criteriasCheck
//            }
//        }
//    }
//}
//
//

class CriteriaList: ObservableObject {
    @Published var criteriadata: [CriteriaData] = []
    
    init() {
        if let url = Bundle.main.url(forResource: "criterias", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let criteriasCheck = try? JSONDecoder().decode([CriteriaData].self, from: data) {
                self.criteriadata = criteriasCheck
            }
        }
    }
    
    func getCriterias() -> [CriteriaData] {
        return self.criteriadata
    }
}

