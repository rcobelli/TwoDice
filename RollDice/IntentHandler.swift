//
//  IntentHandler.swift
//  RollDice
//
//  Created by Ryan Cobelli on 10/30/18.
//  Copyright © 2018 rybel-llc. All rights reserved.
//

import Intents


class IntentHandler: INExtension, RollDiceIntentHandling {
	
	// Automatically return a success
	func handle(intent: RollDiceIntent, completion: (RollDiceIntentResponse) -> Void) {
		completion(RollDiceIntentResponse(code: .success, userActivity: nil))
	}
}
