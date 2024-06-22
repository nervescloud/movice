import Config

# Enable the Nerves integration with Mix
Application.start(:nerves_bootstrap)

config :poser,
  target: Mix.target()

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"

config :nerves, source_date_epoch: "1613680624"

# use Environment var env instead of Mix.env
env =
  cond do
    System.get_env("PROD") ->
      :prod

    System.get_env("STAGING") ->
      :staging

    true ->
      :dev
  end

import_config "#{env}.exs"

if Mix.target() == :host or Mix.target() == :"" do
  import_config "host.exs"
else
  import_config "target.exs"
end

# config :nerves_hub_cli,
#   uri: "https://manage.nervescloud.com",
#   org: "your-user-name"

config :nerves_hub_link,
  remote_iex: true,
  device_api_host: "devices.nervescloud.com",
  shared_secret: [
    product_key: "your-project-key",
    product_secret: "your-product-secret",
    identifier: "a-unique-id"
  ]
