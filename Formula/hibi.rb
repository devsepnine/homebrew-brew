class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.20.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.20.0/hibi-ai-1.20.0-macos.tar.gz"
    sha256 "9140c600b436988bc3294efed54d2dca96317bbda3af85e2b5820aab4d5fc70e"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.20.0/hibi-ai-1.20.0-linux.tar.gz"
    sha256 "518b9f4881a6226c99a2492de8a12af9334fcdfa240c4093d7012be3c166054c"
  end

  def install
    bin.install "hibi"

    share_dir = share/"hibi"
    %w[agents commands contexts hooks mcps output-styles plugins rules skills statusline].each do |d|
      share_dir.install d if File.exist?(d)
    end
    share_dir.install "settings.json" if File.exist?("settings.json")
    share_dir.install "CLAUDE.md" if File.exist?("CLAUDE.md")
    share_dir.install "AGENTS.md" if File.exist?("AGENTS.md")
    share_dir.install "mcp.md" if File.exist?("mcp.md")
  end

  test do
    # Test that binary runs
    assert_match "hibi", shell_output("#{bin}/hibi --help")
  end
end
