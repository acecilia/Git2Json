extension Collection {
    func decode<T, IndexType: RawRepresentable>(key: CodingKey, at index: IndexType) throws -> T where IndexType.RawValue == Index, Element == T {
        return try self.decode(key: key, at: index, map: { $0 })
    }

    func decode<T, IndexType: RawRepresentable>(key: CodingKey, at index: IndexType, map: (Element) -> (T?)) throws -> T where IndexType.RawValue == Index {
        guard let element = self[safe: index.rawValue] else {
            let context = DecodingError.Context(codingPath: [key], debugDescription: "Expected value not found at index \(index) of the collection")
            throw DecodingError.valueNotFound(Element.self, context)
        }

        guard let mappedElement = map(element) else {
            let context = DecodingError.Context(codingPath: [key], debugDescription: "Expected value found at index \(index) of the collection, but type mismatch")
            throw DecodingError.typeMismatch(T.self, context)
        }
        return mappedElement
    }
}
