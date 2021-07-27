#!/bin/bash

# Note: Obsidian v0.8.15+ required
# Install via: 1) https://obsidian.md 2) brew install --cask obsidian

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Github: Tailscale — New Issue
# @raycast.mode silent

# Optional parameters:
# @raycast.icon images/github-logo.png
# @raycast.iconDark images/github-logo-iconDark.png
# @raycast.argument1 { "type": "text", "placeholder": "Repository", "optional": false, "percentEncoded": true}
# @raycast.packageName Github

# Documentation:
# @raycast.description Open an issue on one of Tailscale's GitHub repos
# @raycast.author Alessandro Mingione
# @raycast.authorURL https://github.com/sonovawolf

# The name of your vault, e.g., "Knowledge Base"
open https://github.com/tailscale/${1}/issues/new