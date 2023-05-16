//
//  Weather.swift
//  WeatherApp
//
//  Created by 김형관 on 2021/10/05.
//

import Foundation

public struct Weather {
    let location: String
    let temperature: String
    let windspeed: String
    let rain: String
    let snow: String
    let date: String

    init(location: String,temperature: String, windspeed: String, rain: String,snow: String, date: String) {
        self.location = location
        self.temperature = temperature
        self.windspeed = windspeed
        self.rain = rain
        self.snow = snow
        self.date = date
    }
}

//
//@ObservedObject var weatherAvailability = WeatherAvailability()
//@ObservedObject var criteriadata = CriteriaList().getCriterias()
//
//var Weatherlist: [Weather] = [weather1, weather2, weather3, weather4, weather5, weather6, weather7, weather8, weather9, weather10, weather11, weather12, weather13, weather14, weather15, weather16, weather17, weather18, weather19, weather20, weather21]
//
//
//let weatherConsideredSchedule = weatherAvailability.availavilityCheck(for: criteriadata, with: Weatherlist)
