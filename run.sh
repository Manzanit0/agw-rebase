if [ ! -f $HOME/bin/bundle ]; then
    gem install bundler --no-document
fi

echo "Installing Tictactoe dependencias via Bundler..."
bundle install --quiet

echo "Executing app..."
ruby lib/application.rb