class Hibi < Formula
  desc "TUI installer for Claude Code and Codex CLI configurations"
  homepage "https://github.com/devsepnine/hibi_ai"
  version "1.19.0"
  license "MIT"

  on_macos do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.19.0/hibi-ai-1.19.0-macos.tar.gz"
    sha256 "3a8e9fc4dc6a394470370d619fbb55b84c909c9d064ce8ab46d00541930b2733"
  end

  on_linux do
    url "https://github.com/devsepnine/hibi_ai/releases/download/v1.19.0/hibi-ai-1.19.0-linux.tar.gz"
    sha256 "0b88c3cae0038b836d96a4ddc2ec3f3324a0201e22c957ee9d9929eb7a476077"
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
