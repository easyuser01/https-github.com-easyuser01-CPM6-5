//
//  WorkCondition.swift
//  CpmAnalysis
//
//  Created by snlcom on 2023/06/03.
//

import Foundation
import CoreData

//    func generateAndValidateSchedule(for works: [CriteriaData], with weatherList: [Weather]) -> [String: Bool] {
//        var schedule: [String: Bool] = [:]
//        for work in works {
//            for weather in weatherList {
//                // 날씨 조건 확인
//                let isTemperatureOkay = Double(weather.temperature) ?? 0 >= work.temperaturemin && Double(weather.temperature) ?? 0 <= work.temperaturemax
//                let isRainOkay = Double(weather.rain) ?? 0 <= work.rainfall
//                let isSnowOkay = Double(weather.snow) ?? 0 <= work.snow
//                let isWindOkay = Double(weather.windspeed) ?? 0 <= work.wind
//                // 모든 조건이 충족되면 작업 가능
//                if isTemperatureOkay && isRainOkay && isSnowOkay && isWindOkay {
//                    schedule[work.type] = true
//                } else {
//                    // 하나라도 충족되지 않으면 작업이 지연됩니다.
//                    schedule[work.type] = false
//                }
//            }
//        }
//        return schedule
//    }

//    let criteriaList = CriteriaList()
//    let criterias = criteriaList.getCriterias()
//
//    let weatherconsideredschedule = generateAndValidateSchedule(for: criterias, with: Weatherlist)



//---------------------------------------------
class WeatherAvailability: ObservableObject {
    
    public func availavilityCheck(for works: [CriteriaData], with weatherList: [Weather]) -> [String: [String]] {

        var schedule: [String: [String]] = [:] // 딕셔너리를 [String: [String]] 타입으로 변경
        
        for weather in weatherList {
            let date = weather.date // 날짜를 가져옴
            
            var availableWorks: [String] = [] // 작업 가능한 작업들을 저장할 배열 생성
            
            for work in works {
                // 날씨 조건 확인
                let isTemperatureOkay = Double(weather.temperature) ?? 0 >= work.temperaturemin && Double(weather.temperature) ?? 0 <= work.temperaturemax
                let isRainOkay = Double(weather.rain) ?? 0 <= work.rainfall
                let isSnowOkay = Double(weather.snow) ?? 0 <= work.snow
                let isWindOkay = Double(weather.windspeed) ?? 0 <= work.wind
                
                if isTemperatureOkay && isRainOkay && isSnowOkay && isWindOkay {
                    availableWorks.append(work.type) // 작업이 가능한 경우 배열에 추가
                }
            }
            
            schedule[date] = availableWorks // 해당 날짜에 가능한 작업들을 딕셔너리에 저장
        }
        
        return schedule

    }
}

//    @Published var weatheravailability = WeatherAvailability() // weatheravailibility 객체 생성
//
//    let criteriaList = CriteriaList()
//    let criteriadata = criteriaList.getCriterias()
//
//    var Weatherlist: [Weather] = [weather1, weather2, weather3, weather4, weather5, weather6, weather7, weather8, weather9, weather10, weather11, weather12, weather13, weather14, weather15, weather16, weather17, weather18, weather19, weather20, weather21]
//
//
//    let weatherConsideredSchedule = weatheravailibility.generateAndValidateSchedule(for: criteriadata, with: Weatherlist)


