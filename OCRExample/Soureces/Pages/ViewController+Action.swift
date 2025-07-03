//
//  ViewController+Action.swift
//  OCRExample
//
//  Created by HYUN SUNG on 7/3/25.
//

import UIKit

extension ViewController {
    @objc func didTapResultLabel() {
        DispatchQueue.main.async {
            guard let text = self.getResultLabelText(),
                  !text.isEmpty else { return }
            TextToSpeechHelper.shared.speak(text: text)
        }
    }
}
