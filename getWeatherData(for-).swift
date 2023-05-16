//
//  getWeatherData(for-).swift
//  CpmAnalysis
//
//  Created by snlcom on 2023/05/31.
//

import Foundation

func getWeatherData(for atype: String) -> (Double, Double, Int, Int, Int)? {
    // JSON 파일의 경로
    guard let fileURL = Bundle.main.url(forResource: "weatherData", withExtension: "json") else {
        print("JSON 파일을 찾을 수 없습니다.")
        return nil
    }
    
    do {
        // JSON 파일 데이터를 읽어옴
        let jsonData = try Data(contentsOf: fileURL)
        
        // JSON 데이터를 파싱하여 Foundation 객체로 변환
        guard let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] else {
            print("JSON 데이터를 파싱할 수 없습니다.")
            return nil
        }
        
        // atype에 해당하는 데이터를 찾음
        if let activityData = jsonArray.first(where: { $0["name"] as? String == atype }) {
            // 값을 가져옴
            if let snow = activityData["snow"] as? Double,
               let rainfall = activityData["rainfall"] as? Double,
               let temperaturemin = activityData["temperaturemin"] as? Int,
               let temperaturemax = activityData["temperaturemax"] as? Int,
               let wind = activityData["wind"] as? Int {
                return (snow, rainfall, temperaturemin, temperaturemax, wind)
            }
        }
        
        // atype에 해당하는 데이터가 없을 경우 nil 반환
        print("해당하는 atype의 데이터를 찾을 수 없습니다.")
        return nil
        
    } catch {
        print("JSON 파일을 읽는 도중 오류가 발생했습니다: \(error)")
        return nil
    }
}
