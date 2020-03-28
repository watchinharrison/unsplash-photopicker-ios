//
//  ImageCache.swift
//  UnsplashPhotoPicker
//
//  Created by Bichon, Nicolas on 2018-10-15.
//  Copyright © 2018 Unsplash. All rights reserved.
//

import UIKit

class ImageCache {
    
    let cache: URLCache
    
    init() {
        if #available(iOS 13, *) {
            self.cache = URLCache(
                memoryCapacity: Configuration.shared.memoryCapacity,
                diskCapacity: Configuration.shared.diskCapacity,
                directory: URL(fileURLWithPath: "unsplash")
            )
        } else {
            self.cache = URLCache(
               memoryCapacity: Configuration.shared.memoryCapacity,
               diskCapacity: Configuration.shared.diskCapacity,
               diskPath: "unsplash"
            )
        }
    }

    static let memoryCapacity: Int = 50.megabytes
    static let diskCapacity: Int = 100.megabytes

}

private extension Int {
    var megabytes: Int { return self * 1024 * 1024 }
}
