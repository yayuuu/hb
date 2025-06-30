#!/bin/bash
install(){
  cp hstr "${binpath}hstr"
  chmod +x "${binpath}hstr"
  echo ""
  echo "Installation complete. Restart your bash session to activate alias (if selected)."
  echo "Use \"hstr [search_phrase]\" to search in history."
  echo "If you installed hstr locally, make sure \"~/.local/bin\" is in your PATH."
  echo "If not, add the following line at the end of your .bashrc:"
  echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
  exit
}

install_with_alias() {
  echo "alias hstr=\"history -a && hstr\"" >> "$aliasfile"
  install
}


echo "Do you want to install hstr globally?"
select opt in "Yes" "No"; do
  case $opt in
    "Yes")
      if [ "$(id -u)" -eq 0 ]; then
        echo ""
      else
        echo "Superuser is required to install globally"
        exit
      fi
      binpath="/usr/local/bin/"
      aliasfile="/etc/bash.bashrc"
      break
      ;;
    "No")
      binpath="$HOME/.local/bin/"
      aliasfile="$HOME/.bashrc"
      break
      ;;
    *)
      exit
      ;;
  esac
done


echo ""
echo "Do you want to install alias?"
echo "An alis is required to save current session's history before executing hstr."
select opt in "Yes" "No"; do
  case $opt in
    "Yes")  
      install_with_alias
      break 
      ;; 
    "No")
      install
      break  
      ;;
    *)    
      exit 
      ;;  
  esac  
done  

