episode__correspondent() {
  local nom_episode="${1##*/}"
  local nom_soustitre="${2##*/}"
  [[ "${nom_episode%.*}" == "${nom_soustitre%.*}" ]]
}

episode__soustitre_final() {
  echo "${1%.*}.srt"
}
