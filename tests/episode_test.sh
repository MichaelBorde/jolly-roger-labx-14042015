source "sources/episode.sh"

un_soustitre_correspond_sil_a_le_meme_nom_a_lextension_pres() {
  local episode="ma.serie.s01e01.avi"
  local soustitre="ma.serie.s01e01.srt"

  assertion__successful \
    episode__correspondent "${episode}" "${soustitre}"
}

un_soustitre_peut_correspondre_bien_quil_soit_dans_un_autre_repertoire() {
  local episode="epi/sode/ma.serie.s01e01.avi"
  local soustitre="sous/titre/ma.serie.s01e01.srt"

  assertion__successful \
    episode__correspondent "${episode}" "${soustitre}"
}

un_peut_ne_pas_correspondre() {
  local episode="ma.serie.s01e01.avi"
  local soustitre="ma.serie.s07e01.srt"

  assertion__failing \
    episode__correspondent "${episode}" "${soustitre}"
}

le_nom_final_dun_soustitre_est_lepisode_a_lextension_pres() {
  local episode="epi/sode/ma.serie.s01e01.avi"

  local nom_final="$(episode__soustitre_final "${episode}")"

  assertion__equal "epi/sode/ma.serie.s01e01.srt" "${nom_final}"
}
