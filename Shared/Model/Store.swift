//
//  Created by Peter Combee on 04/06/2021.
//

import Combine

class Store<State, Action>: ObservableObject {
            
    var derivedCancellables: Set<AnyCancellable> = []
    
    @Published internal(set) var state: State

    let _dispatch: (Action) -> Void
    
    init(state: State, dispatch: @escaping (Action) -> Void) {
        self.state = state
        _dispatch = dispatch
    }
        
    func dispatch(action: Action) {
        _dispatch(action)
    }
    
    func derived<DerivedState: Equatable, ExtractedAction>(
        deriveState: @escaping (State) -> DerivedState,
        embedAction: @escaping (ExtractedAction) -> Action
    ) -> Store<DerivedState, ExtractedAction> {
        let instance = Store<DerivedState, ExtractedAction>(
            state: deriveState(self.state),
            dispatch: { extractedAction in
                self.dispatch(action: embedAction(extractedAction))
            }
        )
        self.$state
            .map(deriveState)
            .removeDuplicates()
            .sink(receiveValue: { instance.state = $0 })
            .store(in: &derivedCancellables)
        return instance
    }
}
