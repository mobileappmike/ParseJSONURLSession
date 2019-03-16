//
//  ViewController.swift
//  ParseJSONURLSession
//
//  Created by Michael Miles on 3/16/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURL = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            //check for errors
            
            guard let data = data else { return }
            
            do {
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription.name)
                
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
            } catch let jsonError {
                print("Error loading JSON", jsonError)
            }
            
//            let dataString = String(data: data, encoding: .utf8)
//            print(dataString)
        }.resume()
        
//        let myCourse = Course(id: 1, name: "My course", link: "link", imageURL: "imgURL")
//        print(myCourse)
    }


}

