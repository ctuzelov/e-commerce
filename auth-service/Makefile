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