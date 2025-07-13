rm -rf ./output
docker build -t react-inline .
docker create --name react-inline-temp react-inline
docker cp react-inline-temp:/output ./output
docker rm react-inline-temp

