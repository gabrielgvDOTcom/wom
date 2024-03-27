//
//  BaseController.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

class BaseController: UIViewController {

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Random -
    
    func load(_ status: Bool, message: String? = nil) {
        let view = self.navigationController?.view ?? self.view
        if status {
            DispatchQueue.main.async {
                MBProgressHUD.showAdded(to: view!, animated: true)
            }
        } else {
            MBProgressHUD.hide(for: view!, animated: true)
        }
    }
    
    // MARK: - File -
}
