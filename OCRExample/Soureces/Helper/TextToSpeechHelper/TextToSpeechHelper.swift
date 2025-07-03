//
//  Untitled.swift
//  OCRExample
//
//  Created by HYUN SUNG on 7/3/25.
//

import AVFoundation

final class TextToSpeechHelper {
    // MARK: - Constants
    static let shared = TextToSpeechHelper()
    
    // MARK: - Properties
    private let synthesizer = AVSpeechSynthesizer()
    
    // MARK: - Initializing
    private init() {}

    var isSpeaking: Bool {
        return self.synthesizer.isSpeaking
    }
}

// MARK: - Action
extension TextToSpeechHelper {
    func speak(
        text: String,
        language: TTSSupportedLanguage = .korean,
        rate: Float = AVSpeechUtteranceDefaultSpeechRate
    ) {
        if self.synthesizer.isSpeaking {
            self.synthesizer.stopSpeaking(at: .immediate)
        }

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language.rawValue)
        utterance.rate = rate

        self.synthesizer.speak(utterance)
    }

    func stop() {
        if self.synthesizer.isSpeaking {
            self.synthesizer.stopSpeaking(at: .immediate)
        }
    }
}
