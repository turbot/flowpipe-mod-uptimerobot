mod "uptimerobot" {
  title         = "UptimeRobot"
  description   = "Run pipelines to supercharge your UptimeRobot workflows using Flowpipe."
  color         = "#3BD771"
  documentation = file("./README.md")
  icon          = "/images/mods/turbot/uptimerobot.svg"
  categories    = ["library", "monitoring"]

  opengraph {
    title       = "UptimeRobot Mod for Flowpipe"
    description = "Run pipelines to supercharge your UptimeRobot workflows using Flowpipe."
    image       = "/images/mods/turbot/uptimerobot-social-graphic.png"
  }

  require {
    flowpipe {
      min_version = "1.0.0"
    }
  }
}
