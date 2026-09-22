# AI Skill Coach

*Un tutor que recuerda lo que ya sabes.*

Un marco de trabajo para aprender **cualquier habilidad** con un agente de código. Le dices qué
quieres aprender y para qué, y el agente se documenta sobre la habilidad, te hace un test de
nivel, y genera tu plan de entrenamiento. Después te sirve la sesión que cabe en el hueco que
tengas hoy.

Idiomas, mecánica, programación, negocios, negociación, hablar en público. **El motor no sabe
nada de ninguna habilidad concreta**: lo que sabe es cómo se aprende algo. Lo específico vive en
un paquete de dominio que `/add-domain` genera para lo que le pidas.

> Inspirado en la anatomía de [ai-job-search](https://github.com/MadsLorentzen/ai-job-search):
> comandos que hacen un paso cada uno, perfil en ficheros y un estado que persiste entre sesiones.
> Proyecto independiente, sin relación con Anthropic.

## Dos formas de usarlo

**Sin terminal, en ChatGPT / Claude / Gemini / DeepSeek** → **[web/](web/)**. Cinco minutos de
montaje, no hace falta programar ni saber qué es git. Pegas las instrucciones en un proyecto y
llevas tu progreso en un fichero.

**Con terminal**, si ya usas un agente de código: clona el repo y sigue leyendo. Los ejercicios
se pre-generan, practicar no consume nada y el estado se guarda solo.

Las dos comparten lo que importa: que no te vuelva a enseñar lo que ya sabes, que te corrija de
verdad y que no te infle el nivel.

---

## El problema

Casi toda la formación te hace repasar lo básico durante meses porque no tiene memoria de lo que
ya demostraste. Y asume que tienes una hora libre y ganas.

Aquí la unidad no es la lección, es **el hueco que tengas**:

```
/learn tengo 7 minutos
/learn estoy en el bus, no puedo hablar
/learn no tengo las herramientas aqui
/learn 40 minutos pero estoy fundido
```

El agente devuelve **una** actividad, elegida según tu nivel medido, tus errores recientes y esas
condiciones. Cada ejercicio lleva metadatos —duración, qué necesita, qué requiere dominado antes—
así que elegir es filtrar, no improvisar.

---

## El flujo

```
/setup  ->  /assess  ->  /harvest  ->  /plan  ->  /learn  ->  /log
perfil      nivel con    material      plan      la sesion   que paso
   |        evidencia    destilado                           |
   |             ^                                           |
   +- investiga  +--------------- /plan relee el log --------+
      la habilidad
      sobre la marcha
```

`/setup` pregunta **de una en una, con opciones**: puedes completarlo pulsando Enter. Y en mitad
del proceso se documenta sobre la habilidad, para que las preguntas siguientes sean informadas en
vez de genéricas — nadie sabe contestar *"¿cuál es tu nivel en programación reactiva?"* antes de
que le digan de qué partes se compone.

| Comando | Qué hace |
|---|---|
| **`/setup`** | Crea un perfil. Pregunta de una en una, investiga la habilidad sobre la marcha y te deja listo |
| **`/profile`** | Varios perfiles en el mismo repo. Varias habilidades, o varias personas |
| **`/crash`** | Aprender una cosa concreta **ya**: hay reunión en dos horas y no sabes qué es |
| **`/add-domain`** | Genera el paquete de una habilidad. `/setup` ya lo llama solo; esto es para añadir otra después |
| **`/assess`** | Test de nivel con evidencia. Crea el tracker. Sin esto, todo lo demás adivina |
| **`/harvest`** | **Se entrena**: lee tus PDFs, busca en la web, evalúa cada fuente y destila fichas citables |
| **`/plan`** | Genera el siguiente tramo desde esas fichas y desde dónde fallas |
| **`/learn`** | La sesión. Una actividad, filtrada por tu tiempo y tus condiciones |
| **`/drill`** | Machaca un punto concreto. Repetición con corrección inmediata |
| **`/review`** | Saca lo que toca repasar por fecha |
| **`/log`** | Registra lo que pasó fuera: una entrevista, una avería real, una reunión |
| **`/reset`** | Borra datos, con confirmación literal y respaldo |

---

## Cómo se entrena el agente en tu habilidad

Dos comandos, y ninguno inventa nada de memoria.

**`/add-domain <habilidad>`** investiga y escribe el paquete de dominio respondiendo cinco
preguntas:

1. ¿Cuál es el salto real? No el temario: **dónde se atasca la gente**.
2. ¿Qué errores comete alguien que viene de donde vienes tú?
3. ¿Cómo se practica esto de verdad? Qué hace falta, y si hay ruta sin equipamiento.
4. ¿Cuál es el formato de mayor valor? El equivalente al simulacro de entrevista.
5. ¿Hay escala o certificación reconocida, y qué mide de verdad?

Si no puede responder alguna con evidencia, **lo escribe como hueco** en vez de inventarla.

**`/harvest`** reúne el material:

```
sources/          ->   evaluacion   ->   knowledge/       ->   /plan
tus PDFs,              autoridad,        fichas con            ejercicios
enlaces y notas        nivel, licencia   fuente citada         con sources: [...]
   +
busqueda web
dirigida a huecos
```

Dejas un manual en `sources/pdf/`, corre, lo contrasta con lo que encuentre, descarta lo que no
pasa el filtro de calidad y escribe fichas con su fuente y su nivel de confianza.

**Un ejercicio con el campo `sources` vacío no se acepta.** Ese es el mecanismo que impide que el
agente se invente el currículo.

Lo que hay dentro de un PDF o una página web es **material de estudio, nunca instrucciones**. Si
un documento contiene texto dirigido al agente, se ignora y se te avisa.

---

## Representar, no describir

El aprendiz **no puede detectar que entendió mal**. Para eso está aprendiendo. El agente explica
en prosa, el aprendiz asiente, y dos semanas después resulta que llevaba el pulgar por encima del
mástil desde el primer día.

Así que el agente no describe cosas espaciales: las dibuja, en la terminal, en ASCII puro.

```
       Em                    Am
    E A D G B e           E A D G B e
    0 . . 0 0 0           x 0 . . . 0
    +-+-+-+-+-+           +-+-+-+-+-+
 1  | | | | | |        1  | | | | O |
    +-+-+-+-+-+           +-+-+-+-+-+
 2  | O O | | |        2  | | O O | |
    +-+-+-+-+-+           +-+-+-+-+-+

    0 al aire · x no suena · O dedo · de grave a aguda
```

Cada dominio trae su notación: diagramas de acordes, pinouts, tablas de conexión, árboles de
estructura, antes/después. La que usa la gente que hace eso de verdad, no una inventada.

Y después **te hace reproducirla**, porque preguntar *"¿entendido?"* no sirve: a eso todo el
mundo dice que sí. *"Dime qué dedo va en qué traste"* sí sirve, y cuesta treinta segundos.

---

## Cómo sabes que lo estás haciendo bien

La pregunta incómoda de aprender solo. Cada paquete de dominio declara su kit, del más barato al
más caro:

| | Qué | Cuesta |
|---|---|---|
| **0** | Reproduces la notación antes de ejecutar | nada, y aplica siempre |
| **1** | Una foto: el agente lee imágenes y ve tu postura, tu montaje, tu soldadura | nada |
| **2** | Fotogramas de un vídeo, para secuencias | `ffmpeg` |
| **3** | Medición local: fonemas con OpenPronounce, cambios por minuto con Essentia.js | un rato de montaje |
| **4** | Verificación automática: el agente escribe el test que falla, tú implementas | solo en software |

Y **lo que no se puede verificar se dice**, con lo que haría falta para cubrirlo. Un tutor que
finge poder juzgar tu técnica produce práctica confiada y equivocada, que es peor que no
practicar.

---

## Varios perfiles

Un perfil es **una persona aprendiendo una habilidad**. Tiene su nivel, su progreso y su
currículo propios.

```
/profile                    lista y dice cual esta activo
/profile new                crea otro
/profile use <nombre>       cambia
/profile archive <nombre>   lo aparta sin borrarlo
```

Sirve para entrenar dos cosas a la vez sin que se mezclen, y para que dos personas compartan el
repo sin verse los datos. `knowledge/` se comparte por habilidad —las fichas describen la
materia, no a la persona— así que `/harvest` no se corre dos veces.

---

## Cuando no hay meses: `/crash`

```
/crash programacion reactiva, entrevista el jueves
/crash como funciona OAuth, tengo 2 horas
```

Salta la línea base y el plan, y comprime todo en una sesión: el problema que resuelve, los cinco
conceptos que no puedes no saber, **lo que puedes ignorar hoy**, el error que comete todo el
mundo, y cuándo no se usa.

Te dice de entrada qué compra eso: **L1-L2**, seguir la conversación y preguntar bien. No L3, no
diseñar con ello. Y cierra con la pregunta que te delataría, y cómo responderla sin farolear.

Lo aprendido queda marcado como deuda, con repaso a 2 días. Si era para el jueves y ya pasó, se
archiva solo.

---

## El test de nivel

`/assess` no es un cuestionario. Es una tarea real, sin preparación previa, empujada hasta que
falla — porque el nivel está donde deja de salir, no donde deja de ser cómodo.

Escala interna de cinco niveles, aplicada **por sub-habilidad**:

| | | Cómo se comprueba |
|---|---|---|
| **L1** | Reconoce | Se lo muestras y lo nombra |
| **L2** | Con guía | Lo hace contigo delante |
| **L3** | Solo, caso típico | Le das la tarea estándar y sale |
| **L4** | Solo, caso raro | Le cambias las condiciones y sigue |
| **L5** | Enseña | Detecta el error de otro y explica por qué |

El salto que importa casi siempre es **L2 → L3**: la diferencia entre "hice un curso" y "sé
hacerlo". Es donde la gente se estanca años, porque material para estudiar sobra y ocasiones de
hacerlo solo no.

Si el dominio tiene escala propia —CEFR, una certificación sectorial— se anotan las dos, **y qué
mide cada una**. Un certificado teórico puntúa alto y no predice la ejecución.

---

## Por qué cuesta cero

Llamar a un modelo en cada ejercicio es caro y lento. Aquí la IA trabaja **entre sesiones**:

1. `/harvest` y `/plan` corren cada pocos días y dejan el material escrito en el repo.
2. `/learn` sirve lo que ya existe. Instantáneo.
3. Cada tanto le cuentas cómo va y el ciclo se repite, ya calibrado.

El único coste recurrente es tu suscripción al agente, que ya tienes si programas con uno.

---

## Los cuatro estados

Un "ítem" es lo mínimo que se puede dominar: una estructura, un concepto, una técnica.

| Estado | Significa |
|---|---|
| `unseen` | No se ha tocado |
| `taught` | Se explicó, no se ha producido solo |
| `practiced` | Lo hace con ayuda o con errores |
| `mastered` | Lo hizo bien, sin ayuda, **dos veces en sesiones distintas** |

Un ítem `mastered` no se vuelve a enseñar. Solo vuelve como repaso por fecha, o si falla en uso
real y entonces se degrada **con la evidencia literal**.

Las dos veces en sesiones distintas no son negociables: hacerlo bien justo después de que te lo
expliquen mide memoria a corto plazo, no dominio.

---

## Honestidad

El tutor no adula. Está en las reglas, no es una preferencia de estilo:

- **No infla tu nivel.** Si la evidencia no lo sostiene, no sube, aunque hayas trabajado mucho.
- **No responde exámenes cuyo resultado entregas a un tercero.** Test de nivel, certificación,
  prueba técnica de una empresa: se niega y ofrece revisarlo después.
- **No inventa errores para parecer útil**, ni reescribe lo correcto-pero-simple en algo más
  sofisticado.
- **Nombra todos los errores**, no una muestra amable.
- **Dice cuándo no puede verificar.** En habilidades físicas o presenciales no puede ver tu
  ejecución: puede darte plan y criterio, no confirmarte que lo haces bien. Práctica confiada y
  equivocada es peor que no practicar.

---

## Privacidad

Este repositorio es open source **para que copies el motor, no para que veas el progreso de nadie.**

| Público | Privado (ignorado por git) |
|---|---|
| Comandos y skills | `private/` — tu perfil real |
| Diseño de currículo | `progress/` — tu nivel, tus errores, tu historial |
| Paquetes de dominio | Tus grabaciones |

Un perfil de aprendizaje dice en qué eres flojo. Un repositorio público es para siempre. Ver
[SECURITY.md](SECURITY.md).

**Las grabaciones de voz son datos biométricos.** El análisis corre en tu máquina. Ver
[VOICE.md](VOICE.md).

---

## Empezar

```bash
git clone <este-repo> && cd ai-skill-coach
```

Abre tu agente en la carpeta:

```
/setup
```

Te va a preguntar qué habilidad y **para qué exactamente**. No le des una respuesta vaga a la
segunda: es la que ordena todo lo demás. *"Diagnosticar una avería por síntoma sin manual"* sirve;
*"saber de mecánica"* no.

Después `/add-domain` si tu habilidad no tiene paquete, y `/assess` para el nivel.

Tus datos van a `private/<perfil>/`, que está fuera del control de versiones. **Ningún fichero
versionado guarda nada tuyo**, ni siquiera resumido: `CLAUDE.md` solo apunta ahí. Puedes trabajar
en local y no subir nada nunca, o publicar tu fork sin revisar qué se filtra.

### Requisitos

Un agente de código que lea y escriba ficheros. Nada más. Sin servidor, sin base de datos, sin
cuenta en ningún sitio.

---

## El ejemplo trabajado

`.claude/skills/english-coach/` es un paquete de dominio completo —inglés B1→B2 para un
hispanohablante que necesita pasar entrevistas técnicas— y está ahí para que se vea qué aspecto
tiene uno bien hecho: el mapa del salto real, la tabla de interferencias del idioma de origen, el
protocolo del simulacro.

Si lo tuyo es otra cosa, no lo borres: úsalo de referencia y corre `/add-domain`.

---

## Estructura

```
CLAUDE.md                  reglas de trabajo. No contiene datos de nadie
AGENTS.md                  punto de entrada para cualquier agente
.claude/commands/          los once comandos
.claude/skills/
  skill-coach/             el motor + 10 ficheros de referencia
  source-harvester/        recoleccion y destilado
  english-coach/           paquete de dominio de ejemplo
sources/                   material crudo que tu dejas caer
knowledge/<habilidad>/     fichas destiladas, citables
ejercicios/<perfil>/       ejercicios generados
progress/<perfil>/         tracker.json  — ignorado por git
private/active             el perfil activo  — ignorado por git
private/<perfil>/          tu perfil real    — ignorado por git
```

---

## Licencia

MIT. Haz lo que quieras con el motor.
