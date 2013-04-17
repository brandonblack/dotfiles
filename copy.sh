# Copy to home folder
for file in .{zshrc,aliases,exports,functions,gitconfig,gemrc,pryrc,railsrc,ruby-version,irbrc,jrubyrc}; do
  cp "$file" ~/
done
unset file