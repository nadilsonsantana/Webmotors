//
//  ViewController.swift
//  webmotors
//
//  Created by Nadilson Santana on 7/24/22.
//

import UIKit

class ListCarViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = ListCarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        getList()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: ListCarString.xibCellName.rawValue, bundle: nil), forCellReuseIdentifier: ListCarString.cellReuse.rawValue)
    }
    
    func getList() {
        viewModel.getCarList() { success in
            if success {
                self.tableView.reloadData()
            } else {
                //ERROR
            }
        }
    }
    
    func goToDetailView(indexPath: IndexPath) {
        if let detailCar = self.storyboard?.instantiateViewController(withIdentifier: ListCarString.detailCarViewController.rawValue) as? DetailCarViewController {
            detailCar.viewModel.setCarModel(carModel: viewModel.getCarModel(indexPath: indexPath))
            self.present(detailCar, animated: true)
        }
    }
}

extension ListCarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCarString.cellReuse.rawValue, for: indexPath) as? ListCarTableViewCell
        cell?.setupCell(carModel: viewModel.getCarModel(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
}

extension ListCarViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        goToDetailView(indexPath: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            viewModel.getMoreContent { success in
                if success {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
