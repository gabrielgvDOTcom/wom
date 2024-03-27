//
//  EmptyView.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

protocol EmptyDelegate: AnyObject {
    
    func retryOperation(emptyView: EmptyView) -> Void
}
class EmptyView: UIViewController {

    // MARK: - VARs -
    private unowned let delegate: EmptyDelegate

    // MARK: - IBOutlet -
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var retryButton: UIButton!

    // MARK: - Init -
    init(delegate: EmptyDelegate) {
        self.delegate = delegate

        super.init(nibName: "Empty", bundle: Bundle(for: type(of: self)))
        loadViewIfNeeded()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Init -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Action´s Buttons -
    @IBAction func retryTapped(_ sender: UIButton) {
        delegate.retryOperation(emptyView: self)
    }
    
    // MARK: - Random -
    func remove() {
        UIView.animate(
            withDuration: 0.25,
            delay: 0.0,
            options: .allowUserInteraction,
            animations:{ [weak self] () -> Void in
                self?.view.alpha = 0
            }
        ) { [weak self] (_) -> Void in
            self?.view.removeFromSuperview()
            self?.removeFromParent()
        }
    }
    func present(_ title: String?, _ message: String?, content: UIView) {
        titleLabel.text = title ?? "Error"
        subtitleLabel.text = message ?? "Ha ocurrido un error"
        Layout.fill(view: view, container: content)
        
        view.alpha = 0
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.view.alpha = 1
        }
    }

    // MARK: - deinit -
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
