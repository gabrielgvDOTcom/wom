//
//  ListView.swift
//  wom
//
//  Created by Gabriel Gárate Vivanco on 27-03-24.
//

import UIKit

final class ListView: BaseController {

    // MARK: - Public properties -
    var presenter: ListPresenterInterface!
    
    // MARK: - IBOutlet -
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: ListCell.self)
        }
    }
    
    // MARK: - Private properties -
    private var emptyView: EmptyView?
    private var data: [DiskEntity] = []

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear(animated: animated)

        emptyView = EmptyView(delegate: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action´s Buttons -
    @IBAction func pushToFavorites(_ sender: UIBarButtonItem) {
        presenter.pushToFavorites()
    }

    // MARK: - Private Functions -
    
    // MARK: - deinit -
    deinit {
        debugPrint("\(String(describing: self)) deinit")
    }
}
extension ListView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ListCell.self)
        cell.display(obj: data[indexPath.row])
        return cell
    }
}
extension ListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushToPreview(obj: data[indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
extension ListView: EmptyDelegate {
    
    func retryOperation(emptyView: EmptyView) {
        presenter.fetchData()
    }
}
extension ListView: ListViewInterface {

    func showProgressHUD() {
        load(true)
    }
    func hideProgressHUD() {
        load(false)
    }
    func setViewTitle(_ title: String?) {
        self.title = title
    }
    func setViewError(_ title: String?, message: String?) {
        emptyView?.present(title, message, content: view)
    }
    
    func deliver(data disk: [DiskEntity]) {
        emptyView?.remove()

        data = disk
        tableView.reloadData()
    }
}
