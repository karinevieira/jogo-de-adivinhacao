def da_boas_vindas
	puts "Bem-vindo ao jogo de Adivinhação"
  puts "\n"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "Vamos começar o jogo para você, #{nome}"
  puts "\n"
end

def escolher_dificuldade
  puts "Escolha o nível de dificuldade (1-Fácil, 2-Médio, 3-Difícil):"
  dificuldade = gets.to_i
end

def sortear_numero_secreto(dificuldade)
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 50
  when 3
    maximo = 100
  end
  puts "Escolhendo um número entre 1 e #{maximo}..."
  sorteado = rand(maximo) + 1
  puts "Escolhido! Que tal tentar adivinhar agora?"
  puts "\n"
  sorteado 
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
  puts "\n"
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts "\n"
  puts "Seus chutes até agora foram: #{chutes}"
	puts "Insira um número"
	chute = gets.strip
  puts "Será que acertou? Você chutou #{chute}" 
	puts "\n"
  chute.to_i
end

def limite_de_tentativas(dificuldade)
  case dificuldade
	when 1
  	limite_de_tentativas = 7
	when 2
  	limite_de_tentativas = 5
	when 3
  	limite_de_tentativas = 3
	end
end

def verificar_se_acertou(numero_secreto, chute)
  acertou = numero_secreto == chute

	if acertou
  	puts "Você acertou o número secreto, parabéns!"
    return true
  end
	
  if numero_secreto > chute
  	puts "Seu chute foi menor que o número secreto"  
  else
    puts "Seu chute foi maior que o número secreto"
  end
  return false
    
  puts "\n"   
end

da_boas_vindas

dificuldade = escolher_dificuldade

def iniciar_jogo(dificuldade)
    numero_secreto = sortear_numero_secreto(dificuldade)

    limite_de_tentativas = limite_de_tentativas(dificuldade)

    chutes = []
    pontos_ate_agora = 1000
    for tentativa in 1..limite_de_tentativas
    
    chute = pede_um_numero chutes, tentativa, limite_de_tentativas
    chutes << chute

    if verificar_se_acertou numero_secreto, chute
        break
    end
    
    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    pontos_ate_agora -= pontos_a_perder  
    
    end

    puts "Você fez #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
    puts "Você deseja continuar o jogo?"
    quer_jogar = gets.strip
    quer_jogar.upcase == "N"
end

loop do 
   iniciar_jogo(dificuldade)
   if nao_quer_jogar?
    puts "Jogo finalizado"
    break
   end
end