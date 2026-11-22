#!/usr/bin/env bash
# Skill Coach: instalar o actualizar en un paso.
#
#   curl -fsSL https://raw.githubusercontent.com/AlejandroVegaFullstackDev/ai-skill-coach/main/install.sh | bash
#   curl -fsSL .../install.sh | bash -s -- mi-carpeta      # otra carpeta
#   SKILL_COACH_NO_LAUNCH=1 curl ... | bash                 # sin abrir el agente al final
#
# Instalar: clona el repo y abre Claude Code con /setup.
# Actualizar: si la carpeta ya existe, trae el motor nuevo con fast-forward.
#   private/, progress/, ejercicios/ y knowledge/ estan fuera de git: una actualizacion
#   no los toca nunca. Si hay cambios locales en ficheros versionados (por ejemplo, un
#   paquete que aprendio de tus sesiones), no se pisa nada: se para y se dice.

set -euo pipefail

REPO_URL="${SKILL_COACH_REPO:-https://github.com/AlejandroVegaFullstackDev/ai-skill-coach.git}"
DIR="${1:-ai-skill-coach}"

say()  { printf '%s\n' "$*"; }
fail() { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

command -v git >/dev/null 2>&1 || fail "falta git. Instalalo y vuelve a correr esto."

if [ -d "$DIR/.git" ]; then
  say "Ya instalado en $DIR. Actualizando el motor..."
  cd "$DIR"
  if [ -n "$(git status --porcelain --untracked-files=no)" ]; then
    say "Hay cambios locales en ficheros versionados; no se actualiza para no pisarlos:"
    git status --short --untracked-files=no
    say "Revisalos (git diff), haz commit o descartalos, y vuelve a correr el instalador."
    exit 1
  fi
  git pull --ff-only || fail "no se pudo actualizar con fast-forward. Revisa 'git status' en $DIR."
  say "Actualizado. Tus datos (private/, progress/) no se han tocado."
elif [ -e "$DIR" ]; then
  fail "$DIR ya existe y no es una instalacion de Skill Coach. Elige otra carpeta: ... | bash -s -- otra-carpeta"
else
  say "Instalando Skill Coach en $DIR..."
  git clone --depth 1 "$REPO_URL" "$DIR"
  cd "$DIR"
fi

# Las carpetas de datos personales ya vienen con su README; se garantiza que existan.
mkdir -p private progress ejercicios knowledge sources/pdf sources/notes sources/links

# Comprobar que los datos personales siguen fuera de git antes de seguir.
for f in private/x progress/x/tracker.json ejercicios/x/a.md; do
  git check-ignore -q "$f" || fail "$f no esta ignorado por git. No sigas: revisa .gitignore."
done

if [ -s private/active ]; then
  NEXT="/learn"
  say "Perfil activo: $(head -n1 private/active). Siguiente: /learn"
else
  NEXT="/setup"
fi

# Orca: registrar el proyecto para que aparezca en la barra lateral. Si Orca no esta
# instalado o no esta abierto, no pasa nada: se dice y se sigue.
ORCA_BIN="${ORCA_CLI_COMMAND:-orca}"
# En Git Bash, pwd da /c/...; Orca en Windows necesita C:/... (pwd -W).
HERE="$(pwd -W 2>/dev/null || pwd)"
if [ "${SKILL_COACH_NO_ORCA:-}" != "1" ] && command -v "$ORCA_BIN" >/dev/null 2>&1 \
   && "$ORCA_BIN" --help 2>/dev/null | grep -q "repo add"; then
  if "$ORCA_BIN" repo add --path "$HERE" --json >/dev/null 2>&1; then
    say "Registrado en Orca. Abrelo sobre el checkout principal, no en un worktree nuevo."
  else
    say "Orca esta instalado pero no se pudo registrar (puede que no este abierto)."
    say "  Luego: orca repo add --path \"$HERE\""
  fi
fi

# Agente: SKILL_COACH_AGENT=claude|codex. Por defecto, el primero que haya.
AGENT="${SKILL_COACH_AGENT:-}"
if [ -z "$AGENT" ]; then
  if command -v claude >/dev/null 2>&1; then AGENT=claude
  elif command -v codex >/dev/null 2>&1; then AGENT=codex
  fi
fi

case "$AGENT" in
  claude) LAUNCH=(claude "$NEXT") ;;
  # Codex intercepta /comandos: se le pasa el procedimiento por nombre (ver AGENTS.md).
  codex)  LAUNCH=(codex "Lee AGENTS.md y sigue el procedimiento de .claude/commands/${NEXT#/}.md") ;;
  "")
    say ""
    say "Listo. Falta un agente: Claude Code (https://docs.claude.com/en/docs/claude-code) o Codex."
    say "Despues: cd $DIR && claude \"$NEXT\"   (en Codex escribe: ${NEXT#/})"
    exit 0 ;;
  *) fail "SKILL_COACH_AGENT=$AGENT no soportado. Usa claude o codex." ;;
esac

if [ "${SKILL_COACH_NO_LAUNCH:-}" = "1" ] || [ ! -e /dev/tty ]; then
  say ""
  say "Listo. Para empezar: cd $DIR && ${LAUNCH[0]} \"${LAUNCH[1]}\""
  exit 0
fi

say ""
say "Abriendo $AGENT con ${NEXT#/}..."
# Con curl | bash, stdin es el script: el agente necesita la terminal real.
exec "${LAUNCH[@]}" </dev/tty
