//
//  Created by Peter Combee on 04/06/2021.
//

import Combine

class Store<State, Action>: ObservableObject {
            
    var derivedCancellables: Set<AnyCancellable> = []
    
    @Published var state: State

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
            .sink(receiveValue: { instance.state = $0 } )
            .store(in: &derivedCancellables)
        return instance
    }
    
    func derivedState<DerivedState: Equatable>(
        deriveState: @escaping (State) -> DerivedState
    ) -> ObservableState<DerivedState> {
        let instance = ObservableState<DerivedState>(state: deriveState(self.state))
        self.$state
            .map(deriveState)
            .removeDuplicates()
            .sink(receiveValue: { instance.state = $0 } )
            .store(in: &derivedCancellables)
        return instance
    }
}

class ObservableState<State>: ObservableObject {
    
    @Published fileprivate(set) var state: State
    
    fileprivate init(state: State) {
        self.state = state
    }
}
