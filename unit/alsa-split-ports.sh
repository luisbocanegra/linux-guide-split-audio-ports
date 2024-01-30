#!/usr/bin/env bash
CODEC="ALC295"
VENDOR_ID="0x10ec0295"
SUBSYSTEN_ID="0x103c8575"
HINTS="indep_hp = yes
vmaster = no
"

get_codec_hwdep() {
    local codec=$1
    local vendor_id=$2
    local subsystem_id=$3
    local addr=""
    [[ -z "$codec" || -z "$vendor_id" || -z "$subsystem_id" ]] && { echo "ERROR: Not enough arguments given"; return; }
    for file in /sys/class/sound/hw*; do
        if [[ -n "$addr" ]]; then
          echo "$addr"
          return
        fi
        if grep -q "$codec" "$file/chip_name" && grep -q "$vendor_id" "$file/vendor_id" && grep -q "$subsystem_id" "$file/subsystem_id"; then
            addr=$file
        fi
    done
    if [[ -z "$addr" ]]; then
      echo "ERROR: Could not get address for c:$codec v:$vendor_id s:$subsystem_id"
      return
    fi
}
# get_codec_hwdep "$CODEC" "$VENDOR_ID" "$SUBSYSTEN_ID"
hwdep="$(get_codec_hwdep "$CODEC" "$VENDOR_ID" "$SUBSYSTEN_ID")"

if [[ "$hwdep" == *"ERROR"* || -z "$hwdep" ]]; then
  exit 1
fi


while IFS=$'\n' read -r line; do
  if [[ -z "$line" ]]; then
      continue
  fi
  echo "$line > ${hwdep}/hints"
  echo "$line" > "${hwdep}"/hints
done <<< "$HINTS"

echo "echo 1 > ${hwdep}/reconfig"
echo 1 > "${hwdep}"/reconfig
