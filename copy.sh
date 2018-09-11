# Copy to home folder
for file in .{zshrc,aliases,curlrc,exports,functions,gitconfig,gemrc,pryrc,tmux.conf}; do
  echo "Copying $file..."
  cp "$file" ~/
done
unset file

echo "[DONE]\n"
