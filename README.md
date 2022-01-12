## Docker-aws-cli

This project intends to allow interactive actions with aws-cli using a docker image. It does not impose aws-cli as an entrypoint to let users run other commands if necessary.

To build the image, clone this project and run the following command in its current directory.
```sh
docker build --no-cache -t docker-aws-cli .
```

To use it with your local **.aws** configuration directory, you can use the following command.
```sh
docker run -it --rm -v $HOME/.aws:/home/aws/.aws docker-aws-cli
```


### Example

- List buckets on S3

In one command
```sh
docker run -it --rm -v $HOME/.aws:/home/aws/.aws docker-aws-cli aws s3 ls
```
or, inside the container
```sh
docker run -it --rm -v $HOME/.aws:/home/aws/.aws docker-aws-cli

[aws-cli]$ aws s3 ls
```
