//
//  Cache.swift
//  CatGallery
//
//  Created by dh on 6/22/22.
//

import Foundation
import UIKit

class ImageCache {

    private init() {}

    static let shared = NSCache<NSString, UIImage>()
}
