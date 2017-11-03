//
//  CeldaTableViewCell.swift
//  DemoRestServices
//
//  Created by Alejandro Apestegui on 10/31/17.
//  Copyright © 2017 Francisco Sanchez. All rights reserved.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    var registro:Dictionary<String, AnyObject>? = nil;

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func ini(){
        self.idLbl.text =  String(self.registro?["id"] as! Int)
        self.emailLbl.text = self.registro?["email"] as! String
        self.nombreLbl.text = self.registro?["name"] as! String
    }

}
