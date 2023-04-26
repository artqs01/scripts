#!/bin/bash

REPO="PATH TO REPO"
PASS=""
BORG_PASSPHRASE="$PASS" borg create -v --stats --progress --compression lz4 \
        "$REPO::{hostname}-{now:%Y-%m-%d-%H-%M}" \
        "PATH TO DRIVE"
BORG_PASSPHRASE="$PASS" borg prune -v --list "$REPO" --prefix '{hostname}-' --keep-daily=7 --keep-weekly=4 --keep-monthly=4
BORG_PASSPHRASE="$PASS" borg compact "$REPO" --progress
read -p "Done. Press enter key to close..."
