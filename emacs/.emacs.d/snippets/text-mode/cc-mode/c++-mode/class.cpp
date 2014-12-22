#name : class init cpp
# --

${1:`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`}::${1:className}($2)
{
  ${3:init}
}

${1:className}::${1:className}(const ${1:className} &old)
{
  ${4:copy}
}

${1:className} &${1:className}::operator=(const ${1:className} &old)
{
  ${4:copy}
  return (*this);
}

${1:className}::~${1:className}()
{
  ${5:delete}
}
