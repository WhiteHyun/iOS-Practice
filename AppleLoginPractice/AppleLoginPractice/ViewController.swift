//
//  ViewController.swift
//  AppleLoginPractice
//
//  Created by 홍승현 on 2022/09/28.
//

import AuthenticationServices
import UIKit

final class ViewController: UIViewController {
  
  private let signInButton = ASAuthorizationAppleIDButton(type: .signUp, style: .white)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(signInButton)
    signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    signInButton.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
    signInButton.center = view.center
  }
  
  @objc func didTapSignIn() {
    let provider = ASAuthorizationAppleIDProvider()
    let request = provider.createRequest()
    request.requestedScopes = [.fullName, .email]
    
    let controller = ASAuthorizationController(authorizationRequests: [request])
    controller.delegate = self
    controller.presentationContextProvider = self
    controller.performRequests()
  }
}

extension ViewController: ASAuthorizationControllerDelegate {
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    switch authorization.credential {
    case let credentials as ASAuthorizationAppleIDCredential:
      let userID = credentials.user
      let firstName = credentials.fullName?.givenName
      let lastName = credentials.fullName?.familyName
      let email = credentials.email
      print("User ID: \(userID)")
      print("User First Name: \(firstName ?? "")")
      print("User Last Name: \(lastName ?? "")")
      print("User Email: \(email ?? "")")
      print("User Code: \(String(decoding: credentials.authorizationCode!, as: UTF8.self))")
      print("User token: \(String(decoding: credentials.identityToken!, as: UTF8.self))")
      
      // TODO: 서버에 정보 전달
    default:
      break
    }
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    print("Failed!: \(error)")
  }
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    return view.window!
  }
}

/*
 User ID: 001550.26c1b476705b4a9d92a5d7f0e10a98e3.0610
 User First Name:
 User Last Name:
 User Email:
 User Code: c81bccd0015324ad9ab1ad886c464821a.0.srvvq.A2rFbsq2cI-EkFtxHRZHHw
 User token: eyJraWQiOiJZdXlYb1kiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwcGxlaWQuYXBwbGUuY29tIiwiYXVkIjoiY29tLndoaXRlaHl1bi5BcHBsZUxvZ2luUHJhY3RpY2UiLCJleHAiOjE2NjQ5NjM5NTEsImlhdCI6MTY2NDg3NzU1MSwic3ViIjoiMDAxNTUwLjI2YzFiNDc2NzA1YjRhOWQ5MmE1ZDdmMGUxMGE5OGUzLjA2MTAiLCJjX2hhc2giOiJzbFVTSFBwTmtqbWZya0NmSDc5eEl3IiwiZW1haWwiOiJmeDZycDhwNWMyQHByaXZhdGVyZWxheS5hcHBsZWlkLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjoidHJ1ZSIsImlzX3ByaXZhdGVfZW1haWwiOiJ0cnVlIiwiYXV0aF90aW1lIjoxNjY0ODc3NTUxLCJub25jZV9zdXBwb3J0ZWQiOnRydWV9.LpkArw0fYETWciWKtH0J5qmbQF1K6jTlslOg83AP3bQvnWgPp4S6qK7q8n_ZFot-5GeGVQv-unhKIVLynUGyfZYQRmw7i6cXTLHf8MQ35em98SUH-oE4sz79E3SqIfGKr4A0lqzdKFJyKccIAibCLoJIHXMPUPddbeq0Mh3yQMaVYbNXlrNjxphepQFIQamB11rMLG35kRZxpXdobvG5RzetbIg-AQKbycC_6Rdt0H1I8POV8mkv86CZVjD0t9c7UBvsaaidzE8ssfcdFPpvO1rMoeWMbQzZAaJQYxD-hlC4cmSeUnM-Sk0bVZUtyYkxCx7t-GrHl3UE18_ZGWmi-w

 
 User ID: 001550.26c1b476705b4a9d92a5d7f0e10a98e3.0610
 User First Name:
 User Last Name:
 User Email:
 User Code: c0e5f2a3969614bc6b16e4f8ebd872474.0.rrvvq.bfEckm9Sdxje1k0yJePklQ
 User token: eyJraWQiOiJZdXlYb1kiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwcGxlaWQuYXBwbGUuY29tIiwiYXVkIjoiY29tLndoaXRlaHl1bi5BcHBsZUxvZ2luUHJhY3RpY2UiLCJleHAiOjE2NjQ5NzI3MzcsImlhdCI6MTY2NDg4NjMzNywic3ViIjoiMDAxNTUwLjI2YzFiNDc2NzA1YjRhOWQ5MmE1ZDdmMGUxMGE5OGUzLjA2MTAiLCJjX2hhc2giOiJxbWFSVFdUVkNqbDk0dlpPRjJzSDFnIiwiZW1haWwiOiJmeDZycDhwNWMyQHByaXZhdGVyZWxheS5hcHBsZWlkLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjoidHJ1ZSIsImlzX3ByaXZhdGVfZW1haWwiOiJ0cnVlIiwiYXV0aF90aW1lIjoxNjY0ODg2MzM3LCJub25jZV9zdXBwb3J0ZWQiOnRydWV9.bZATZA-oen9-JNtvteWvpoWftS9Qjr9V3FNsP7AiQO9pvZ-bnLRUZzt_V0C14hJrZ7hK_9ygkdPPZ6pFkAXrXAsFDdiwqt7foOIGUbpAaT-VUNwgCjAlprTCtUwVO2bC9KZaOYLgU2dY-FiSxrq_MqoTGxyxvPDb9TQ4eBhOIt2mpMLYry1dya4bB04pyZXZrEgBCMQesi-Mqk_sNLA4x-WfuY6wojZpDqgy12Sjx4vxEJsXfQFGooQ6nXECotCpxrzYZt3b0zBpODGMHzJtUOVIWmkOmsjGtlJkdJhFGMXealwO1FUOo2BHQG3zjnUCgcMV8gIpya0O2y3tCi-X2A

 */
