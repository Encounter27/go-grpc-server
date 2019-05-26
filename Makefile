SERVICE_NAME=grpc-server
PROJECTS=$(SERVICE_NAME)/...

all:
	@cd src/ && go install $(PROJECTS)

test:
	@cd src/ && go test -coverprofile=coverage.out $(PROJECTS)
	@go tool cover -html=src/coverage.out

# generate XML report in Cobertura format
test.xml:
	@cd src/ && gocov test $(PROJECTS) | gocov-xml > coverage.xml



clean:
	@rm -rf ./bin/$(SERVICE_NAME)

clean-all:

run-all:
	@./bin/ &


stop-all:
	@pkill -f "./bin/" &
