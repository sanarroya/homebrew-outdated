class UticaAT0400 < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/Interfere/Utica"
  url "https://github.com/Interfere/Utica.git",
    tag:      "0.40.0-pre",
    revision: "1fc1fba5a4d34117b423d475f594ea433b8efd70",
    shallow:  false
  license "MIT"
  head "https://github.com/Interfere/Utica.git",
    branch:  "master",
    shallow: false
  bottle do
    root_url "https://github.com/Interfere/Utica/releases/download/0.40.0-pre"
    sha256 cellar: :any_skip_relocation, arm64_monterey:                          "dc44b4c000e306907996935e2c8a258b8bf2c85eaeb865c0938e880c1ec51a81"
    sha256 cellar: :any_skip_relocation, monterey:                                "8c113b2808abd09274f4ce21f880fa185dd054551e174e493fce2d94b495b1b4"
  end

  depends_on xcode: ["12.0", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}"
    bin.install ".build/release/utica"
    bash_completion.install "Source/Scripts/utica-bash-completion" => "utica"
    zsh_completion.install "Source/Scripts/utica-zsh-completion" => "_utica"
    fish_completion.install "Source/Scripts/utica-fish-completion" => "utica.fish"
  end

  test do
    (testpath/"Cartfile").write 'github "jspahrsummers/xcconfigs"'
    system bin/"utica", "update"
  end
end
