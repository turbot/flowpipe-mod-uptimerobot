# UptimeRobot Mod for Flowpipe

UptimeRobot pipeline library for [Flowpipe](https://flowpipe.io) enabling seamless integration of UptimeRobot services into your workflows.

## Documentation

- **[Pipelines →](https://hub.flowpipe.io/mods/turbot/uptimerobot/pipelines)**

## Getting Started

### Installation

Download and install Flowpipe (https://flowpipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install flowpipe
```

### Credentials

By default, the following environment variables will be used for authentication:

- `UPTIMEROBOT_API_KEY`

You can also create `credential` resources in configuration files:

```sh
vi ~/.flowpipe/config/uptimerobot.fpc
```

```hcl
credential "uptimerobot" "my_uptimerobot" {
  api_key = "u1123455-ecaf32fwer633fdf4f33dd3c445"
}
```

For more information on credentials in Flowpipe, please see [Managing Credentials](https://flowpipe.io/docs/run/credentials).

### Usage

[Initialize a mod](https://www.flowpipe.io/docs/mods/index#initializing-a-mod):

```sh
mkdir my_mod
cd my_mod
flowpipe mod init
```

[Install the UptimeRobot mod](https://www.flowpipe.io/docs/mods/mod-dependencies#mod-dependencies) as a dependency:

```sh
flowpipe mod install github.com/turbot/flowpipe-mod-uptimerobot
```

[Use the dependency](https://www.flowpipe.io/docs/mods/write-pipelines/index) in a pipeline step:

```sh
vi my_pipeline.fp
```

```hcl
pipeline "my_pipeline" {

  step "pipeline" "create_monitor" {
    pipeline = uptimerobot.pipeline.create_monitor
    args = {
      friendly_name = "My New Monitor"
      url           = "https://example.com"
      type          = "1"
    }
  }
}
```

[Run the pipeline](https://www.flowpipe.io/docs/run/pipelines):

```sh
flowpipe pipeline run my_pipeline
```

### Developing

Clone:

```sh
git clone https://github.com/turbot/flowpipe-mod-uptimerobot.git
cd flowpipe-mod-uptimerobot
```

List pipelines:

```sh
flowpipe pipeline list
```

Run a pipeline:

```sh
flowpipe pipeline run create_monitor --arg friendly_name="My New Monitor" --arg url="https://example.com" --arg type="1"
```

To use a specific `credential`, specify the `cred` pipeline argument:

```sh
flowpipe pipeline run create_monitor --arg cred=uptimerobot_profile --arg friendly_name="My New Monitor" --arg url="https://example.com" --arg type="1"
```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Flowpipe](https://flowpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #flowpipe on Slack →](https://flowpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Flowpipe](https://github.com/turbot/flowpipe/labels/help%20wanted)
- [UptimeRobot Mod](https://github.com/turbot/flowpipe-mod-uptimerobot/labels/help%20wanted)
