#!/usr/bin/env bash
version="${1:?}" && \
target_folder="${HOME}/.x98/runtime/pandoc-${version}" && \
if [ ! -f "${target_folder}/bin/pandoc" ]; then
  echo "pandoc ${version} is installing ..." && \
  tmpdir="${HOME}/.x98/tmp/download-$(openssl rand -hex 32)" && \
  case $(uname -s)-$(uname -m) in
    Linux-amd64  | Linux-x86_64)
      curl -fL "https://github.com/jgm/pandoc/releases/download/${version}/pandoc-${version}-linux-amd64.tar.gz" --create-dirs -o "${tmpdir}/pandoc-${version}-linux-amd64.tar.gz" && \
      (
        cd "${tmpdir}" && \
        tar -zxf "pandoc-${version}-linux-amd64.tar.gz"
      )
      ;;
    Linux-arm64  | Linux-aarch64)
      curl -fL "https://github.com/jgm/pandoc/releases/download/${version}/pandoc-${version}-linux-arm64.tar.gz" --create-dirs -o "${tmpdir}/pandoc-${version}-linux-arm64.tar.gz" && \
      (
        cd "${tmpdir}" && \
        tar -zxf "pandoc-${version}-linux-arm64.tar.gz"
      )
      ;;
    Darwin-amd64 | Darwin-x86_64)
      curl -fL "https://github.com/jgm/pandoc/releases/download/${version}/pandoc-${version}-x86_64-macOS.zip" --create-dirs -o "${tmpdir}/pandoc-${version}-x86_64-macOS.zip" && \
      (
        cd "${tmpdir}" && \
        unzip -q "pandoc-${version}-x86_64-macOS.zip" && \
        mv pandoc-3.1.9-x86_64 pandoc-3.1.9
      )
      ;;
    Darwin-arm64 | Darwin-aarch64)
      curl -fL "https://github.com/jgm/pandoc/releases/download/${version}/pandoc-${version}-arm64-macOS.zip" --create-dirs -o "${tmpdir}/pandoc-${version}-arm64-macOS.zip" && \
      (
        cd "${tmpdir}" && \
        unzip -q "pandoc-${version}-arm64-macOS.zip" && \
        mv pandoc-3.1.9-arm64 pandoc-3.1.9
      )
      ;;
    *) echo "[ERROR] unsupported platform: $(uname -s)-$(uname -m)"; return 0 ;;
  esac && \
  rm    -rf                                "${target_folder:?}/" && \
  mkdir -p                                 "${target_folder:?}/" && \
  rsync -az "${tmpdir}/pandoc-${version}/" "${target_folder:?}/" && \
  # clean
  rm -rf "${tmpdir}"
fi && \
export PATH="${target_folder}/bin:${PATH}"