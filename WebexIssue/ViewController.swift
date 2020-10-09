//
//  ViewController.swift
//  WebexIssue
//
//  Created by Evgeniy Gurtovoy on 09.10.2020.
//

import UIKit
import WebexSDK

class ViewController: UIViewController {
    private var webexSDK: Webex?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebex()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.presentPicker()
        }
    }
}

private class WebexEnvirmonment {
    static let clientId = "C416dd36dd57b536a35816978e4f063a98849d285ca191f5566a32c0f0c3481ab"
    static let clientSecret = "bc851e0f4d4bd62c020a45de08e374101910200d43096f32d14b9e08164adac7"
    static let scope = "spark:all"
    static let redirectUri = "KitchenSink://response"
}

private extension ViewController {
    func setupWebex() {
        let authenticator = OAuthAuthenticator(clientId: WebexEnvirmonment.clientId,
                                               clientSecret: WebexEnvirmonment.clientSecret,
                                               scope: WebexEnvirmonment.scope,
                                               redirectUri: WebexEnvirmonment.redirectUri)
        webexSDK = Webex(authenticator: authenticator)
    }
    
    func presentPicker() {
        let pickerController = UIImagePickerController()
        pickerController.mediaTypes = ["public.image", "public.movie"]
        pickerController.sourceType = .camera
        present(pickerController, animated:true)
    }
}

