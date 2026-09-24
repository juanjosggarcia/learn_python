from machine import Pin, I2C
import time
import ssd1306

# ESP32 Pin assignment 
i2c = I2C(0, scl=Pin(22), sda=Pin(21))

oled_width = 128
oled_height = 64
oled = ssd1306.SSD1306_I2C(oled_width, oled_height, i2c)

oled.text('Hello, Wokwi!', 10, 10)      
oled.show()



# LED en GPIO 2 (Pin en estado alto)
led = Pin(2, Pin.OUT)

# Botón en GPIO 4 con resistencia pull-up interna
boton = Pin(4, Pin.IN, Pin.PULL_UP)


while True:
    if boton.value() == 0:
        # Botón pulsado
        led.value(1)
        print("boton pulsado")
    else:
        # Botón sin pulsar
        led.value(0)

    time.sleep_ms(10)