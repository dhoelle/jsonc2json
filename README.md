# jsonc2json
A command-line tool to convert json-with-comments ("jsonc") to json, by stripping comments.

Under the hood, it's just a thin wrapper around the excellent github.com/muhammadmuzzammil1998/jsonc

## Usage
```shell
$ echo '{"foo":"bar // baz" /* comment 1 */ } // comment 2' | jsonc2json
{"foo":"bar // baz"}
```

## Install
```shell
$ go install github.com/dhoelle/jsonc2json
```

## Docker
```shell
$ echo '{"foo":"bar // baz" /* comment 1 */ } // comment 2' | docker run -i dhoelle/jsonc2json
```
