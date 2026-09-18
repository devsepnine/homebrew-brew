class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.17.1"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.17.1/hibi-ai-1.17.1-macos.tar.gz"
    sha256 "f0515c66f26af220ce1b3047cb2f14b4b58566269c77d54a3cdb23c30d0668b0"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.17.1/hibi-ai-1.17.1-linux.tar.gz"
    sha256 "cf8095707912c9bfc9a443c9651000644588881026fc83b035012dc5e516758a"
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
