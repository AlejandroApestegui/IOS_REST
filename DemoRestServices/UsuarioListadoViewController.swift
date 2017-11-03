//
//  UsuarioListadoViewController.swift
//  DemoRestServices
//
//  Created by Alejandro Apestegui on 11/1/17.
//  Copyright © 2017 Francisco Sanchez. All rights reserved.
//

import UIKit

class UsuarioListadoViewController: UIViewController {
    
    @IBOutlet weak var coleccion: UITableView!
    var lstUsuario: Array<AnyObject> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Seleccionar un usuario"
        let url: String = "https://jsonplaceholder.typicode.com/users"
        
        if(NetworkManager.isConnectedToNetwork()){
            
            NetworkManager.sharedInstance.callUrlWithCompletion(url: url, params: nil, completion: { (finished, response) in
                
                if(finished){
                    
                    self.lstUsuario = response
                    
                    self.coleccion.reloadData()
                    
                }else{
                    /// error de conexion
                }
            }, method: .get)
        }else{
            // debo indicar que no hay internet
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension UsuarioListadoViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lstUsuario.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier:"Celda") as! CeldaTableViewCell
        cel.registro = self.lstUsuario[indexPath.row] as! Dictionary<String, AnyObject>
        cel.ini()
        return cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        UsuarioVistaViewController.registro = self.lstUsuario[indexPath.row] as! Dictionary<String, AnyObject>
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UsuarioVistaViewController") as! UsuarioVistaViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
        
}
