//
//  Created by Peter Combee on 09/06/2021.
//

import Combine

extension AnyPublisher where Output == InternalAction, Failure == Never {
    func flatMapAction(
        _ transform: @escaping (Output) -> Self
    ) -> AnyPublisher<Output, Never> {
        self
            .flatMap { (action: Output) -> Self in
                transform(action)
            }
            .eraseToAnyPublisher()
    }
}
