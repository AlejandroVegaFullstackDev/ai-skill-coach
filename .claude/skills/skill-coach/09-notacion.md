# 09 — Representar, no describir

## El problema

El aprendiz **no puede detectar que entendió mal**. Por eso está aprendiendo: no sabe lo
suficiente para saber qué no sabe.

El agente explica en prosa, el aprendiz asiente, y los dos se van convencidos. Dos semanas después
resulta que llevaba el pulgar por encima del mástil desde el primer día, o conectó el cable en el
conector de al lado, o entendió que el `await` bloquea el hilo.

Describir algo espacial con palabras es donde esto pasa siempre:

> "Pones el dedo índice en el primer traste de la segunda cuerda, y el corazón y el anular en el
> segundo traste de la cuarta y la tercera."

Eso tiene cinco sitios donde perderse: ¿la segunda cuerda contando desde arriba o desde abajo?
¿Arriba es la más grave o la más aguda? ¿El primer traste es el espacio o la barra?

## La regla

**Si el dominio tiene una notación canónica, se usa. Siempre. No se describe en prosa.**

La notación no es decoración ni un extra bonito: es lo que hace que el malentendido sea imposible
en vez de improbable.

Y va **en la terminal**, en texto plano. Nada de enlazar a una imagen ni decir "búscalo en
Google": el aprendiz está aquí, y si tiene que salir a buscarlo, no lo mira.

---

## Formatos que funcionan en una terminal

### Diagrama posicional — guitarra, instrumentos de traste

```
       Em                    Am                    C
    E A D G B e           E A D G B e           E A D G B e
    0 . . 0 0 0           x 0 . . . 0           x . . 0 . 0
    +-+-+-+-+-+           +-+-+-+-+-+           +-+-+-+-+-+
 1  | | | | | |        1  | | | | O |        1  | | | | O |
    +-+-+-+-+-+           +-+-+-+-+-+           +-+-+-+-+-+
 2  | O O | | |        2  | | O O | |        2  | | O | | |
    +-+-+-+-+-+           +-+-+-+-+-+           +-+-+-+-+-+
 3  | | | | | |        3  | | | | | |        3  | O | | | |
    +-+-+-+-+-+           +-+-+-+-+-+           +-+-+-+-+-+
```

Leyenda, siempre incluida: `0` cuerda al aire · `x` cuerda que no suena · `O` dedo · columnas de
grave a aguda.

**ASCII puro, sin caracteres de dibujo Unicode.** Los `┌─┬` se desalinean en la mitad de las
terminales de Windows y un diagrama desalineado es peor que ninguno.

### Secuencia temporal — tablatura, ritmo, pasos

```
e|---------------|
B|---------------|
G|---------------|
D|--2--2--2--2---|
A|--2--2--2--2---|
E|--0--0--0--0---|
   1  &  2  &
```

### Conexiones y posiciones — montaje, electrónica, robótica

```
   PLACA BASE (vista desde arriba, ATX)
   +-------------------------------------+
   |  [CPU]          [RAM 1 2 3 4]       |
   |                                     |
   |  24-PIN ->  [::::::::::::]          |
   |                                     |
   |  [PCIe x16]                  SATA   |
   |                              [][][] |
   +-------------------------------------+
        ^
        conector de 24 pines: tiene un clip.
        Si no hace clic, no esta puesto.
```

Para pinouts, tabla antes que dibujo:

| Pin | Señal | Va a | Si lo inviertes |
|---|---|---|---|
| 1 | VCC | 5V | Quemas el sensor |
| 2 | GND | Tierra | No arranca |

La columna **"si lo inviertes"** es la que enseña. Una tabla de pines sin consecuencias es una
hoja de datos, no material de aprendizaje.

### Estructura — idiomas, sintaxis, argumentación

```
  [ I ] [ have been working ] [ here ] [ for 3 years ]
    |            |               |            |
  sujeto    pres. perf.        lugar      duracion
            continuo                      ("for" = cuanto)
                                          ("since" = desde cuando)
```

### Antes y después — cualquier dominio

El formato más informativo que existe, y el más barato:

```
  MAL                          BIEN
  pulgar por encima del    ->  pulgar detras del mastil,
  mastil, muneca recta         muneca ligeramente flexionada

  por que importa: con el pulgar arriba no llegas a la 6a cuerda
  y la cejilla se vuelve imposible tres meses despues
```

**"Por qué importa" no es opcional.** Sin esa línea es una regla arbitraria, y las reglas
arbitrarias no se siguen cuando cansan.

---

## El otro lado: que lo reproduzca él

Dibujarlo bien no basta. **Hay que comprobar que llegó**, y no se comprueba preguntando
*"¿entendido?"* — a eso todo el mundo dice que sí.

Se comprueba haciendo que lo produzca de vuelta, **antes** de que lo ejecute:

| En vez de | Pide |
|---|---|
| "¿Te queda claro el Do?" | "Dime qué dedo va en qué cuerda y en qué traste" |
| "¿Entiendes el pinout?" | "¿Qué pasa si conecto el pin 1 al 2?" |
| "¿Claro lo del present perfect?" | "Hazme una frase sobre tu trabajo con esa estructura" |
| "¿Entendiste la arquitectura?" | "¿Dónde meterías la validación y por qué ahí?" |

Cuesta treinta segundos y es donde aparecen los malentendidos, **antes** de que se conviertan en
tres semanas de práctica equivocada.

En habilidades físicas esto importa el doble, porque un mal hábito motor se automatiza y después
hay que desaprenderlo, que cuesta más que aprenderlo la primera vez.

---

## Cuando el dominio no tiene notación

Algunas cosas no tienen una forma canónica de dibujarse: negociación, liderazgo, escritura.

Entonces la representación es **el caso concreto y el contraste**. En vez de *"escucha
activamente"*:

```
  DIJO EL CLIENTE:  "Es que no estoy seguro del plazo."

  MAL:  "Tranquilo, lo cumplimos seguro."
        -> cerraste el tema. No sabes que le preocupa.

  BIEN: "¿Que parte del plazo te preocupa mas?"
        -> sigue hablando, y ahi esta la objecion real.
```

Sigue siendo mostrar en vez de describir. Lo que cambia es qué se muestra.

---

## Reglas

1. **Ninguna instrucción espacial en prosa** si hay notación para ella.
2. **ASCII puro.** Nada de caracteres de dibujo Unicode ni emojis en los diagramas.
3. **Leyenda siempre**, aunque parezca obvia. Lo obvio para quien sabe no lo es para quien aprende.
4. **Una notación por dominio**, la que use la gente que hace eso de verdad. No inventar una.
5. **Comprobar que llegó**, haciéndolo reproducir, no preguntando si entendió.
6. Si la notación no cabe en una terminal, **decir qué mirar y dónde**, y seguir dando la versión
   de texto. Nunca sustituir por "búscalo".
