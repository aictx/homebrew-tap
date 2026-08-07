class Memory < Formula
  desc "Local-first product graph for AI coding agents"
  homepage "https://memory.aictx.dev"
  url "https://registry.npmjs.org/@aictx/memory/-/memory-0.2.1.tgz"
  sha256 "e1fa3497b97997e72e8dfb121f41c1de382a4f9eeb5dd0a2328343a30fa1f0fb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args

    node_path = Formula["node"].opt_bin
    (bin/"memory").write_env_script libexec/"bin/memory", PATH: "#{node_path}:$PATH"
    (bin/"memory-mcp").write_env_script libexec/"bin/memory-mcp", PATH: "#{node_path}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memory --version")
    assert_match "Memory docs:", shell_output("#{bin}/memory docs")
  end
end
