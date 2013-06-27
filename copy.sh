# Copy to home folder
for file in .{zshrc,aliases,exports,functions,gitconfig,gemrc,pryrc,railsrc,ruby-version,irbrc,jrubyrc,rvmrc}; do
  echo "Copying $file..."
  cp "$file" ~/
done
unset file
echo "Copying RVM Gemsets..."
cp rvm/*.gems ~/.rvm/gemsets
echo "[DONE]\n"
