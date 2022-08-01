import Vapor
import Fluent

struct CreateUsers: AsyncMigration {

    func prepare(on database: Database) async throws {
        try await database.schema("users")
            .id()
            .field("username", .string)
            .field("password", .string)
            .unique(on: "username")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("users").delete()
    }

}