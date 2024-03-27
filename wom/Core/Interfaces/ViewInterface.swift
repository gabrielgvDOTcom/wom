//
//  ViewInterface.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

public protocol ViewInterface: AnyObject {

    func showProgressHUD()
    func hideProgressHUD()
    func setViewTitle(_ title: String?)
    func setViewError(_ title: String?, message: String?)
}
extension ViewInterface {

    func showProgressHUD() {}
    func hideProgressHUD() {}
    func setViewTitle(_ title: String?) {}
    func setViewError(_ title: String?, message: String?) {}
}
