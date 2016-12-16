//
//  AddTableViewController.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/15/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class AddTableViewController: UITableViewController {

    var eventHandler : AddModuleProtocol?
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    
    var indicator : NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        
    }
    
    private func configureView(){
        // Back Button
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backToRoot))
        // Reset Button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetForm))
        
        indicator = NVActivityIndicatorView(frame: CGRect(x: view.frame.width/2 - 20, y: view.frame.height/2 - 20, width: 40, height: 40), type: NVActivityIndicatorType.ballScaleRippleMultiple, color: UIColor.red, padding: 0)
        
    }
    
    @objc private func backToRoot(){
        eventHandler?.backToRootViewController()
    }
    
    @objc private func resetForm(){
        txtTitle.text = ""
        tvDescription.text = ""
        imgView.image = UIImage(named: "placeholder")
    }
    
    @IBAction func browseImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func savePostDidTap(_ sender: Any) {
        // When click on save we upload the image first
        self.toggleIndicator()
        eventHandler?.uploadImage(imgView.image!)
    }
    
    internal func toggleIndicator(){
        if (indicator?.animating)!{
            indicator?.removeFromSuperview()
            indicator?.stopAnimating()
        }else{
            view.addSubview(indicator!)
            indicator?.startAnimating()
        }
    }
    
}

extension AddTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imgView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
}

extension AddTableViewController : AddModuleDelegate{
    
    func uploadImageSuccess(_ message: String, imageUrl: URL){
        
        // Prepare article to upload
        let artJson = [
            "TITLE" : txtTitle.text!,
            "DESCRIPTION" : tvDescription.text,
            "IMAGE" : imageUrl.absoluteString,
            "CATEGORY" : 0,
            "AUTHOR" : 0
        ] as [String : Any]
        
        let art = Article(JSON: artJson)
        
        eventHandler?.postArticle(art!)
        
    }
    
    func uploadImageFail(_ message: String) {
        print("Message: " + message)
    }
    
    func postArticleSuccess(_ message: String) {
        eventHandler?.backToRootViewController()
    }
    
    func postArticleFail(_ message: String) {
        print("Message: " + message)
    }
    
}
