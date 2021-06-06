//
//  Created by Peter Combee on 04/06/2021.
//

typealias MainStore = Store<AppState, AppAction>

func makeStore() -> MainStore {
    let appStore = makeAppStore()
    let store = Store(
        state: appStore.state,
        dispatch: appStore.dispatch
    )
    appStore.stateDidChange = { newState in
        store.state = newState
    }
    return store
}

private func makeAppStore() -> AppStore {
    return .init(
        state: .init(),
        reducer: appReducer,
        middlewares: makeMiddlewares()
    )
}

private func appReducer(state: inout AppState, action: InternalAction) {
    switch action {
    case .user(let userAction):
        userReducer(state: &state, action: userAction)
    }
}

private func makeMiddlewares() -> [Middleware<InternalAction, AppState>] {
    [
        userSessionMiddleware(service: LoginServiceStub())
    ]
}
