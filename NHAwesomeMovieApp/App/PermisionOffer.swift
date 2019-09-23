//
//  PermisionOffer.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 23/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Photos

class PermisionOffer {
  static func determinedPHPhotoLibrary() -> String{
        var messageText = ""
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            messageText = "Access is granted by you"
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                messageText = "status is \(newStatus)"
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    messageText = "authorized success"
                }
            })
            messageText = "It is not determined until now"
        case .restricted:
            // same same
            messageText = "you do not have access to photo album."
        case .denied:
            // same same
            messageText = "you has denied the permission."
        @unknown default:
            messageText =  "discovering extensions"
        }
        
        return messageText
    }
}
