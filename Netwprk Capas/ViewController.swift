//
//  ViewController.swift
//  Netwprk Capas
//
//  Created by Riccardo Mija Padilla on 28/04/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        APIClient.getCharacter(id: "1") { result in
            
            
            
            switch result {
            case .success(let response):
                
                self.lblName.text = response.name
                
            case .failure(let error):
                
                print(error)
                
                
                
            }
        }
        
    }
    
    
}

