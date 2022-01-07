//
//  ViewController.swift
//  Scanner
//
//  Created by Mac on 07/01/2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    var strin = ""
    var images: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func navigatePressed(_ sender: Any) {
        navigateToLogin()
    }
    

    @IBAction func nill(_ sender: Any) {
        image.image = UIImage(systemName: "heart")
        
    }
    @IBAction func convertPressed(_ sender: Any) {
        strin = text.text!
            images =  generateQRCode(from: strin)
        print(images)
        image.image = nil
        image.image = images
        
    }
    
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

}

extension UIViewController {
   
    func navigateToLogin() {

        let newStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newController = newStoryboard
            .instantiateViewController(identifier: "Login") as ScannerViewController
        newController.modalTransitionStyle = .crossDissolve
        newController.modalPresentationStyle = .fullScreen
        present(newController, animated: true, completion: nil)

    }
    
    func navigateTofirst() {

        let newStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newController = newStoryboard
            .instantiateViewController(identifier: "Main") as ViewController
        newController.modalTransitionStyle = .crossDissolve
        newController.modalPresentationStyle = .fullScreen
        present(newController, animated: true, completion: nil)

    }
}
