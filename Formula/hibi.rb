class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.12.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.12.0/hibi-ai-1.12.0-macos.tar.gz"
    sha256 "799a15f25a0bcc7949468cdba7624ab44928a4f957bf006582e34891b396bb73"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.12.0/hibi-ai-1.12.0-linux.tar.gz"
    sha256 "9188956c7f31f5b201a2e28bcf997b49f9783883f30de3f7e84537d902220ca5"
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
