cask "hanko" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.1.4"
  sha256 arm:   "55e2dff912754b9e4f8be5c83aa4ba7e45bb10a76f58094169a22797c4fa60fe",
         intel: "1db9174c6be53ea9871ba1e11d6b2a4d0eddeb742c11a428fd4bf050f38e793e"

  url "https://github.com/marvinvogt/hanko/releases/download/v#{version}/hanko-#{version}-#{arch}-apple-darwin.tar.gz"
  name "hanko"
  desc "Keeps your allowed signers file up to date"
  homepage "https://github.com/marvinvogt/hanko"

  depends_on :macos

  binary "hanko"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-r", "-d", "com.apple.quarantine", "{{staged_path}}/hanko"]
  end
end
