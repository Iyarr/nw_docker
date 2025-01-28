docker container run -d --rm \
  -p 8080:8080 \
  --name plantuml-server \
  plantuml/plantuml-server
sleep 3

rm -rf ./svg/*
for file in ./diags/*.puml; do
  filename=$(basename "$file" .puml)
  touch ./svg/$filename.svg
  curl -X POST --data-binary "@$file" http://localhost:8080/svg > ./svg/$filename.svg
done

docker stop plantuml-server