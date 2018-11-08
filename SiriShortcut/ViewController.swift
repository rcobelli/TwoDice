//
//  ViewController.swift
//  SiriShortcut
//
//  Created by Ryan Cobelli on 10/30/18.
//  Copyright © 2018 rybel-llc. All rights reserved.
//

import UIKit
import Intents
import IntentsUI

class ViewController: UIViewController, INUIAddVoiceShortcutViewControllerDelegate, INUIEditVoiceShortcutViewControllerDelegate {
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Donate the interaction so that the system has it
		let interaction = INInteraction(intent: RollDiceIntent(), response: nil)
		interaction.donate { error in
			print(error as Any)
		}
	}
	
	// Create the add to Siri button
	override func viewDidAppear(_ animated: Bool) {
		let button = INUIAddVoiceShortcutButton(style: .whiteOutline)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(button)
		view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
		view.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
		
		button.addTarget(self, action: #selector(addToSiri(_:)), for: .touchUpInside)
	}
	
	// Show the system dialog to add the shortcut
	@objc
	func addToSiri(_ sender: Any) {
		if let shortcut = INShortcut(intent: RollDiceIntent()) {
			let addVoiceShortcutVC = INUIAddVoiceShortcutViewController(shortcut: shortcut)
			addVoiceShortcutVC.delegate = self
			addVoiceShortcutVC.modalPresentationStyle = .formSheet
			present(addVoiceShortcutVC, animated: true, completion: nil)
		}
	}
	
	// MARK: - INUIAddVoiceShortcutViewControllerDelegates
	
	func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
		controller.dismiss(animated: true, completion: nil)
	}
	
	func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
		controller.dismiss(animated: true, completion: nil)
	}
	
	// MARK: - INUIEditVoiceShortcutViewControllerDelegates
	
	func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didUpdate voiceShortcut: INVoiceShortcut?, error: Error?) {
		controller.dismiss(animated: true, completion: nil)
	}
	
	func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController, didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
		controller.dismiss(animated: true, completion: nil)
	}
	
	func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
		controller.dismiss(animated: true, completion: nil)
	}
	

}

