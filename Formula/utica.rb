class Utica < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/Interfere/Utica"
  url "https://github.com/Interfere/Utica.git",
      tag:      "0.40.1",
      revision: "a39075121928d8ad3ecce6fe0d7c895ac361cd1b",
      shallow:  false
  license "MIT"
  head "https://github.com/Interfere/Utica.git",
      branch:  "master",
      shallow: false

  bottle do
    root_url "https://github.com/Interfere/Utica/releases/download/0.40.1"
    sha256 cellar: :any_skip_relocation, arm64_monterey:                          "2fd2d283c5a2391c5ef0af48924d6aa33222bfebd4b43d3c215104e105840015"
    sha256 cellar: :any_skip_relocation, monterey:                                "8126368010df2dfcc31411330319a6d1a46019000f326fbb538e779a32e55acd"
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
