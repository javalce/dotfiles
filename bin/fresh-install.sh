#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
	echo "Please run as root"
	exit 1
fi

install_browsers() {
	# Install Google Chrome
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt-get install -y ./google-chrome-stable_current_amd64.deb

	# Install Brave Browser
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt-get update
	sudo apt-get install -y brave-browser
}

install_code() {
	curl -fsSL "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o vscode.deb
	sudo apt-get install -y ./vscode.deb
	rm vscode.deb
}

install_postman() {
	FILENAME=postman-linux-x64.tar.gz
	OPT="/opt/$FILENAME"
	OPT_BIN="/opt/Postman/Postman"
	BIN="/usr/bin/postman"
	DESKTOP_FILE="/usr/share/applications/postman.desktop"

	wget --content-disposition https://dl.pstmn.io/download/latest/linux
	sudo mv "$FILENAME" "$OPT"
	sudo tar -xzvf "$OPT"
	sudo rm "$OPT"
	sudo ln -s "$OPT_BIN" "$BIN"
	sudo tee "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=/opt/Postman/app/Postman %U
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOF

	unset FILENAME OPT OPT_BIN BIN DESKTOP_FILE
}

install_database_tools() {
	# Install sqlitebrowser
	sudo apt-get install -y sqlitebrowser

	# Install DBeaver
	wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
	sudo apt-get install -y ./dbeaver-ce_latest_amd64.deb
	rm dbeaver-ce_latest_amd64.deb
}

install_browsers
install_code
install_postman
install_database_tools
