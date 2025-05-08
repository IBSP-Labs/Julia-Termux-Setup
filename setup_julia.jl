# Limpeza do terminal
run(`clear`)
println("===> Iniciando configuração automática do Julia...")

config_dir = joinpath(homedir(), ".julia", "config")
config_file = joinpath(config_dir, "startup.jl")

if !isdir(config_dir)
    println("Criando diretório: ", config_dir)
    mkpath(config_dir)
end

startup_code = """
println("Julia inicializada com sucesso no Termux!")
println("Sistema configurado com script gerador.")

const usuario = "Usuário Android"
const projeto = "Projeto Julia Automático"

saudacao() = println("Bem-vindo, ", usuario, "! Projeto atual: ", projeto)
saudacao()

quadrado(x) = x^2
dobro(x) = 2 * x

println("Funções carregadas: quadrado(x), dobro(x)")

try
    using Pkg
catch e
    println("Erro ao carregar gerenciador de pacotes: ", e)
end
"""

println("Criando arquivo: ", config_file)
open(config_file, "w") do f
    write(f, startup_code)
end

println("===> Configuração concluída com sucesso!")
println("Reinicie o Julia ou digite 'include(\"$(config_file)\")' para testar.")
