import speech_recognition as sr
import webbrowser
import winsound
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
            frase = frase.lower()

            if "navegador" in frase:
                webbrowser.open("https://www.google.com")
                return False
            elif "youtube" in frase:
                webbrowser.open("https://www.youtube.com")                
                return False
            elif "tocar música 1" in frase:
                webbrowser.open("https://www.youtube.com/watch?v=fSHoePrnmMw")
                return False
            elif "Parar" in frase:
                winsound.Beep(440, 1000)
                print("Saindo...")
                return True

        except sr.UnknownValueError:
            print("Fala não reconhecida")
            winsound.Beep(440, 1000)


while True:
    if ouvir_microfone():
        break
