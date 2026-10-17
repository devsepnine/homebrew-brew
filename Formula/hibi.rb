class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.23.1"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.1/hibi-ai-1.23.1-macos.tar.gz"
    sha256 "78f45cde7495f09cd89d65891642d23fdb899dedee0dd69eef3f4e2b36ea6007"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.23.1/hibi-ai-1.23.1-linux.tar.gz"
    sha256 "c649245fe831312600a2080e9b8b37e68ecddb86e6e3af8e5ccb1e1c25c63319"
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
