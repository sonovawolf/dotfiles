#!/bin/bash

# Note: Obsidian v0.8.15+ required
# Install via: 1) https://obsidian.md 2) brew install --cask obsidian

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title New quote
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./images/obsidian.png
# @raycast.argument1 { "type": "text", "placeholder": "By", "optional": false, "percentEncoded": true}
# @raycast.argument2 { "type": "text", "placeholder": "Tags", "optional": true, "percentEncoded": true}
# @raycast.packageName Obsidian

# Documentation:
# @raycast.description Create a new quote
# @raycast.author Alessandro Mingione
# @raycast.authorURL https://github.com/sonovawolf

# The name of your vault, e.g., "Knowledge Base"
VAULT_NAME="Zetta"

if [ -z "$VAULT_NAME" ]
then
  echo "Configure VAULT_NAME"
  exit 1
fi

OG_CLIPBOARD=$(pbpaste)

CHROME_URL=$(osascript -e 'tell application "Google Chrome" to get URL of active tab of first window')

CHROME_URL_ENCODED=$(python -c "import urllib, sys; print urllib.quote(sys.argv[1])" "$CHROME_URL")

osascript -e 'tell application "Google Chrome" to get copy selection of active tab of window 1'

CHROME_SELECTION_ENCODED=$(python -c "import urllib, sys; print urllib.quote(sys.argv[1])" "$(pbpaste)")

open "obsidian://new?vault=$VAULT_NAME&file=Quotes%2F$CHROME_SELECTION_ENCODED&content=$CHROME_SELECTION_ENCODED%0A%0ABy:%20%5B%5B${1}%5D%5D%0ATags:%20${2}%0AFrom:%20$CHROME_URL_ENCODED"

echo "$OG_CLIPBOARD" | pbcopy

