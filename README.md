<img src="https://github.com/chdb-io/chdb/raw/main/docs/_static/snake-chdb.png" width=150>

# chdb-builder
Local `chdb` library and wheel builder for developers

#### Audience
[chdb](https://chdb.io) is automatically built and distributed for end-users.<br>
If you're a developer and need to build chdb locally, this is for you. 

### Features
- builds latest chdb from git
- all dependencies included
- ccache for fast rebuilds

### Usage
Run the included script to download, build and link a `chdb` python wheel

```
./build.sh
```

- Generated wheels will be stored in the `dist` directory.
- Folders for `chdb` and `ccache` will be created locally.
