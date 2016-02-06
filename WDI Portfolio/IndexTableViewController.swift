//
//  IndexTableViewController.swift
//  WDI Portfolio
//
//  Created by Andre Shonubi on 1/31/16.
//  Copyright © 2016 Andre Shonubi. All rights reserved.
//

import UIKit
import MessageUI

class IndexTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    var projects: [Project]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let project1 = Project()
        let project2 = Project()
        let project3 = Project()
        let project4 = Project()
        let project5 = Project()

        
        project1.title = "WDI Admission Project"
        project1.technologies = ["HTML", "CSS", "Javascript"]
        project1.thumbnailImage = "galogo"
        project1.heroImage = "wdiabout-hero"
        project1.description = "Synopsis & Inspiration\n\nThis simple About Me site was built for my application submission for the General Assembly Opportunity Fund Fellowship award. I wanted to show off my love of burgers and put a different spin on the generic about me page.\n\n\nLearning Objectives\n\n\tJust one. Impress us so you can win! (P.S. It worked!)\n\n\nTechnologies Used\n\n\tHTML, CSS, Javascript, Animate.css, Anima.js, Particle.Js\n\n\nFuture Development\n\n\tNothing at this time.\n\n\n"
        
        project2.title = "McDonald's Memory Game"
        project2.technologies = ["HTML", "CSS", "JQuery"]
        project2.thumbnailImage = "galogo"
        project2.heroImage = "mcd-hero"
        project2.description = "Synopsis & Inspiration\n\nThis is my first project for WDI. For this project I was given a choice between one of three games to build. I settled on building the memory game. Just so happened during my planning phase I was eating McDonalds and I decided to build a use case for the game based on being hired by McDonalds to build a memory game for their website. This was a fun 3 day project that I would love to build upon in the future.\n\n\nLearning Objectives\n\n\tUse Javascript or jQuery for DOM manipulation.\n\n\tDeploy online, using Github Project pages.\n\n\tUse semantic markup for HTML and CSS (adhere to best practices)\n\n\nTechnologies Used\n\n\tJQuery, HTML, CSS, Javascript, Trello (project management)\n\n\nFuture Development\n\n\tAdd advertisements\n\tSave best times\n\tLeaderboard for high scores\n\n\n"
        
        project3.title = "Moodie"
        project3.technologies = ["HTML", "CSS", "Express.js", "Node.js", "MongoDB", "Mongoose", "Bootstrap", "TypeKit", "Handlebars", "Passport.js", "Heroku", "jQuery"]
        project3.thumbnailImage = "galogo"
        project3.heroImage = "moodie-hero"
        project3.description = "Synopsis & Inspiration\n\nSecond project for WDI. This project is based on my final project for the Mobile Development (iOS: Swift) part-time course at General Assembly. Fun fact I am now a TA for that course. The site curates nearby food options based on the mood of the user. Users can make custom Mood Lists that contain food types or resturants that they enjoy when in a certain mood and can use those lists to find places to eat. This was my first rails app where I had to build the full-stack.\n\n\nLearning Objectives\n\n\tHave complete RESTful routes\n\n\tUtilize an ORM to create a database table structure\n\n\tHave at least 2 models with at least 1 association\n\n\nTechnologies Used\n\n\tJQuery, Yelp API, Ruby on Rails, SASS, Bootstrap, Heroku, Git\n\n\nFuture Development\n\n\tAdd leaflet for maps\n\tFinish Front-end Views\n\n\n."
        
        project4.title = "Beacon"
        project4.technologies = ["HTML", "CSS", "Express.js", "Node.js", "MongoDB", "Mongoose", "Bootstrap", "TypeKit", "Handlebars", "Passport.js", "Heroku", "jQuery"]
        project4.thumbnailImage = "galogo"
        project4.heroImage = "beacon-hero"
        project4.description = "Synopsis & Inspiration\n\nThis is my third project for WDI. For this project my group and I decided to tackle building a product from a General Assembly UX Design Immersive (UXDI) students final project named Beacon. Part of the decision to select this project was to simulate a real world situation where as a development team we are given wireframs and flow charts and have to build from a specification document. One aspect of the design process we had to tackle was converting the mocks that were designed for a mobile app into a website application.\n\n Beacon allows Lonely Planet users(travelers) to connect with other travelers in the same region, so they can either meet up or read and share suggestions about off-the-beaten-path adventures and real-time events not found in guidebooks.\n\n\nLearning Objectives\n\n\tAn API of your own design, built using Express & Mongoose, which \tserves JSON.\n\n\tFront-end JS code that updates the UI, and makes requests to the API \tusing AJAX.\n\tWorking collaboratively\n\n\nTechnologies Used\n\n\tJQuery, Mongodb, Mongoose, Passportjs, Expressjs, Nodejs, Bootstrap, \tHeroku, Handlebars, Git\n\n\nFuture Development\n\n\tMessaging\n\tOn-boarding process\n\tAdding Geo-location (lat, lon) - ability to filter users by distance\n\tFilter by interests\n\tPush states\n\n\n"
        
        project5.title = "Pop Collector"
        project5.technologies = ["HTML", "CSS", "Express.js", "Node.js", "MongoDB", "Mongoose", "Bootstrap", "TypeKit", "Handlebars", "Passport.js", "Heroku", "jQuery"]
        project5.thumbnailImage = "galogo"
        project5.heroImage = "pop-hero"
        project5.description = "Synopsis & Inspiration\n\nThis is my fourth project for WDI. This project was open ending and I used the opportunity increase my skills in creating MEAN Stack applications. I wanted to spend time in Angular on the front-end and explore different ways to set up my api's and configure express. Once complete the website will serve as a tracking tool for collectors of Funko POP! Vynal figures.\n\nAs a collector myself I have had a bad exprience with tracking sites that are currently availble and I wanted to build my own interface that would allow me to track my collection. The main problem was that there currently isnt a database openly availble for me to retrive information about all of the figures that are avalible. This lead me to build an API that I will release and maintain once complete. \n\n\nLearning Objectives\n\n\tBuild something of your own design\n\n\tPractice AngularJS\n\n\tBuild out a MEAN Stack application\n\n\nTechnologies Used\n\n\tJQuery, Mongodb, Mongoose, Passportjs, Expressjs, Nodejs, Bootstrap, \tHeroku, Git, AngularJS\n\n\nFuture Development\n\n\tComplete API\n\tFinish Front-end Views\n\n\n."
        
        projects = [project1, project2, project3, project4, project5]
        
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Compose, target: self, action: "emailAlert"), animated: true)
        
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCell", forIndexPath: indexPath)

        
        guard let project = projects?[indexPath.row],
              let title = project.title,
              let bgImage = project.heroImage
            else {return cell}
        
        cell.textLabel?.text = title
        cell.textLabel?.font = UIFont(name: "Gotham-Medium", size: 40.0)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.shadowColor = UIColor.blackColor()
        cell.textLabel?.shadowOffset = CGSize(width: -3, height: 4)
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.backgroundColor = UIColor.clearColor()
        
        let grayScaleImage = convertToGrayScale(UIImage(named: bgImage)!)
        let image = UIImageView(image: grayScaleImage)
        let selectedImage = UIImageView(image: UIImage(named: bgImage))
        image.contentMode = UIViewContentMode.ScaleAspectFill
        selectedImage.contentMode = UIViewContentMode.ScaleAspectFill

        cell.backgroundView = image
        cell.selectedBackgroundView = selectedImage

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowProject" {
            let ProjectVC = segue.destinationViewController as? DetailViewController
            
            guard let cell = sender as? UITableViewCell,
                  let indexPath = tableView.indexPathForCell(cell) else {
                  return
            }
            
            ProjectVC?.project = projects?[indexPath.row]
        }
    }
    
    func convertToGrayScale(image: UIImage) -> UIImage {
        let imageRect:CGRect = CGRectMake(0, 0, image.size.width, image.size.height)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let width = image.size.width
        let height = image.size.height
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.None.rawValue)
        let context = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, colorSpace, bitmapInfo.rawValue)
        
        CGContextDrawImage(context, imageRect, image.CGImage)
        let imageRef = CGBitmapContextCreateImage(context)
        let newImage = UIImage(CGImage: imageRef!)
        
        return newImage
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
            mail.setMessageBody("Thank you for your interest in me as a potential new hire for your business. I have included my resume and contact infomatiion for you convenience. I look forward to speaking with you soon.<br><br><br><br>Email: andre@codedre.com<br>Website: <a href='\(web)'>\(web)</a><br>LinkedIn: <a href='\(linkedin)'>\(linkedin)</a><br>Github: <a href='\(github)'>\(github)</a>", isHTML: true)
            
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
