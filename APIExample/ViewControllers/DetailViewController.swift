//
//  DetailViewController.swift
//  APIExample
//
//  Created by Justin on 9/18/18.
//  Copyright © 2018 Justin. All rights reserved.

import Foundation
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblHeaderTitle: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDrive: UILabel!
    @IBOutlet weak var lblDisplacement: UILabel!
    @IBOutlet weak var lblPower: UILabel!
    @IBOutlet weak var lblTorque: UILabel!
    
    var manufacturer: String = ""
    var model: String = ""
    var modelYear: String = ""
    var trim: String = ""
    var engineLocation: String = ""
    var wheelDrive: String = ""
    var engineSize: String = ""
    var hp: String = ""
    var tq: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.configureView()
        }
    }
    
    var detailItem: AllNodesQuery.Data.ListCar.Item?{
        didSet {
            self.manufacturer = (detailItem?.manufacturer)!
            self.model = (detailItem?.model)!
            self.modelYear = (detailItem?.modelYear)!
            self.trim = (detailItem?.trim)!
            self.engineLocation = (detailItem?.engineLocation)!
            self.wheelDrive = (detailItem?.wheelDrive)!
            self.engineSize = (detailItem?.engineSize)!
            self.hp = (detailItem?.hp)!
            self.tq = (detailItem?.tq)!
            }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.configureView()
        }
    }
    
    func configureView() {
            self.lblHeaderTitle.dropShadow(offsetX: 0, offsetY: 0, color: .red, opacity: 0.5, radius: 1.5)
            self.lblHeaderTitle.text = self.modelYear + " " + self.manufacturer + " " + self.model + " " + self.trim
            self.lblType.text = "Vehicle Type: " + self.engineLocation + "-Engine"
            self.lblDrive.text = self.wheelDrive + "-Wheel Drive"
            self.lblDisplacement.text = "Displacement: " + self.engineSize + " L"
            self.lblPower.text = "Power: " + self.hp
            self.lblTorque.text = "Torque: " + tq
    }
}
extension UILabel {
    func dropShadow(offsetX: CGFloat, offsetY: CGFloat, color: UIColor, opacity: Float, radius: CGFloat, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}
