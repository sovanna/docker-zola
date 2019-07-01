# zola
Default docker zola with bash


# Example

```
docker run \
  -p 1111:1111 \
  -v "$PWD:/usr/src/app" \
  -it \
  sovanna/zola

  zola init website
  cd website
  zola serve --interface 0.0.0.0 --port 1111
```