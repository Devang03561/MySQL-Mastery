# Installing MySQL (Windows / macOS / Linux)

## Windows
1. Download the MySQL Installer from [dev.mysql.com/downloads/installer](https://dev.mysql.com/downloads/installer/)
2. Choose `mysql-installer-community` (the larger web version is fine).
3. Run the installer and select **Developer Default**.
4. Follow the prompts, set a root password you'll remember.
5. Complete the installation. MySQL Workbench will be installed along with the server.

## macOS
1. Install Homebrew if not installed: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Run `brew install mysql`
3. Start the service: `brew services start mysql`
4. Secure the installation: `mysql_secure_installation`
5. Connect: `mysql -u root -p`

## Linux (Ubuntu/Debian)
1. Update packages: `sudo apt update`
2. Install MySQL: `sudo apt install mysql-server`
3. Run security script: `sudo mysql_secure_installation`
4. Start the service: `sudo systemctl start mysql`
5. Enable on boot: `sudo systemctl enable mysql`

## Verifying Installation
Open terminal/command prompt and type:

Enter the password you set during installation. You should see the `mysql>` prompt. Type `exit;` to quit.