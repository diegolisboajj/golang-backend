createdb:
	createdb --username=postgres --owner=postgres go_finance

postgres:
	docker run --name myPostgresDb -p 5455:5455 -e POSTGRES_PASSWORD=abc300183 -d postgres:14-alpine 

migrateup:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5455/soacheiofertas?sslmode=disable" -verbose up

migrationdrop:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/go_finance?sslmode=disable" -verbose down

test:
	go test -v -cover ./...

server:
	go run main.go

.PHONY: createdb postgres dropdb migrateup migrationdrop test server