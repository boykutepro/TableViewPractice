//
//  CustomTableView.swift
//  TableView_BTVN
//
//  Created by Thiện Tùng on 12/28/19.
//  Copyright © 2019 tung. All rights reserved.
//

import UIKit

class CustomTableView: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    } ()
    
    var myData: [car] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Don't have title"
        
        // Do any additional setup after loading the view.
//        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        ///
        data()
        configTable()
        
    }
    func configTable(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func data(){
        myData = [car(nameCar: "Mercedes", nameImageCar: "mercedes", price: "4.999.000.000"),
                  car(nameCar: "Posrche", nameImageCar: "posrche", price: "14.999.000.000"),
                  car(nameCar: "BMW", nameImageCar: "bmw", price: "12.999.000.000"),
                  car(nameCar: "Vinfast", nameImageCar: "vin", price: "1.499.000.000"),
                  car(nameCar: "Mercedes", nameImageCar: "mercedes", price: "4.999.000.000"),
                  car(nameCar: "Posrche", nameImageCar: "posrche", price: "14.999.000.000"),
                  car(nameCar: "BMW", nameImageCar: "bmw", price: "12.999.000.000"),
                  car(nameCar: "Vinfast", nameImageCar: "vin", price: "1.499.000.000"),
                  car(nameCar: "Mercedes", nameImageCar: "mercedes", price: "4.999.000.000"),
                  car(nameCar: "Posrche", nameImageCar: "posrche", price: "14.999.000.000"),
                  car(nameCar: "BMW", nameImageCar: "bmw", price: "12.999.000.000"),
                  car(nameCar: "Vinfast", nameImageCar: "vin", price: "1.499.000.000")]
        
    }
    
}

extension CustomTableView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        cell = tableView.dequeueReusableCell(withIdentifier: "id")
        
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "id")
        }
        cell?.textLabel?.text = myData[indexPath.row].nameCar
        cell?.detailTextLabel?.text = myData[indexPath.row].price
        cell?.imageView?.image = UIImage(named: myData[indexPath.row].nameImageCar)
        // image
        
        cell?.imageView?.translatesAutoresizingMaskIntoConstraints = false
        cell?.imageView?.widthAnchor.constraint(equalTo: cell!.heightAnchor, multiplier: 1.4 ).isActive = true
        cell?.imageView?.heightAnchor.constraint(equalTo: cell!.heightAnchor, multiplier: 1).isActive = true
        //
        cell?.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        cell?.textLabel?.centerYAnchor.constraint(equalTo: cell!.centerYAnchor, constant: -20).isActive = true
        cell?.textLabel?.leftAnchor.constraint(equalTo: (cell?.imageView!.rightAnchor)!, constant: 150).isActive = true
        cell?.detailTextLabel?.translatesAutoresizingMaskIntoConstraints = false
        cell?.detailTextLabel?.leftAnchor.constraint(equalTo: (cell?.textLabel!.leftAnchor)!, constant: 0).isActive = true
        cell?.detailTextLabel?.topAnchor.constraint(equalTo: (cell?.textLabel!.bottomAnchor)!, constant: 30).isActive = true
        
        
        
        return cell!
    }

}

extension CustomTableView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
