//
//  Created by Peter Combee on 04/06/2021.
//

import Combine

typealias Reducer<State, Action> = (inout State, Action) -> Void
typealias Middleware<Action, State> = (@escaping () -> State, AnyPublisher<Action, Never>) -> AnyPublisher<Action, Never>

typealias AppReducer = Reducer<AppState, InternalAction>
typealias AppMiddleware = Middleware<InternalAction, AppState>

class AppStore {
            
    let reducer: AppReducer
    let middlewares: [AppMiddleware]
    let publisher = PassthroughSubject<InternalAction, Never>()
    
    public var state: AppState {
        didSet {
            if oldValue != state {
                stateDidChange?(state)
            }
        }
    }
    
    init(
        state: AppState,
        reducer: @escaping AppReducer,
        middlewares: [AppMiddleware]
    ) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
        middlewares.forEach { middleware in
            middleware(
                { [unowned self] in
                    self.state
                },
                publisher.eraseToAnyPublisher()
            )
            .sink(receiveValue: self.internalDispatch)
            .store(in: &middlewareCancellables)
        }
    }
    
    public var stateDidChange: ((AppState) -> Void)?
    private var middlewareCancellables: Set<AnyCancellable> = []
        
    func dispatch(action: AppAction) {
        internalDispatch(action: action.internalAction)
    }
    
    private func internalDispatch(action: InternalAction) {
        print(action)
        reducer(&state, action)
        publisher.send(action)
    }
}
