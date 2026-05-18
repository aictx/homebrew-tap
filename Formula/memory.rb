class Memory < Formula
  desc "Local-first project memory for AI coding agents"
  homepage "https://memory.aictx.dev"
  url "https://registry.npmjs.org/@aictx/memory/-/memory-0.1.50.tgz"
  sha256 "8323879c41b4b9a7dc05f2365e52d131624aee31cd5b56b9aabd9a52607f4911"
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
