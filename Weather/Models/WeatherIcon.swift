//
//  WeatherIcon.swift
//  Weather
//
//  Created by Tsz-Lung on 29/05/2022.
//

import Foundation
import SwiftUI

enum WeatherIcon: Int, Codable {
    case sunny = 1
    case mostlySunny = 2
    case partlySunny = 3
    case intermittentClouds = 4
    case hazySunshine = 5
    case mostlyCloudy = 6
    case cloudy = 7
    case dreary = 8
    case fog = 11
    case showers = 12
    case mostlyCloudyWShowers = 13
    case partlySunnyWShowers = 14
    case tStorms = 15
    case mostlyCloudyWTStorms = 16
    case partlySunnyWTStorms = 17
    case rain = 18
    case flurries = 19
    case mostlyCloudyWFlurries = 20
    case partlySunnyWFlurries = 21
    case snow = 22
    case mostlyCloudyWSnow = 23
    case ice = 24
    case sleet = 25
    case freezingRain = 26
    case rainAndSnow = 29
    case hot = 30
    case cold = 31
    case windy = 32
    case clear = 33
    case mostlyClear = 34
    case partlyCloudyNight = 35
    case intermittentCloudsNight = 36
    case hazyMoonlight = 37
    case mostlyCloudyNight = 38
    case partlyCloudyWShowersNight = 39
    case mostlyCloudyWShowersNight = 40
    case partlyCloudyWTStormsNight = 41
    case mostlyCloudyWTStormsNight = 42
    case mostlyCloudyWFlurriesNight = 43
    case mostlyCloudyWSnowNight = 44
    
    @ViewBuilder
    var image: some View {
        switch self {
        case .sunny, .mostlySunny, .partlySunny, .intermittentClouds:
            Image(systemName: "sun.max.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.yellow)
        case .hazySunshine:
            Image(systemName: "sun.haze.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .yellow)
        case .mostlyCloudy, .mostlyCloudyNight:
            Image(systemName: "cloud.sun.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .yellow)
        case .cloudy, .dreary:
            Image(systemName: "cloud.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        case .fog:
            Image(systemName: "cloud.fog.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        case .showers, .mostlyCloudyWShowers:
            Image(systemName: "cloud.drizzle.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .cyan)
        case .partlySunnyWShowers:
            Image(systemName: "cloud.sun.rain.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .yellow, .cyan)
        case .tStorms, .mostlyCloudyWTStorms:
            Image(systemName: "cloud.bolt.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        case .partlySunnyWTStorms:
            Image(systemName: "cloud.sun.bolt.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .yellow)
        case .rain, .freezingRain:
            Image(systemName: "cloud.rain.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .cyan)
        case .flurries, .mostlyCloudyWFlurries, .partlySunnyWFlurries, .windy, .mostlyCloudyWFlurriesNight:
            Image(systemName: "wind")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        case .snow, .mostlyCloudyWSnow, .mostlyCloudyWSnowNight:
            Image(systemName: "snowflake")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        case .sleet, .rainAndSnow:
            Image(systemName: "cloud.sleet.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .cyan)
        case .hot:
            Image(systemName: "thermometer.sun.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .yellow)
        case .cold, .ice:
            Image(systemName: "thermometer.snowflake")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .cyan)
        case .clear, .mostlyClear:
            Image(systemName: "moon.stars.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        case .partlyCloudyNight, .intermittentCloudsNight, .hazyMoonlight:
            Image(systemName: "cloud.moon.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        case .partlyCloudyWShowersNight, .mostlyCloudyWShowersNight:
            Image(systemName: "cloud.moon.rain.fill")
                .resizable()
                .scaledToFit()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .white, .cyan)
        case .partlyCloudyWTStormsNight, .mostlyCloudyWTStormsNight:
            Image(systemName: "cloud.moon.bolt.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        }
    }
}
