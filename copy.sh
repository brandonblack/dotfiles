# Copy to home folder
for file in .{zshrc,aliases,curlrc,exports,functions,gitconfig,gemrc,pryrc,irbrc,jrubyrc,rvmrc,tmux.conf}; do
  echo "Copying $file..."
  cp "$file" ~/
done
unset file

echo "Copying RVM Gemsets & Hooks..."
cp -R rvm/gemsets ~/.rvm

echo "[DONE]\n"
