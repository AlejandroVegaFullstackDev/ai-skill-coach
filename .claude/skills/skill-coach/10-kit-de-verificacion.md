# 10 — Kit de verificación

## El problema

El aprendiz no puede saber si lo está haciendo bien. Si pudiera, no necesitaría un tutor.

Decir *"no puedo verificarlo"* y seguir adelante es la salida cómoda. La correcta es preguntarse
**qué es lo más barato que convertiría esto en verificable**, y proponerlo.

Cada paquete de dominio declara su kit. Este fichero dice de qué se puede elegir.

---

## Los cinco niveles

De más barato a más caro. **Empezar siempre por el 0**, que es gratis y funciona en todos los
dominios.

### Nivel 0 — Que lo reproduzca

El aprendiz produce de vuelta la notación o el razonamiento **antes** de ejecutar.

*"Dime qué dedo va en qué traste"*, *"¿qué pasa si invierto estos dos pines?"*, *"¿dónde pondrías
la validación?"*.

Cuesta treinta segundos, no necesita nada, y detecta el malentendido antes de que se convierta en
tres semanas de práctica equivocada. Ver `09-notacion.md`.

**Aplica a todos los dominios, siempre. No es opcional.**

### Nivel 1 — Foto

El agente lee imágenes. Una foto de la mano en el mástil, de la placa montada, del cable soldado.

Da información real: posición, ángulo, orden, si algo está donde no va. Es lo mejor que existe
para lo estático y no cuesta nada.

Qué **no** da: nada dinámico. Una foto no dice si zumba, si va a tempo, ni si se calienta.

Guardar en `private/<perfil>/capturas/`. Ignorado por git.

### Nivel 2 — Vídeo, por fotogramas

Para secuencias: un cambio de acorde, un movimiento, un montaje paso a paso.

El agente no ve vídeo. Se extraen fotogramas y se leen como imágenes:

```bash
ffmpeg -i clip.mp4 -vf fps=2 private/<perfil>/capturas/f%03d.png
```

Dos por segundo suele bastar. Más fotogramas no es más información, es más ruido.

### Nivel 3 — Medición local

Una herramienta convierte la realidad en números, y el agente lee los números. **Aquí está el
salto de calidad**, porque un número no admite interpretación.

| Dominio | Herramienta | Qué mide de verdad |
|---|---|---|
| Idioma hablado | OpenPronounce (MIT) | Fonema pronunciado vs. esperado, en IPA. Ver `VOICE.md` |
| Música | Essentia.js (WASM, navegador) | Tono, acordes, onsets, BPM |
| Electrónica | Multímetro, lecturas dictadas | Continuidad, tensión |
| Hardware | Logs del sistema, benchmarks | Si arrancó, temperaturas, si detecta la RAM |
| Deporte / movimiento | Cronómetro, repeticiones | Tiempo y cuenta |

La regla: **la herramienta escribe un fichero, el agente lo lee.** Nunca "el agente escucha en
directo": eso no existe. Es capturar, medir, leer.

**Este nivel solo existe con terminal.** Quien use el tutor desde un chat web no puede montar
herramientas locales, así que su techo es el nivel 1 —la foto— salvo que la plataforma acepte
audio. Antes de proponer el nivel 3, comprobar que el aprendiz tiene dónde ejecutarlo.

Y antes de proponerlo, la pregunta honesta: **¿cuánto mejora sobre el nivel 0?** Si el aprendiz
puede contar sus propias repeticiones con un cronómetro, automatizarlo con audio es trabajo de
ingeniería para ahorrar una cuenta que él ya sabe hacer. Ahí el nivel 3 no vale la pena.

**Comprobar la licencia antes de acoplarse.** Essentia es AGPL; Piper es GPL-3.0. Para uso
personal da igual; si acaba en un producto, no.

### Nivel 4 — Verificación automática

El dominio verifica solo, sin sensores ni juicio. Es el mejor caso y casi solo se da en software.

**Programación:** el agente escribe un test que falla y un esqueleto. El aprendiz implementa. Los
tests corren. No hay opinión: pasa o no pasa.

Ese es el formato de mayor valor para cualquier dominio de software, y sustituye a cualquier
cámara o micrófono.

Aplica también a: matemáticas con resultado comprobable, configuración de sistemas (arranca o
no), consultas SQL contra datos conocidos.

---

## Lo que no se puede verificar

Siempre queda algo. **Se dice, no se disimula:**

> El zumbido de una cuerda mal pisada no lo detecto con una foto, y con audio solo aproximado.
> Para eso hace falta un oído. Lo que sí puedo: contar tus cambios por minuto y mirarte la mano
> en una foto.

Y cuando lo no verificable es el núcleo de la habilidad, **decirlo al principio, no al final**:

> Para soldadura estructural puedo darte teoría, secuencia y criterios. No puedo certificar un
> cordón. Si esto va en serio, necesitas a alguien delante en algún momento. El sistema te sirve
> para llegar a esa persona sabiendo más, no para sustituirla.

Eso no es rebajar el producto. Es lo que evita práctica confiada y equivocada, que es peor que no
practicar.

---

## Cómo se propone

`/add-domain` lo investiga y lo escribe en el paquete. `/setup` lo menciona al cerrar, **con una
acción concreta, no con una lista de opciones**:

> Para guitarra: mándame una foto de cada acorde y te digo si la mano está bien puesta. Eso es
> gratis y funciona hoy.
>
> Si quieres medir de verdad los cambios por minuto en vez de contarlos tú, se puede montar un
> contador de audio en local. Es un rato de trabajo. ¿Lo dejamos apuntado para más adelante?

**Una propuesta, la más barata, con la puerta abierta a la siguiente.** No un menú de cinco
niveles: eso devuelve la decisión al aprendiz, que es justo quien no sabe cuál necesita.

---

## En el paquete de dominio

```markdown
## Kit de verificacion

| Nivel | Que | Estado |
|---|---|---|
| 0 | Reproducir el diagrama del acorde antes de tocarlo | activo |
| 1 | Foto de la mano por acorde | activo |
| 3 | Contador de cambios por minuto (Essentia.js, local) | propuesto |

**No verificable:** zumbido y limpieza del sonido. Hace falta un oido.
```

`activo` es lo que se usa ya. `propuesto` es lo que se ofreció y está pendiente. Que quede
escrito evita volver a proponer lo mismo cada sesión.
