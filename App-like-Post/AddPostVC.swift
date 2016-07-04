//
//  AddPostVC.swift
//  App-like-Post
//
//  Created by Khaled Rahman Ayon on 03/07/16.
//  Copyright © 2016 iosApp. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var titlefield: UITextField!
    @IBOutlet var descField: UITextField!
    @IBOutlet var imgField: UIImageView!
    
    var imgPicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgField.layer.cornerRadius = imgField.frame.size.width / 2
        imgField.clipsToBounds = true
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPicBtnPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPostBtnPressed(sender: AnyObject) {
        
        if let title = titlefield.text, let desc = descField.text, let img = imgField.image {
            
            
            let imgPath = DataService.instance.addImageCreatPath(img)
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        imgField.image = image
    }

}
