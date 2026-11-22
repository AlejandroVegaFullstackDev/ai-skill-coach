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

if ! command -v claude >/dev/null 2>&1; then
  say ""
  say "Listo. Falta Claude Code: https://docs.claude.com/en/docs/claude-code"
  say "Despues: cd $DIR && claude \"$NEXT\""
  exit 0
fi

if [ "${SKILL_COACH_NO_LAUNCH:-}" = "1" ] || [ ! -e /dev/tty ]; then
  say ""
  say "Listo. Para empezar: cd $DIR && claude \"$NEXT\""
  exit 0
fi

say ""
say "Abriendo Claude Code con $NEXT..."
# Con curl | bash, stdin es el script: el agente necesita la terminal real.
exec claude "$NEXT" </dev/tty
