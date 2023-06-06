//
//  View Controller.swift
//  plant disease
//
//  Created by Chloe Yoo on 6/6/23.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var resultLabel: UITextField!

    var model: VNCoreMLModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true

        // Load the ML model
        guard let mlModel = try? VNCoreMLModel(for: MyImageClassifier_1().model) else {
            fatalError("Failed to load ML model")
        }
        model = mlModel
    }
    @IBAction func uploadImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        let newSize = widthRatio < heightRatio ? CGSize(width: size.width * widthRatio, height: size.height * widthRatio) : CGSize(width: size.width * heightRatio, height: size.height * heightRatio)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        image.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
    selectedImageView.image = selectedImage
    }
    picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func processImageButtonTapped(_ sender: Any) {
        guard let image = selectedImageView.image else {
            return
        }
        classifyImage(image)
        resultLabel.isHidden = false
    }

    func classifyImage(_ image: UIImage) {
        let resizedImage = resizeImage(image: image, targetSize: CGSize(width: 224, height: 224)) // Change the target size to match your model's input size
        guard let ciImage = CIImage(image: resizedImage) else {
            fatalError("Failed to convert UIImage to CIImage")
        }
        guard let ciImage = CIImage(image: image) else {
            fatalError("Failed to convert UIImage to CIImage")
        }

        let request = VNCoreMLRequest(model: model!) { (request, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let results = request.results as? [VNClassificationObservation] else {
                return
            }

            // Handle the ML model output
            if let bestResult = results.first {
                DispatchQueue.main.async {
                    self.resultLabel.text = "Classification: \(bestResult.identifier) - Confidence: \(bestResult.confidence * 100)%"
                }
            }
        }

        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])

        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform classification: \(error.localizedDescription)")
        }
    }
}
