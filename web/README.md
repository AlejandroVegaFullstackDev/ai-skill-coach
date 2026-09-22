# Usarlo sin terminal

Para quien no programa. Funciona en ChatGPT, Claude, Gemini o DeepSeek, desde el móvil o desde
cualquier navegador. No hace falta instalar nada ni saber qué es git.

**Se monta una vez, en cinco minutos.**

---

## Lo único que tienes que entender

Un chat no recuerda nada entre conversaciones. Por eso las apps de idiomas te hacen repetir lo
básico: no saben qué ya sabes.

Aquí la memoria es **un fichero que llevas tú**: `progreso.md`.

```
       tu abres el chat
              |
       le das progreso.md
              |
         la sesion
              |
    te devuelve progreso.md actualizado
              |
     lo guardas encima del anterior
```

Eso es todo el mantenimiento: **guardar un fichero al terminar.** Si un día no lo guardas, pierdes
esa sesión y nada más.

---

## Montarlo

### 1. Copia los dos ficheros

- **[`INSTRUCCIONES.md`](INSTRUCCIONES.md)** — el tutor. Se pega una vez y no se toca más.
- **[`progreso-plantilla.md`](progreso-plantilla.md)** — tu memoria. Guárdalo como `progreso.md`.

### 2. Crea el espacio en tu plataforma

| Plataforma | Dónde | Cómo |
|---|---|---|
| **ChatGPT** | Proyectos, o un GPT propio | Crea un proyecto → *Instrucciones* → pega `INSTRUCCIONES.md` |
| **Claude** | Proyectos | Crea un proyecto → *Instrucciones personalizadas* → pega `INSTRUCCIONES.md` |
| **Gemini** | Gems | Crea un Gem → pega en las instrucciones |
| **DeepSeek** | Sin proyectos | Pega `INSTRUCCIONES.md` como primer mensaje de cada conversación |

En los tres primeros, las instrucciones se quedan. En DeepSeek hay que pegarlas cada vez: es más
incómodo pero funciona igual.

### 3. Primera conversación

Sube o pega tu `progreso.md` (vacío la primera vez) y escribe:

> Es mi primera sesión. Quiero aprender [lo que sea]. Hazme la línea base.

Te va a preguntar para qué exactamente, y no va a aceptar una respuesta vaga. Es a propósito: sin
una situación concreta que superar, el plan se dispersa y no hay forma de saber si esto está
sirviendo.

### 4. A partir de ahí

Cada vez que tengas un hueco: conversación nueva, pegas tu `progreso.md`, y dices en qué
condiciones estás.

```
Tengo 10 minutos y estoy en el bus, no puedo hablar.
```

```
Tengo media hora y la casa para mí.
```

Al terminar te devuelve el `progreso.md` actualizado. **Guárdalo encima del viejo.**

---

## Dónde guardar el progreso

Donde no se te pierda y puedas abrirlo desde el móvil: Google Drive, Notas, Notion, Dropbox, el
escritorio. Da igual cuál, importa que sea siempre el mismo sitio.

**Es un fichero privado.** Dice en qué eres flojo. No lo subas a ningún sitio público.

---

## Lo que no funciona igual que en la terminal

Honestamente, para que no te lleves sorpresas:

| | Terminal | Chat web |
|---|---|---|
| Guardar el progreso | Automático | **Lo guardas tú al terminar** |
| Buscar material en la web | Sí | Solo si tu plataforma busca |
| Leer tus PDFs | Sí | Sí, subiéndolos al proyecto |
| Ver tus fotos | Sí | Sí, en ChatGPT, Claude y Gemini |
| Varias habilidades a la vez | `/profile` | Un proyecto y un `progreso.md` por habilidad |
| Ejercicios pre-generados | Sí, y por eso es instantáneo | No: se generan en el momento |

Lo último es la diferencia real de coste. En la terminal el material se genera entre sesiones y
practicar no consume nada. En el chat, cada sesión es una conversación. Con un plan gratuito vas a
tocar el límite si haces sesiones largas.

**Nada de eso rompe lo importante:** que no te vuelva a enseñar lo que ya sabes, que te corrija de
verdad y que no te infle el nivel. Eso vive en el `progreso.md`, y el `progreso.md` funciona igual
en las dos.

---

## Si algún día te pasas a la terminal

Tu `progreso.md` sirve tal cual. El repo lo lee y lo convierte a su formato interno. No pierdes
nada de lo acumulado.

Ver el [README principal](../README.md).
