//
//  SaveToPlist.swift
//  My garden
//
//  Created by Ivan Nikitin on 20/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit


class SaveToPlist {
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    var archiveURL: URL {
        return documentDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
    }
    
    func saveImage (_ image: UIImage, with name: String) {
        let imageURL = documentDirectory.appendingPathComponent(name).appendingPathExtension("png")
        let imageData = image.pngData()
        try? imageData?.write(to: imageURL)
    }
    func loadImageWithName(_ name: String) -> UIImage? {
        let url = documentDirectory.appendingPathComponent(name).appendingPathExtension("png")
        guard let data = try? Data(contentsOf: url) else { print("Can't load image"); return nil }
        let image = UIImage(data: data)
        return image
    }
}
