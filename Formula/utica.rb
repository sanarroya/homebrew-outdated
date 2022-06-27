class Utica < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/Interfere/Utica"
  url "https://github.com/Interfere/Utica.git",
      tag:      "0.40.1",
      revision: "1fc1fba5a4d34117b423d475f594ea433b8efd70",
      shallow:  false
  license "MIT"
  head "https://github.com/Interfere/Utica.git", shallow: false

  bottle do
    root_url "https://github.com/Interfere/Utica/releases/download/0.40.1"
    sha256 cellar: :any_skip_relocation, arm64_monterey:                          "54d91a0b7c4e8006baa28f26780465e199c5e5afca3111eb24f7078f03dbcf3a"
    sha256 cellar: :any_skip_relocation, monterrey:                               "6ab9e7afd303018454de648cabe35c8c3bb184b0f6d415abcb2372ac8445b154"
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
