//
//  Criterias.swift
//
//

import Foundation

class Criterias: ObservableObject {
    let criterias: [Criteria]
    init() {
        if let url = Bundle.main.url(forResource: "criterias", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let criteriasCheck = try? JSONDecoder().decode([Criteria].self, from: data) {
                self.criterias = criteriasCheck
            } else {
                self.criterias = [Criteria.exampleCriteria]
            }
        } else {
            self.criterias = [Criteria.exampleCriteria]
        }
    }
}

