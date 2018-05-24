# CHESS TIMER
Proyecto de Electrónica Digital I / 2018-01

## Integrantes
- Christian Camilo Cuestas Ibáñez 

Este preinforme presenta los requerimientos básicos, y las mejoras planteadas para diseñar un Reloj de ajedrez, con el cual el usuario podrá establecer tiempos de partidas desde 1 minuto hasta 60 minutos. 

El reloj de ajedrez que se diseña está basado en programación de descripción de hardware (HDL) sobre FPGA. Por tanto, en este preinforme también se presentan los diagramas estructurales planteados inicialmente. Estos se usarán para la implementación de los módulos a implementar en verilog.

## Objetivo
- Poner en práctica todas las habilidades adquiridas durante el curso de Electrónica Digital I, tanto en el ámbito teórico como a nivel práctico.

## Materiales y herramientas

- 1 FPGA Nexys 4.
- 1 pantalla LCD Alfanumérica de 2x16 caracteres, de 3,3V.
- 1 protoboard.
- 1 interruptor de balancín.
- 4 pulsadores.
- Jumpers.
- 1 potenciómetro 5k.
- 1 resistencia de 330 ohmios.

## Definición del proyecto
Un reloj de ajedrez que permita programar el tiempo de partida de cada participante y que cumpla con los siguientes requerimientos:

### Requerimientos mínimos:

- Tiempos de partida de 5min, 10min, 15min, 20min y 30min.
- Ambos jugadores deben tener el mismo tiempo de partida inicial.
- Cada tiempo de partida se debe contabilizar con un temporizador de cuenta regresiva.
- La visualización de los tiempos debe ser a través de una pantalla LCD.

### Mejoras a los requerimientos:

- El tiempo de partida puede ser establecido por el usuario, y puede estar entre 1min y 60min. 
- La cantidad de pulsadores se restringen a 4:

	1. Inicio/Parada: Inicia la cuenta regresiva.
	2. Reset: Restablece los valores de tiempos de partida puestos por defecto.
	3. Set: Mientras el botón está accionado se permite modificar el tiempo de partida.
	4. Min: Modifica los minutos del tiempo de partida aumentando en 1 cada vez que sea pulsador.
  
- Tiene un interruptor de balancín, con el que se determina qué temporizador está activado.
