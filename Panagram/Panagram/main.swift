//
//  main.swift
//  Panagram
//
//  Created by Cody Fazio on 1/28/17.
//  Copyright © 2017 Cody Fazio. All rights reserved.
//

import Foundation

let panagram = Panagram()

if CommandLine.argc < 2 {
    panagram.interactiveMode()
} else {
    panagram.staticMode()
}
