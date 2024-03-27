//
//  PreviewView.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit
import Kingfisher

final class PreviewView: UIViewController {

    // MARK: - Public properties -
    var presenter: PreviewPresenterInterface!
    
    // MARK: - IBoulet properties -
    @IBOutlet weak var portraitImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    // MARK: - Private properties -

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action´s Buttons -
    @IBAction func updateFavorites(_ sender: UIBarButtonItem) {
        presenter.updateFavorites()
    }
    
    // MARK: - Private Functions -
    
    // MARK: - deinit -
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension PreviewView: PreviewViewInterface {

    func showProgressHUD() {}
    func hideProgressHUD() {}
    func setViewTitle(_ title: String?) {
        self.title = title
    }
    func setViewError(_ title: String?, message: String?) {}
    
    func deliver(obj disk: DiskEntity) {
        self.titleLabel.text = disk.title
        self.yearLabel.text = disk.author
        
        let url = URL(string: disk.image)
        portraitImage.kf.setImage(with: url)
    }
}
