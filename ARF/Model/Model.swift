//
//  Model.swift
//  ARF
//
//  Created by Alexander Römer on 22.01.21.
//

import SwiftUI
import Combine
import RealityKit
import ARKit

enum ModelCategory: CaseIterable {
    case table, chair, decor, light
    
    var label: String {
        get {
            switch self {
            case .table:
                return "Tables"
            case .chair:
                return "Chairs"
            case .decor:
                return "Decors"
            case .light:
                return "Lights"
            }
        }
    }
}


class Model {
    var name: String
    var category: ModelCategory
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    internal init(name: String, category: ModelCategory, scaleCompensation: Float = 1.0) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scaleCompensation = scaleCompensation
    }
    
    //TODO: Create a method to async load model
    func asyncLoadModelEntity() {
        let filename = self.name + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error):
                    print("Unable to load modelEntity for \(filename). Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation
            })
        
    }
    
    
}


struct Models {
    var all: [Model] = []
    init() {
        let desk = Model(name: "Desk", category: .table, scaleCompensation: 0.32/100)
        let deskSet = Model(name: "Desk_Set", category: .table, scaleCompensation: 0.32/100)
        self.all += [desk, deskSet]
        
        let chair = Model(name: "redchair", category: .chair, scaleCompensation: 0.32/100)
        self.all += [chair]

        let tulip = Model(name: "tulip", category: .decor)
        let cupandsaucer = Model(name: "cupandsaucer", category: .decor)
        let trowel = Model(name: "trowel", category: .decor)
        let teapot = Model(name: "teapot", category: .decor)
        self.all += [tulip, cupandsaucer, trowel, teapot]
        
        let lamp = Model(name: "Lamp", category: .light)
        let retrotv = Model(name: "retrotv", category: .light)
        self.all += [lamp, retrotv]

        //        let diningChair = Model(name: "dining_chair", category: .chair, scaleCompensation: 0.32/100)
        //        let eamesChairWhite = Model(name: "eames_chair_white", category: .chair, 
        
//        let diningChair = Model(name: "dining_chair", category: .chair, scaleCompensation: 0.32/100)
//        let eamesChairWhite = Model(name: "eames_chair_white", category: .chair, scaleCompensation: 0.32/100)
//        let eamesChairWoodgrain = Model(name: "eames_chair_woodgrain", category: .chair, scaleCompensation: 0.32/100)
//        let eamesChairBlackLeather = Model(name: "eames_chair_black_leather", category: .chair, scaleCompensation: 0.32/100)
//        let eamesChairBrownLeather = Model(name: "eames_chair_brown_leather", category: .chair, scaleCompensation: 0.32/100)
//
//        self.all += [diningChair, eamesChairWhite, eamesChairWoodgrain, eamesChairBlackLeather, eamesChairBrownLeather]
//
//        let cupSaucerSet = Model(name: "cup_saucer_set", category: .decor)
//        let teaPot = Model(name: "teapot", category: .decor)
//        let flowerTulip = Model(name: "flower_tulip", category: .decor)
//        let plateSetDark = Model(name: "plate_set_dark", category: .decor, scaleCompensation: 0.32/100)
//        let plateSetLight = Model(name: "plate_set_light", category: .decor, scaleCompensation: 0.32/100)
//        let pottedFloorPlant = Model(name: "potted_floor_plant", category: .decor, scaleCompensation: 0.8)
//
//        self.all += [cupSaucerSet, teaPot, flowerTulip, plateSetDark, plateSetDark, plateSetLight, pottedFloorPlant]
//
//        let floorLampClassic = Model(name: "floor_Lamp_classic", category: .light, scaleCompensation: 0.01)
//        let floorLampModern = Model(name: "floor_lamp_modern", category: .light, scaleCompensation: 0.01)
//
//        self.all += [floorLampClassic, floorLampModern]
    }
    
    
    
    func get(category: ModelCategory) -> [Model] {
        all.filter({ $0.category == category })
    }
    
}
