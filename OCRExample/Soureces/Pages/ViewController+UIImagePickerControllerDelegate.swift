//
//  ViewController+UIImagePickerControllerDelegate.swift
//  OCRExample
//
//  Created by HYUN SUNG on 7/3/25.
//
import UIKit

// MARK: - Action
extension ViewController {
    @objc func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
}

// MARK: - Delegate
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        picker.dismiss(animated: true)

        guard let image = info[.originalImage] as? UIImage else { return }
        self.updateImage(image: image)
        TextRecognitionHelper.recognizeText(from: image) { [weak self] in
            self?.updateResultLabel(text: $0?.joined(separator: "\n"))
        }
    }
}
