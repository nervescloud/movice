# Movice

Simple app that poses as a device locally to experiment connecting to your NervesHub installation.

## Usage

You will need to log into your NervesHub platform and create a set of Product Shared Secret credentials.

Update `config/config.exs` with the key and secret, and set the `device_api_host` to the endpoint your mock device should connect to.

Now you should be able to start an IEx session and connect to your choosen NervesHub installation.

```bash
$ iex -S mix
```
