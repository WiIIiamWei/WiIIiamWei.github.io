#!/bin/sh
set -eu

cd "$(dirname "$0")/.."
project=$(pwd)
temporary=$(mktemp -d)
trap 'rm -rf "$temporary"' EXIT HUP INT TERM
mkdir -p "$temporary/config/_default" "$temporary/layouts" assets/css
cp go.mod go.sum "$temporary/"
cp config/_default/module.toml "$temporary/config/_default/module.toml"
cat >> "$temporary/config/_default/module.toml" <<EOF

[[mounts]]
source = "$project/assets"
target = "assets"
EOF
cat > "$temporary/hugo.toml" <<'EOF'
disableKinds = ["section", "taxonomy", "term", "RSS", "sitemap", "robotsTXT", "404"]
EOF
cat > "$temporary/layouts/index.html" <<'EOF'
{{ $css := resources.Get "scss/style.scss" | toCSS | minify }}{{ $css.RelPermalink }}
EOF
# shortcut: regenerating legacy Stack CSS uses Hugo Extended's bundled LibSass; migrate when the theme drops it.
hugo --source "$temporary" --destination "$temporary/public" --noBuildLock
test -s "$temporary/public/scss/style.min.css"
cp "$temporary/public/scss/style.min.css" assets/css/style.css
