//
//  ViewController.swift
//  TestNetwork
//
//  Created by Praks on 8/28/19.
//  Copyright © 2019 Praks. All rights reserved.
//

import UIKit
import PSNetwork
import RxSwift
import RxCocoa
import RxSwiftExt

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let networkResponse = Network.dataTask(with: WebRequest.init(router:  Routing.listExchageRate).buildRequest())
        
        let successResponse = networkResponse
            .map { $0?.successResponse }
            .unwrap()

        let statusResponse = networkResponse
            .map { $0?.urlResponse }
            .unwrap()



        successResponse.subscribe { (element) in
            if let elementXist = element.element {
                print(Utils.serializeJSON(data: elementXist))
            }
        }

        statusResponse.subscribe { (element) in
            print(element.element)
        }


        let errorMessage = networkResponse
            .map { $0?.failResponse?.localizedDescription }
            .unwrap()
    }


}





