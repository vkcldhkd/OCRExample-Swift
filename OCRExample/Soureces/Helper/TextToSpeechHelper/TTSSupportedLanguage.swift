//
//  TTSSupportedLanguage.swift
//  OCRExample
//
//  Created by HYUN SUNG on 7/3/25.
//

enum TTSSupportedLanguage: String {
    case korean = "ko-KR"
    case english = "en-US"
//    case japanese = "ja-JP"
//    case chinese = "zh-CN"
//    case german = "de-DE"
//    case spanish = "es-ES"
//    case french = "fr-FR"

    var displayName: String {
        switch self {
        case .korean: return "Korean"
        case .english: return "English"
//        case .japanese: return "Japanese"
//        case .chinese: return "Chinese"
//        case .german: return "German"
//        case .spanish: return "Spanish"
//        case .french: return "French"
        }
    }
}
