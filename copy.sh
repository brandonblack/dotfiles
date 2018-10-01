# Copy to home folder
for file in .{zshrc,aliases,curlrc,exports,functions,gitconfig,gemrc,pryrc,tmux.conf}; do
  echo "Copying $file..."
  cp "$file" ~/
done
unset file

if [ ! -f ~/.work ]; then
  echo "Copying .work..."
  cp .work ~/
fi

echo "[DONE]\n"
