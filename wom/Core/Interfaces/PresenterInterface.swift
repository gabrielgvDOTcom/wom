//
//  PresenterInterface.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//
public protocol PresenterInterface: AnyObject {

    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
}
extension PresenterInterface {
    
    func viewDidLoad() {
        fatalError("Implementation pending...")
    }
    func viewWillAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    func viewDidAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    func viewWillDisappear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    func viewDidDisappear(animated: Bool) {
        fatalError("Implementation pending...")
    }
}
