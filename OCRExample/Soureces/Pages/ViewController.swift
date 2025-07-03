//
//  ViewController.swift
//  OCRExample
//
//  Created by HYUN SUNG on 7/3/25.
//

import UIKit
import Vision

final class ViewController: UIViewController, UINavigationControllerDelegate {
    // MARK: - UI
    private let imageView = UIImageView()
    private let resultLabel = UILabel()
    private let pickButton = UIButton(type: .system)
    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupConstraints()
    }
}

extension ViewController {
    func updateImage(image: UIImage?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
    func updateResultLabel(text: String?) {
        DispatchQueue.main.async {
            self.resultLabel.text = text
        }
    }
}

// MARK: - Setup
private extension ViewController {
    // MARK: - setupUI
    func setupUI() {
        self.view.backgroundColor = .white

        self.imageView.contentMode = .scaleAspectFit
        self.resultLabel.numberOfLines = 0
        self.resultLabel.textAlignment = .center

        self.pickButton.setTitle("사진 선택", for: .normal)
        self.pickButton.addTarget(self, action: #selector(self.selectImage), for: .touchUpInside)

        self.stackView.addArrangedSubview(self.imageView)
        self.stackView.addArrangedSubview(self.pickButton)
        self.stackView.addArrangedSubview(self.resultLabel)
        
        self.stackView.axis = .vertical
        self.stackView.spacing = 20
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.stackView)
    }
    
    // MARK: - setupConstraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            self.stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}
