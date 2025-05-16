# For of mcp-openapi-proxy

## Build/Publish Instructions

### Getting uv

This project uses uv/uvx for build, packaging, and publication. You should install `uv` widely. Some options for doing this are:
 - pipx install uv
 - Download a prebuilt binary from [https://github.com/astral-sh/uv/releases](https://github.com/astral-sh/uv/releases) and add it to your PATH
- brew install uv  # mac only

### Project Setup

Virtual environments are good. uv makes them easy:
```bash
uv venv
source .venv/bin/activate
```

Don't forget to make vscode or cursor aware of your python env. Generally, select .venv .

uv replaces requirements.txt files with:
```bash
uv pip install .[dev]
```
This installs the required dependencies (just . would do it) and the "dev" optional dependencies. These are defined in the pyproject.toml file. It also creates project scripts.

### Running the program

You can run the raw source code or you can run the executable installed to venv. These are different!

To run the raw live source code, you can:
 - python -c 'from mcp_openapi_proxy import main; main()'
 - python run.py # this can be used for debugging as well

You can install the latest live source code to venv via:
```bash
 uv pip install .
```
This will install any new dependencies and it will install the project scripts. This allows you to run the program in the same easy, uniform way:
```bash
mcp-openapi-proxy
```
The above requires that your venv is active and mcp-openapi-proxy been install. The following removes those assumptions, but will install mcp-openapi-proxy from pypi.org if it isn't in the environment.
```bash
uvx mcp-openapi-proxy
```


### Publishing to devpi on azdev5

You will need ssh forwarding to talk to devpi on azdev5. Then select the devpi index and login:

```bash
ssh -L 3141:localhost:3141 azdev5 -N -f    # ssh to azdev5, forwarding only
devpi use http://localhost:3141/root/fyrdraft
devpi login root --password=$(op item get "devpi Password" --field password --reveal)
```

The three lines above can be run in a unit via:
```bash
source devpi.sh
```

You can build and publish with:
```bash
uv build
devpi upload
```
