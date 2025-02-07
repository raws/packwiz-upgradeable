# packwiz-upgradeable

packwiz-upgradeable is a CLI tool written in Ruby that helps you check whether the mods included in a [packwiz](https://packwiz.infra.link/) Minecraft mod pack are compatible with a different version of the game. You could, for example, schedule packwiz-upgradeable to run on a schedule, and alert you if your mod pack is finally able to be upgraded to the newest Minecraft release!

packwiz-upgradeable is only able to check compatibility for files with [CurseForge](https://curseforge.com) or [Modrinth](https://modrinth.com) metadata—in other words, mods added using `packwiz curseforge add` or `packwiz modrinth add`. You're on your own for other files!

## Requirements

* Ruby 3.3 or newer

## Usage

To run using a local Ruby installation, use [Bundler](https://bundler.io/) to install Gem dependencies, then run `bin/packwiz-upgradeable`, providing it with a path to a Packwiz `pack.toml` file and a target Minecraft version:

```sh
bundle
bin/packwiz-upgradeable path/to/pack.toml 1.21
```

You can also build a Docker image using the included `Dockerfile` and run it as a container:

```sh
docker build -t packwiz-upgradeable:latest .
docker run --rm --tty -v path/to/pack:/pack:ro packwiz-upgradeable /pack/pack.toml 1.21
```

Only _release_ versions, like `1.21` and `1.21.1`, are supported. Snapshots (`24w21a`), pre-releases (`1.21-pre1`) and release candidates (`1.21-rc1`) will cause packwiz-upgradeable to complain. Per Mojang and Minecraft community convention, packwiz-upgradeable considers `1.21` and `1.21.0` to be equivalent.

packwiz-upgradeable will write to stdout:

```
[Concurrent Chunk Management Engine (Fabric)] ✅ Compatible with 1.21
[Chunky] ✅ Compatible with 1.21
[Cristel Lib] ❌ Not yet compatible with 1.21
[Distant Horizons] ✅ Compatible with 1.21
[Entity Culling] ✅ Compatible with 1.21
[William Wythers' Expanded Ecosphere] ❌ Not yet compatible with 1.21
```

## Development

You can run the tests using Rake:

```sh
rake test
```
