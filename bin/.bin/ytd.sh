#!/usr/bin/bash

ytd() {
	youtube-dl $1 --no-check-certificate -f best -x -k --audio-format mp3
}
