# Voz

Opcional. El repo funciona entero sin esto. Pero si la habilidad se produce hablando, el análisis
de pronunciación es la única forma de ver errores que quien los comete no oye.

Todo local, todo gratis, el audio no sale de tu máquina.

---

## Por qué un transcriptor no sirve

Un hispanohablante dice *"eschema"*. Whisper escucha *"eschema"* y escribe `schema`.

No es un fallo del modelo: su trabajo es entenderte, no juzgarte. Te da la razón, el error no
aparece en ningún sitio y se fosiliza. Lo mismo pasa con cualquier error sistemático que no
impida la comprensión, que son justo los que se quedan para siempre.

Hace falta evaluación **a nivel de fonema**: algo que te diga qué sonido dijiste de verdad, no qué
palabra quisiste decir.

---

## La pieza clave

[**OpenPronounce**](https://github.com/Halleck45/OpenPronounce) — MIT, autoalojado, alternativa
libre a Azure Pronunciation Assessment.

Devuelve:

- Puntuación 0-100
- **Por palabra: el fonema esperado contra el que pronunciaste, en IPA**
- Tasa de error fonémico y de palabra
- Curvas de tono y energía

`wav2vec2` afinado con etiquetas de fonemas, más DTW para alinear. Corre **en CPU**, descarga
~1,2 GB de pesos la primera vez, y se usa como librería de Python, por CLI o en Docker.

Que devuelva el fonema que *de verdad* dijiste es lo que expone la vocal epentética: verías
literalmente una vocal insertada donde no va.

**Limitación honesta:** ~10% de error fonémico incluso con voz nativa limpia, y empeora con acento
marcado, que es precisamente el caso de quien lo va a usar. Sirve para **detectar patrones
repetidos y ver tendencia**, no para tomarse un número absoluto en serio. Si un día dice 72 y otro
78, eso no significa nada. Que marque la misma inserción veinte veces, sí.

---

## El resto del stack

| Pieza | Qué hace | Licencia |
|---|---|---|
| [Transformers.js](https://github.com/huggingface/transformers.js) | Whisper y TTS **dentro del navegador**, sin servidor | Apache-2.0 |
| Web Speech API | Dictado y voz nativos del navegador. iOS Safari 14.5+ (parcial) | — |
| [Piper](https://github.com/OHF-Voice/piper1-gpl) | TTS neuronal local, para pre-generar audio | **GPL-3.0** |
| Kokoro | TTS ligero, alternativa con licencia permisiva | Apache-2.0 |
| [OpenPronounce](https://github.com/Halleck45/OpenPronounce) | Evaluación fonémica | MIT |

**Sobre Piper:** es GPL-3.0. Para uso personal da igual. Si esto acaba dentro de un producto, GPL
obliga a liberar el derivado — por eso vale la pena mirar Kokoro antes de acoplarse.

---

## Cómo se reparte

- **Móvil, en la calle:** escuchar audio pre-generado y grabarte con `MediaRecorder`. Sin análisis
  en el momento: solo captura.
- **PC:** el audio grabado pasa por OpenPronounce en local cuando corres el comando. Análisis
  fonémico completo, gratis, sin que tu voz salga a ningún servidor.

Esa separación es lo que mantiene el coste en cero **y** tus grabaciones en tus máquinas.

---

## Reglas

- Las grabaciones van a `private/recordings/`, ignorado por git. Todas las extensiones de audio
  están en `.gitignore`.
- La salida del análisis contiene transcripciones: también ignorada.
- **Ningún audio se sube a un tercero** sin que esté escrito aquí qué se envía y a dónde. Ahora
  mismo: nada sale.
- Si el análisis no está instalado, el agente lo dice y sigue con el resto. No es un bloqueo.
