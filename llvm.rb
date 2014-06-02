require 'formula'

class Llvm < Formula
  homepage 'http://clang-omp.github.io/'
  head 'https://github.com/clang-omp/llvm.git'

  def install

    ENV['REQUIRES_RTTI'] = '1'

    args = [
      "--prefix=#{prefix}",
      "--enable-optimized",
    ]

    system "./configure", *args
    system 'make'
    system 'make', 'install'

  end

end
