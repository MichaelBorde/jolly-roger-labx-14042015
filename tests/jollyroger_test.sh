setup() {
  EPISODES="$(mktemp -d /tmp/episodes.XXXX)"
  SOUSTITRES="$(mktemp -d /tmp/soustitres.XXXX)"
}

teardown() {
  rm -rf "${EPISODES}" "${SOUSTITRES}"
}

doit_copier_un_soustitre_qui_correspond_a_un_episode() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s01e01.srt"

  ./sources/jollyroger "${EPISODES}" "${SOUSTITRES}"

  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s01e01.srt"
}

ne_copie_pas_un_soustitre_qui_na_rien_a_voir() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s02e07.srt"

  ./sources/jollyroger "${EPISODES}" "${SOUSTITRES}"

  assertion__failing  _fichier_existe "${EPISODES}/ma.serie.s02e07.srt"
}

_fichier_existe() {
  [[ -f "$1" ]]
}
