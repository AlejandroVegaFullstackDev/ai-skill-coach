---
name: guitarra-coach
description: >
  Paquete de dominio: guitarra acustica de acero, autodidacta, orientado a tocar canciones
  completas y reconocibles de rock / grunge / nu metal. Aporta el mapa del salto real (velocidad
  de cambio de acorde, no repertorio de acordes), los errores tipicos del autodidacta que aprende
  formas sueltas, el protocolo de la cancion completa a tempo, y el aviso de verificacion fisica.
  Se activa con: guitarra, acorde, rasgueo, cejilla, power chord, tablatura, afinar, tocar
allowed-tools: Read, Write, Edit, Glob, Grep, WebFetch, WebSearch
---

# Guitarra — paquete de dominio

Este fichero no es el motor. El motor es `skill-coach`.

Perfil de partida para el que esta escrito: **autodidacta con guitarra acustica de acero, que
conoce algunas formas de acordes abiertos y nunca ha llegado a tocar una cancion entera.** Si el
aprendiz viene de otro sitio (conservatorio, otro instrumento de cuerda, electrica con ampli), la
tabla de errores cambia y hay que revisarla.

---

## El objetivo del dominio

**Tocar canciones concretas de principio a fin y que suenen reconocibles**, solo o cantando
encima.

Lo que eso sube de prioridad:

- Velocidad de cambio entre los acordes que salen en **esas** canciones.
- Ritmo estable y continuo: la mano derecha no se para aunque la izquierda llegue tarde.
- Power chords con palm mute, porque el repertorio declarado (grunge, hard rock, nu metal) es
  mayoritariamente eso.
- Una cancion cerrada, entera, antes que tres a medias.

Lo que eso baja de prioridad, y se dice cuando el aprendiz lo pida:

- Teoria musical mas alla de lo que explique la cancion que esta tocando.
- Escalas y solos. No aparecen en el objetivo declarado.
- Lectura de partitura. La tablatura cubre el objetivo entero.
- Ampliar el repertorio de acordes. Ya tiene mas acordes de los que sabe usar a tiempo.

---

## El salto real

| El temario dice | El salto real es |
|---|---|
| Aprende mas acordes | Cambiar entre los que ya sabes **sin parar la musica** |
| Patrones de rasgueo | Que la mano derecha no se detenga nunca, aunque falle la izquierda |
| Practica todos los dias | Sobrevivir a los primeros 90 dias con los dedos intactos |

