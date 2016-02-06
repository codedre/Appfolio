//
//  DetailViewController.swift
//  WDI Portfolio
//
//  Created by Andre Shonubi on 2/2/16.
//  Copyright © 2016 Andre Shonubi. All rights reserved.
//

import UIKit
import MessageUI

class DetailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var projectTitleLabelView: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var project: Project?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "emailAlert"), animated: true)
        
        
        guard let project = project,
              let heroImage = project.heroImage,
              let title = project.title,
              let description = project.description else{ return }
        
        heroImageView.image = UIImage(named: heroImage)
        projectTitleLabelView.text = title
        descriptionTextView.text = description
    }
    
    func emailAlert() {
        let alertController = UIAlertController(title: "My Resume", message:
            "Would you like a copy of my resume and porfolio sent to your email?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action: UIAlertAction!) in
            self.sendResume()
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func sendResume() {
        
        let linkedin = "http://www.linkedin.com/in/andreshonubi";
        let web = "http://codedre.com/";
        let github = "https://github.com/codedre";
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject("General Assembly Grad: Andre Shonubi's Porfolio and Resume")
            mail.setMessageBody("Thank you for your interest in me as a potential new hire for your business. I have included my resume and contact infomatiion for you convenience. I look forward to speaking with you soon.<br><br><br><br>Website: <a href='\(web)'>\(web)</a><br>LinkedIn: <a href='\(linkedin)'>\(linkedin)</a><br>Github: <a href='\(github)'>\(github)</a>", isHTML: true)
            
            guard let filePathDoc = NSBundle.mainBundle().pathForResource("resume", ofType: "pdf"),
                  let filePathImage = NSBundle.mainBundle().pathForResource("AndreS", ofType: "jpg"),
                  let fileData1 = NSData(contentsOfFile: filePathDoc),
                  let fileData2 = NSData(contentsOfFile: filePathImage) else { return }
            
            
            mail.addAttachmentData(fileData2, mimeType: "image/jpeg", fileName: "AndreS")
            mail.addAttachmentData(fileData1, mimeType: "application/pdf", fileName: "resume")
            
            
            
            presentViewController(mail, animated: true, completion: nil)
            
        } else {
            // give feedback to the user
        }
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Saved")
        case MFMailComposeResultSent.rawValue:
            print("Sent")
        case MFMailComposeResultFailed.rawValue:
            print("Error: \(error?.localizedDescription)")
        default:
            break
        }
        controller.dismissViewControllerAnimated(true, completion: nil)
    }


}
