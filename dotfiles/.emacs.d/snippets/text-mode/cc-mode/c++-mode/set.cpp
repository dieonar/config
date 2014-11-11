#name : set for cpp
# --
void ${1:`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`}::set${2:what}(${3:type} const &${4:val})
{
  this->_${4:val} = ${4:val};
}

${3:type} ${1:class}::get${2:what}(void) const
{
  return (this->_${4:val});
}

$0
