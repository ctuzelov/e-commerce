API_PATH=api/auth
PROTO_OUT_DIR=pkg/proto
PROTO_API_DIR=$(API_PATH)
ARGS=-fix

.PHONY: gen
gen: gen-proto generate

.PHONY: gen-proto
gen-proto:
	protoc \
    	-I $(API_PATH)/v1 \
    	--go_out=$(PROTO_OUT_DIR) --go_opt=paths=source_relative \
    	--go-grpc_out=$(PROTO_OUT_DIR)  --go-grpc_opt=paths=source_relative \
    ./$(PROTO_API_DIR)/v1/*.proto

postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=123 -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=postgres --owner=postgres postgres

dropdb:
	docker exec -it postgres12 dropdb users

migrateup:
	migrate -database 'postgresql://postgres:123@localhost:5432/postgres?sslmode=disable' -path migrations up

migratedown:
	migrate -database 'postgresql://postgres:123@localhost:5432/postgres?sslmode=disable' -path migrations down

fixdirty:
	migrate -database 'postgresql://postgres:123@localhost:5432/postgres?sslmode=disable' -path migrations force 1 

psql:
	docker exec -it postgres12  psql -U root -d postgres