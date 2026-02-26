import speech_recognition as sr
import os

#Função para ouvir e reconhecer a fala de um usuário
def ouvir_microfone():

    #Habilitando o microfone do usuário
    microfone = sr.Recognizer()

    with sr.Microphone() as source:

        #Chama um algoritmo para reduzir os ruídos de som
        microfone.adjust_for_ambient_noise(source)

        print("Diga alguma coisa:")

        #Armazenando o que foi dito em uma variável
        audio = microfone.listen(source)

        try:
            #Passa a variável para o algoritmo reconhecer o padrão
            frase = microfone.recognize_google(audio, language="pt-BR")

            if "navegador" in frase:
                os.system("start Chrome.exe")
                return False
            elif "youtube" in frase:
                os.system("start Youtube.exe")
                return False
            elif "PowerPoint" in frase:
                os.system("start POWERPNT.exe")
                return False
            elif "Edge" in frase:
                os.system("start msedge.exe")
                return False
            elif "Fechar" in frase:
                os.system("exit")
                return True

        except sr.UnknownValueError:
            print("Fala não reconhecida")


while True:
    if ouvir_microfone():
        break