//
//  StoryCardViewModel.swift
//  primeiroAppMVVM
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 09/05/24.
//

import UIKit

class StoryCardViewModel {
    
    private var listStory: [Stories]
    
    init(listStory: [Stories]) {
        self.listStory = listStory
    }
    
    public var numberOfItems: Int {
        listStory.count
    }
    
    func loudCurrentStory(indexPath: IndexPath) -> Stories {
        listStory[indexPath.row]
    }
}
