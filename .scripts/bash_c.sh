sudo rm -rf ~/.scripts

sudo apt autoremove

# Fonts
cd ~/downloads
mkdir ComicMono IosevkaTerm JetBrainsMono
wget https://dtinth.github.io/comic-mono-font/ComicMono.ttf #ComicMono
wget https://dtinth.github.io/comic-mono-font/ComicMono-Bold.ttf #ComicMono-Bold
mv ComicMono.ttf ComicMono-Bold.ttf ~/.downloads/ComicMono/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IosevkaTerm.zip #IosevkaTerm
mv IosevkaTerm.zip ~/downlaods/IosevkaTerm/
cd ~/downlaods/IosevkaTerm/
unzip IosevkaTerm.zip
rm IosevkaTerm.zip
cd ~/downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip #JetBrainsMono
mv JetBrainsMono.zip ~/downloads/JetBrainsMono/
cd ~/downloads/JetBrainsMono/
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
cd ~/downloads
mv ComicMono IosevkaTerm JetBrainsMono /usr/share/fonts/
cd

