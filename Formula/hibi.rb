class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.18.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.18.0/hibi-ai-1.18.0-macos.tar.gz"
    sha256 "f45f1b51fcf47f7a1713d4c72b134f4656dbf7e877815cc93d803a26aff1b16f"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.18.0/hibi-ai-1.18.0-linux.tar.gz"
    sha256 "29a21c0485be0f7dbe18c1e79be73f135946d4d7b85e8676a3cc18087ff0122b"
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
