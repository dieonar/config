#name : class for h
# --
class ${1:`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`}
{
public:
    ${1:$(yas/substr text "[^: ]*")}($2);
    ${1:$(yas/substr text "[^: ]*")}(const ${1:$(yas/substr text "[^: ]*")} &old);
    ${1:$(yas/substr text "[^: ]*")} &operator=(const ${1:$(yas/substr text "[^: ]*")} &old);
    virtual ~${1:$(yas/substr text "[^: ]*")}();
};
