require "formula"

class ClangOmp < Formula
  homepage ""
  head "https://github.com/clang-omp/llvm", :using => :git
  sha1 ""

  keg_only :provided_by_osx, "OS X provides a different version of llvm/clang."

  def install

    system "git", "clone", "https://github.com/clang-omp/compiler-rt",
           "projects/compiler-rt"
    system "git", "clone", "-b", "clang-omp",
           "https://github.com/clang-omp/clang", "tools/clang"

    system "./configure", "--enable-optimized",
                          "--prefix=#{prefix}"
    ENV['REQUIRES_RTTI'] = '1'
    system "make", "install"
  end

  test do
    system "true"
  end
end