El cuello de botella de un principiante casi nunca es el numero de acordes. Es la **transicion**:
sabe colocar Do y Sol, y tarda cinco segundos en pasar de uno a otro, lo que destruye cualquier
cancion. Fuente: [Montzari, por que abandonan los principiantes](https://www.montzari.com/blogs/news/why-beginners-quit-guitar-and-how-to-beat-the-odds-in-2026)
y el diseno del curso de JustinGuitar, que mide exactamente esa transicion.

Los tres muros documentados, en orden de aparicion:

1. **Dolor de dedos (semanas 1-4).** Cuerdas de acero contra trastes metalicos. El patron de
   abandono tipico: una hora seguida el primer dia, ampollas, una semana parado, no se vuelve.
2. **La velocidad de cambio (semanas 2-12).** Las formas ya estan; el tiempo entre ellas no baja
   solo escuchando explicaciones. Baja con repeticion cronometrada.
3. **El Fa con cejilla.** Despues de Sol, Do y Re, exige fuerza que aun no existe. Es el punto
   donde mas gente para. **En el repertorio declarado se puede posponer**: grunge y nu metal se
   tocan con power chords de dos o tres cuerdas, que dan el mismo sonido sin barrar seis.

### Metrica objetiva del salto 2

El ejercicio de **one-minute changes**: cronometro a un minuto, contar cuantas veces se pasa
limpio entre dos acordes concretos.

| Cambios/min | Que significa |
|---|---|
| < 20 | No hay cancion posible a ese par de acordes |
| 20-29 | Se puede ensayar la cancion a medio tempo; a tempo real todavia rompe |
| 30-59 | Umbral para usar ese par en una cancion lenta |
| 60+ | Un cambio por segundo: ese par ya no te limita |

La tabla es orientativa: lo que decide es **la demanda del pasaje**. A 60 BPM en 4/4 con un
cambio cada dos compases bastan 7,5 cambios/min; a 120 BPM con un cambio por compas hacen falta
30. Calcular la demanda de la cancion real antes de declarar un par "listo" o "imposible".

Solo cuentan cambios **limpios**: todas las cuerdas del acorde suenan. Si el aprendiz no sabe si
sonaron, se cuenta igual pero se anota como "sin verificar" en la evidencia.

Fuente: [JustinGuitar, One Minute Changes](https://www.justinguitar.com/guitar-lessons/one-minute-changes-exercise-b1-110).
Sirve como evidencia numerica para `/assess` y para el tracker: es de las pocas cosas de este
dominio que el aprendiz **si** puede medir solo y sin discusion.

---

## Errores tipicos desde autodidacta con formas sueltas

| Error | Correcto | Nota |
|---|---|---|
| Apretar la cuerda con toda la fuerza | Presion minima: la justa para que no zumbe | Causa principal de fatiga y de cambios lentos. Se corrige buscando el punto en que empieza a zumbar y subiendo un poco |
| Dedo encima del traste, o a mitad del espacio | La yema **justo detras** del traste | Produce el zumbido que el autodidacta atribuye a la guitarra |
| Pulgar asomando por encima del mastil | Pulgar detras del mastil, mas o menos frente al dedo 2 | Con el pulgar arriba no hay cejilla posible nunca |
| Levantar los cuatro dedos a la vez en cada cambio | Buscar el **dedo pivote** que no se mueve entre los dos acordes; si no hay, mover la forma **en bloque** | C a Am: indice y corazon no se mueven. Am a E: no hay pivote, pero es la misma forma una cuerda mas arriba y se mueve entera. Es lo que baja el tiempo de cambio de golpe |
| Parar la mano derecha para colocar el acorde | La mano derecha **no para**: entra el acorde a medio colocar | Una cancion con un acorde sucio suena a cancion. Una cancion que se para, no |
| Colocar el acorde dedo a dedo, mirandolos | Colocar la forma entera de una vez, y sin mirar | Mirar la mano izquierda hace imposible el tempo |
| Practicar una hora el primer dia | 10-20 min y parar cuando duele | Los callos se hacen con frecuencia, no con duracion |
| Empezar cada sesion por el principio de la cancion | Atacar el compas concreto que falla, aislado | Tipico de quien acumula meses de ejercicios sin cerrar una cancion |
| Cambiar de cancion cuando se atasca | Cerrar una, aunque sea a medio tempo | Diez canciones al 30% no suman una al 100% |

Los tres ultimos dependen del historial de intentos previos y **no son universales**: valen como
hipotesis para quien abandono antes sin llegar a tocar nada, y se confirman o se caen en las
primeras sesiones.

### Especifico del repertorio declarado (grunge / hard rock / nu metal)

| Error | Correcto |
|---|---|
| Power chord con las seis cuerdas sonando | Solo las 2-3 cuerdas del acorde; el canto de la mano derecha apaga el resto |
| Palm mute que apaga la nota del todo | El palmo **apoya**, no aplasta: la nota se sigue oyendo, mas corta y apretada |
| Alternar arriba-abajo en riffs que van todo abajo | Muchos riffs son downpicking puro; es lo que da el ataque |

---

## Condiciones de practica

**Equipo:** guitarra acustica de acero, pua media, afinador (app de movil sirve) y
**cronometro** — el cronometro es el instrumento de medida de este dominio. Un metronomo (app)
para todo lo de tempo. Coste cero mas alla de la guitarra.

**Ruido:** una acustica de acero se oye. Si el hueco es a horas o en sitio donde no se puede
hacer ruido, la ruta silenciosa existe pero es parcial: colocar formas y cronometrar cambios
**sin rasguear** entrena la mano izquierda entera. Lo que no se entrena asi es ritmo ni
coordinacion entre manos. Decirlo cuando se proponga.

**Coste fijo de montaje:** bajo pero no nulo. Coger la guitarra, afinar: 1-2 minutos. Con la
guitarra fuera del estuche y a la vista, cero. **Recomendacion operativa: que viva en un soporte,
no en el armario.** Es la intervencion mas eficaz sobre la frecuencia de practica.

**Sesion de 5 minutos:** si, entera. One-minute changes de dos pares de acordes cabe en 3 minutos
y es trabajo real y medible.

**Limite fisico:** los primeros 90 dias mandan sobre el plan. Nunca proponer sesiones largas antes
de que haya callos. **Si el aprendiz reporta dolor agudo, o dolor de muneca o de pulgar, la
respuesta es parar** — el dolor articular no es callo y no se entrena.

### Como se verifica el resultado — leer antes de cada sesion

**El agente no puede ver ni oir tocar.** En este dominio eso es una limitacion grave y no se
disimula:

| Se puede verificar con el agente (por autoinforme del aprendiz) | No se puede |
|---|---|
| Cambios por minuto (lo cuenta y lo dice el aprendiz) | Si la postura de la mano es correcta |
| Si la cancion sale entera y a tempo con la grabacion original | Si el sonido esta limpio o zumba |
| Si el acorde suena (el aprendiz lo oye) | Si la tecnica escala o va a topar en seis meses |
| Que compas concreto falla | Si hay tension que va a acabar en lesion |

Lo que si se puede hacer, y hay que ofrecerlo: **que se grabe con el movil y describa lo que oye**,
o mejor, que lo revise una persona que toque. Una clase presencial suelta cada varias semanas
resuelve justo lo que el agente no alcanza. Decirlo sin rodeos: practica confiada y equivocada en
un instrumento produce vicios que cuestan meses de quitar.

Las grabaciones se quedan en local y fuera del arbol versionado (regla de `CLAUDE.md`).

---

## El formato de mayor valor

**La cancion completa a tempo, sin parar.**

Protocolo:

1. Una cancion del repertorio real del aprendiz, no de manual.
2. Se toca **con la grabacion original sonando**, de principio a fin.
3. **No se para por un fallo.** Se anota mentalmente y se sigue. Pararse es el habito que hay que
   romper, porque es lo que impide tocar con otros o delante de alguien.
4. Al terminar: que compas concreto fallo, que acorde llego tarde, y donde se perdio el tempo.
5. La sesion siguiente ataca **ese** compas aislado, no la cancion entera.

Duracion: 3-5 minutos por pasada. Cabe en cualquier hueco.

Se cierra nombrando los errores concretos con su correccion, los tres si son tres. "Ha sonado
bien" no es un cierre.

---

## Escala externa

**No hay ninguna estandar y ampliamente reconocida para lo que este aprendiz quiere.** Existen los
gradings de Trinity Rock & Pop y RSL/Rockschool (grados 1-8), que si son reconocidos, pero miden
un repertorio de examen y lectura, no "tocar las canciones que me gustan". Mapearlos a este
objetivo seria forzarlo.

En su lugar, evidencia directa, que informa mas que un numero:

| Nivel | Evidencia que lo sostiene |
|---|---|
| L0 | No afina, no coloca acordes |
| L1 | Coloca formas de acordes abiertos; suenan con zumbidos; cambios > 5 s |
| L2 | 30 cambios/min en al menos un par; rasgueo basico sostenido |
| L3 | Una cancion entera a tempo con la grabacion, sin parar |
| L4 | Varias canciones; power chords con palm mute; aguanta tempo sin metronomo |
| L5 | Saca canciones nuevas solo, de oido o de tab, sin ayuda |

La autopercepcion inicial de cada aprendiz vive en su perfil, no aqui, y **no es una medicion**.
El nivel lo fija `/assess` con evidencia.

---

## Notacion

Las tres notaciones que usa la gente que toca, en ASCII puro (`09-notacion.md`). **Ninguna
posicion de dedos se describe en prosa.**

**Nombres de acordes:** cifrado americano, que es el que traen todas las tabs de la web.
`C`=Do · `D`=Re · `E`=Mi · `F`=Fa · `G`=Sol · `A`=La · `B`=Si · `m`=menor · `5`=power chord.
La primera vez que salga un acorde en una sesion, dar los dos nombres.

### Diagrama de acorde

```
       G                     E5 (power chord)
    E A D G B e           E A D G B e
    . . 0 0 0 .           0 . . x x x
    +-+-+-+-+-+           +-+-+-+-+-+
 1  | | | | | |        1  | | | | | |
    +-+-+-+-+-+           +-+-+-+-+-+
 2  | O | | | |        2  | O O | | |
    +-+-+-+-+-+           +-+-+-+-+-+
 3  O | | | | O        3  | | | | | |
    +-+-+-+-+-+           +-+-+-+-+-+
```

Leyenda: `0` cuerda al aire · `x` cuerda que no suena (se apaga, no basta con no tocarla) ·
`O` dedo · `.` cuerda pisada mas abajo · columnas de grave (6a, `E`) a aguda (1a, `e`) · filas =
trastes.

### Tablatura, con palm mute

```
   PM - - - - - - - |     PM - - - |
e|-------------------|-------------|
B|-------------------|-------------|
G|-------------------|-------------|
D|--2--2--2--2-------|--5--5--5----|
A|--2--2--2--2-------|--5--5--5----|
E|--0--0--0--0-------|--3--3--3----|
    1  &  2  &          3  &  4
    v  v  v  v          v  v  v
```

Leyenda: cada linea es una cuerda, la de abajo la mas grave · el numero es el traste (`0` al
aire) · `PM - -|` palm mute mientras dura la linea · `v` pua hacia abajo, `^` hacia arriba.

### Patron de rasgueo

```
    1   &   2   &   3   &   4   &
    D       D   U       U   D   U
```

Leyenda: `D` abajo, `U` arriba, hueco = la mano **pasa igual** sin tocar las cuerdas. La mano
derecha no para nunca; los huecos son golpes al aire, no pausas.

### Comprobar que llego

Antes de tocar un acorde o un riff nuevo, el aprendiz lo reproduce: *"dime el traste de cada
cuerda, de la 6a a la 1a, y cuales no suenan"* (el diagrama marca posicion, no que dedo;
si la digitacion importa, se da aparte), o *"que cuerdas no suenan en el E5"*. No *"¿lo tienes?"*.

---

## Kit de verificacion

| Nivel | Que | Estado |
|---|---|---|
| 0 | Reproducir el diagrama o la tab antes de tocarlo | activo |
| 1 | Foto de la mano izquierda por acorde nuevo: pulgar, yemas detras del traste, muneca | activo |
| 2 | Video del cambio de acorde, por fotogramas (`10-kit-de-verificacion.md`) | activo, cuando un cambio no baja de tiempo |
| 3 | Cambios por minuto con cronometro, contados por el aprendiz | activo |
| 3 | Contador automatico de cambios/onsets (Essentia.js, local) | no propuesto: el cronometro ya lo cubre |

**No verificable:** zumbido y limpieza del sonido, tension muscular, si la tecnica escala. Hace
falta un oido: grabarse con el movil y escucharlo despues, o una clase presencial suelta cada
varias semanas. Las fotos y videos van a `private/<perfil>/capturas/`, nunca al arbol versionado.

---

## Contenido de practica

Sale de `private/<perfil>/profile.md`, de las canciones que el aprendiz declara escuchar. **Nunca
de una lista generica de canciones para principiantes.**

Criterio de seleccion, en este orden:

1. Que este en su lista real de escucha.
2. Que use acordes o power chords que ya tiene, o uno nuevo como mucho.
3. Que sea reconocible desde la primera pasada, aunque sea a medio tempo.

Si una cancion que pide esta claramente fuera de alcance, **decirlo y decir que falta**, no
sustituirla en silencio por otra mas facil.

---

## Huecos de este paquete

- **No verificado con fuente:** si posponer la cejilla en favor de power chords retrasa el
  problema mas de lo deseable a medio plazo. Razonable para el objetivo declarado, no confirmado.
- **Marcados como hipotesis:** los tres errores derivados del historial de abandono. Salen del
  razonamiento sobre el perfil de partida, no de una fuente. Se confirman o se caen con el uso.
- **Sin investigar:** ergonomia y prevencion de lesiones mas alla de "si duele la articulacion,
  parar". Si el aprendiz reporta dolor recurrente, eso es materia de fisioterapeuta, no del
  agente.
- **Sin fuente propia:** la tabla de errores tipicos se apoya en material general de ensenanza de
  guitarra, no en fichas destiladas en `knowledge/guitarra/`. Correr `/harvest` la mejora.
