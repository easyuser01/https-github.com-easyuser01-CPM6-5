//
//  WeatherAvailibilityView.swift
//  CpmAnalysis
//
//  Created by snlcom on 2023/06/05.
//
import SwiftUI
import Foundation

struct WeatherAvailabilityView: View {
    @ObservedObject var weatherAvailibility = WeatherAvailability()
    // var weatherConsideredSchedule: [String: [String]] = [:]// weatherConsideredSchedule 딕셔너리를 ContentView에 전달하는 속성
    
    
    
        @Published var weatheravailability = WeatherAvailability() // weatheravailibility 객체 생성
    
        let criteriaList = CriteriaList()
        let criteriadata = criteriaList.getCriterias()

        var Weatherlist: [Weather] = [weather1, weather2, weather3, weather4, weather5, weather6, weather7, weather8, weather9, weather10, weather11, weather12, weather13, weather14, weather15, weather16, weather17, weather18, weather19, weather20, weather21]
//
//
//        let weatherConsideredSchedule = weatheravailability.generateAndValidateSchedule(for: criteriadata, with: Weatherlist)

    

        var body: some View {
            VStack {
                Text("Weather availibility") // 화면에 제목 표시

                // weatherConsideredSchedule 딕셔너리의 키와 값을 순회하면서 화면에 표시
                ForEach(weatherConsideredSchedule.sorted(by: { $0.key < $1.key }), id: \.key) { date, works in
                    VStack {
                        Text(date) // 날짜 표시

                        if works.isEmpty {
                            Text("No available works") // 작업이 없는 경우 메시지 표시
                        } else {
                            ForEach(works, id: \.self) { work in
                                Text(work) // 작업 표시
                            }
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.vertical, 8)
                }
            }
            .padding()
        }
    }



    
    
    
    
