# Skill Coach: instalar o actualizar en un paso (Windows PowerShell 5.1+).
#
#   irm https://raw.githubusercontent.com/AlejandroVegaFullstackDev/ai-skill-coach/main/install.ps1 | iex
#
#   Otra carpeta:            $env:SKILL_COACH_DIR = "mi-carpeta"; irm ... | iex
#   Sin abrir el agente:     $env:SKILL_COACH_NO_LAUNCH = "1"; irm ... | iex
#
# Instalar: clona el repo y abre Claude Code con /setup.
# Actualizar: si la carpeta ya existe, trae el motor nuevo con fast-forward.
#   private/, progress/, ejercicios/ y knowledge/ estan fuera de git: una actualizacion
#   no los toca nunca. Si hay cambios locales en ficheros versionados, no se pisa nada.

& {
    $ErrorActionPreference = 'Stop'

    $repoUrl = if ($env:SKILL_COACH_REPO) { $env:SKILL_COACH_REPO } else { 'https://github.com/AlejandroVegaFullstackDev/ai-skill-coach.git' }
    $dir     = if ($env:SKILL_COACH_DIR)  { $env:SKILL_COACH_DIR }  else { 'ai-skill-coach' }

    function Fail($msg) { Write-Host "ERROR: $msg" -ForegroundColor Red; return }

    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Fail 'falta git. Instalalo (winget install Git.Git) y vuelve a correr esto.'; return
    }

    if (Test-Path (Join-Path $dir '.git')) {
        Write-Host "Ya instalado en $dir. Actualizando el motor..."
        Set-Location $dir
        $dirty = git status --porcelain --untracked-files=no
        if ($dirty) {
            Write-Host 'Hay cambios locales en ficheros versionados; no se actualiza para no pisarlos:'
            git status --short --untracked-files=no
            Write-Host 'Revisalos (git diff), haz commit o descartalos, y vuelve a correr el instalador.'
            return
        }
        git pull --ff-only
        if ($LASTEXITCODE -ne 0) { Fail "no se pudo actualizar con fast-forward. Revisa 'git status' en $dir."; return }
        Write-Host 'Actualizado. Tus datos (private/, progress/) no se han tocado.'
    }
    elseif (Test-Path $dir) {
        Fail "$dir ya existe y no es una instalacion de Skill Coach. Usa otra: `$env:SKILL_COACH_DIR = 'otra-carpeta'"; return
    }
    else {
        Write-Host "Instalando Skill Coach en $dir..."
        git clone --depth 1 $repoUrl $dir
        if ($LASTEXITCODE -ne 0) { Fail 'fallo git clone.'; return }
        Set-Location $dir
    }

    foreach ($d in 'private','progress','ejercicios','knowledge','sources/pdf','sources/notes','sources/links') {
        New-Item -ItemType Directory -Force -Path $d | Out-Null
    }

    # Comprobar que los datos personales siguen fuera de git antes de seguir.
    foreach ($f in 'private/x','progress/x/tracker.json','ejercicios/x/a.md') {
        git check-ignore -q $f
        if ($LASTEXITCODE -ne 0) { Fail "$f no esta ignorado por git. No sigas: revisa .gitignore."; return }
    }

    $next = '/setup'
    if ((Test-Path 'private/active') -and ((Get-Item 'private/active').Length -gt 0)) {
        $next = '/learn'
        Write-Host "Perfil activo: $((Get-Content 'private/active' -TotalCount 1)). Siguiente: /learn"
    }

    # Orca: registrar el proyecto. Si no esta instalado o abierto, se dice y se sigue.
    $orcaBin = if ($env:ORCA_CLI_COMMAND) { $env:ORCA_CLI_COMMAND } else { 'orca' }
    if ($env:SKILL_COACH_NO_ORCA -ne '1' -and (Get-Command $orcaBin -ErrorAction SilentlyContinue)) {
        $here = (Get-Location).Path
        & $orcaBin repo add --path $here --json *> $null
        if ($LASTEXITCODE -eq 0) {
            Write-Host 'Registrado en Orca. Abrelo sobre el checkout principal, no en un worktree nuevo.'
        } else {
            Write-Host 'Orca esta instalado pero no se pudo registrar (puede que no este abierto).'
            Write-Host "  Luego: orca repo add --path `"$here`""
        }
    }

    # Agente: $env:SKILL_COACH_AGENT = claude|codex. Por defecto, el primero que haya.
    $agent = $env:SKILL_COACH_AGENT
    if (-not $agent) {
        if (Get-Command claude -ErrorAction SilentlyContinue) { $agent = 'claude' }
        elseif (Get-Command codex -ErrorAction SilentlyContinue) { $agent = 'codex' }
    }
    $cmdName = $next.TrimStart('/')
    switch ($agent) {
        'claude' { $prompt = $next }
        # Codex intercepta /comandos: se le pasa el procedimiento por nombre (ver AGENTS.md).
        'codex'  { $prompt = "Lee AGENTS.md y sigue el procedimiento de .claude/commands/$cmdName.md" }
        { -not $_ } {
            Write-Host ''
            Write-Host 'Listo. Falta un agente: Claude Code (https://docs.claude.com/en/docs/claude-code) o Codex.'
            Write-Host "Despues: cd $dir; claude `"$next`"   (en Codex escribe: $cmdName)"
            return
        }
        default { Fail "SKILL_COACH_AGENT=$agent no soportado. Usa claude o codex."; return }
    }

    if ($env:SKILL_COACH_NO_LAUNCH -eq '1') {
        Write-Host ''
        Write-Host "Listo. Para empezar: cd $dir; $agent `"$prompt`""
        return
    }

    Write-Host ''
    Write-Host "Abriendo $agent con $cmdName..."
    & $agent $prompt
}
