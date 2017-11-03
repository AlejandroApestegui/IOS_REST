//
//  UsuarioVistaViewController.swift
//  DemoRestServices
//
//  Created by Alejandro Apestegui on 11/1/17.
//  Copyright © 2017 Francisco Sanchez. All rights reserved.
//

import UIKit

class UsuarioVistaViewController: UIViewController {

    @IBOutlet weak var tvId: UITextField!
    @IBOutlet weak var tvNombre: UITextField!
    @IBOutlet weak var tvCelular: UITextField!
    @IBOutlet weak var tvUsuario: UITextField!
    @IBOutlet weak var tvWeb: UITextField!
    @IBOutlet weak var tvCiudad: UITextField!
    @IBOutlet weak var tvCalle: UITextField!
    @IBOutlet weak var tvLat: UITextField!
    @IBOutlet weak var tvLon: UITextField!
    @IBOutlet weak var tvSuite: UITextField!    
    @IBOutlet weak var tvZip: UITextField!
    
    @IBOutlet weak var tvEmail: UITextField!
    static var registro:Dictionary<String, AnyObject> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tvId.text = String(UsuarioVistaViewController.registro["id"] as! Int)
        self.tvNombre.text = UsuarioVistaViewController.registro["name"] as! String
        self.tvEmail.text = UsuarioVistaViewController.registro["email"] as! String
        self.tvCelular.text = UsuarioVistaViewController.registro["phone"] as! String
        self.tvUsuario.text = UsuarioVistaViewController.registro["username"] as! String
        self.tvWeb.text = UsuarioVistaViewController.registro["website"] as! String
        self.tvCiudad.text = UsuarioVistaViewController.registro["address"]?["city"] as! String
        self.tvCalle.text = UsuarioVistaViewController.registro["address"]?["street"] as! String
        
        let address: Dictionary<String, AnyObject> = UsuarioVistaViewController.registro["address"] as! Dictionary<String, AnyObject>
        let geo: Dictionary<String, AnyObject> = address["geo"] as! Dictionary<String, AnyObject>
        
        self.tvLat.text = geo["lat"] as! String
        self.tvLon.text = geo["lng"] as! String
        self.tvSuite.text = address["suite"] as! String
        self.tvZip.text = address["zipcode"] as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
