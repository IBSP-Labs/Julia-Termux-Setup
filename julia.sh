#!/data/data/com.termux/files/usr/bin/bash

clear
echo "------------------------------------------"
echo "     INSTALADOR AUTOMÁTICO JULIA v1.0     "
echo "------------------------------------------"

pkg update -y && pkg upgrade -y
pkg install wget tar clang libllvm libopenblas libgfortran -y

wget https://julialang-s3.julialang.org/bin/linux/aarch64/1.10/julia-1.10.2-linux-aarch64.tar.gz
tar -xvzf julia-1.10.2-linux-aarch64.tar.gz
mv julia-1.10.2 /data/data/com.termux/files/usr/julia

echo 'export PATH=$PATH:/data/data/com.termux/files/usr/julia/bin' >> ~/.bashrc
source ~/.bashrc

mkdir -p ~/.julia/config

cat > ~/.julia/config/startup.jl << 'EOF'
println("Julia inicializada no Termux com sucesso!")
println("Sistema configurado automaticamente.")

const usuario = "Usuário Android"
const projeto = "Estudos com Julia no Termux"

saudacao() = println("Bem-vindo(a), ", usuario, "! Projeto: ", projeto)
saudacao()

try
    using Pkg
catch e
    println("Erro ao iniciar Pkg: ", e)
end

quadrado(x) = x^2
dobro(x) = 2 * x

println("Funções carregadas: quadrado(x), dobro(x)")
EOF

cat > ~/exemplo.jl << 'EOF'
println("Executando exemplo.jl")
println("A soma de 5 + 3 é: ", 5 + 3)
println("O quadrado de 4 é: ", 4^2)
EOF

clear
echo "------------------------------------------"
echo "     JULIA INSTALADA COM SUCESSO!         "
echo "------------------------------------------"
echo "Use o comando: julia"
echo "Ou crie um atalho com: alias jl='julia'"
echo "Script de exemplo criado em: ~/exemplo.jl"
echo "Arquivo de config: ~/.julia/config/startup.jl"
