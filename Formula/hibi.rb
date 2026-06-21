class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.14.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.14.0/hibi-ai-1.14.0-macos.tar.gz"
    sha256 "b972df7e5291550671001a9e985a5bf177cd61e1f6a8cac1852def8afab68dcc"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.14.0/hibi-ai-1.14.0-linux.tar.gz"
    sha256 "ad8884c1df2a849f82a87d12a7b79a210718f2b19beb74c27ba2e97ea4456ac5"
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
