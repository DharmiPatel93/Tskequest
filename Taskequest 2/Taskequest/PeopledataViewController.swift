//
//  PeopledataViewController.swift
//  Taskequest
//
//  Created by Dharmi Patel on 26/08/22.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { resdata, response, error in
            
        guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = resdata, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


class PeopledataViewController: UIViewController {
   
    @IBOutlet weak var imgview: UIImageView!
    
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblfirstname: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    
    var people:PeopleData?
    var img:UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblfirstname.text = "FirstName: \(people?.first_name)"
        lblLastName.text = "LastName: \(people?.last_name)"
        lblemail.text = "Email Address: \(people?.email)"
        lblGender.text = "Gender: \(people?.gender)"
        lblId.text = "ID:\((people?.id)!)"

        
        var imgurl = "https://robohash.org/"+(people?.avatar)!
        print(imgurl)
        
        imgview.downloaded(from: imgurl)
        
      
        
        
        
    
    }
    


}
