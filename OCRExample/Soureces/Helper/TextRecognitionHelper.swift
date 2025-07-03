//
//  TextRecognitionHelper.swift
//  OCRExample
//
//  Created by HYUN SUNG on 7/3/25.
//

import UIKit
import Vision

struct TextRecognitionHelper {
    static func recognizeText(
        from image: UIImage?,
        completion: @escaping ([String]?) -> Void
    ) {
        guard let cgImage = image?.cgImage else {
            completion(nil)
            return
        }

        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                completion(nil)
                return
            }

            let texts = observations.compactMap { $0.topCandidates(1).first?.string }
            completion(texts)
        }

        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR", "en-US"]

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            try? handler.perform([request])
        }
    }
}
