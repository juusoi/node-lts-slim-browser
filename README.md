# node-lts-slim-browser
Docker image with node 16 slim and rf browser library
## Usage 
`docker build -t test .`

`docker run --rm -v $(pwd)/tests:/robot/tests -v $(pwd)/reports:/robot/reports test --outputdir /robot/reports /robot/tests`
