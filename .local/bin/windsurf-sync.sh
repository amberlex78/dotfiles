#!/bin/bash

# Путь к расширениям WindSurf
EXTENSIONS_DIR="$HOME/.windsurf/extensions"

# Путь к Git-репозиторию (он же, что и EXTENSIONS_DIR)
REPO_DIR="$EXTENSIONS_DIR"

# URL твоего репозитория
GIT_REPO="git@github.com:amberlex78/windsurf-extensions.git"

# Функция сохранения расширений в Git
backup_extensions() {
    echo "🔄 Сохраняем расширения WindSurf в Git..."
    cd "$REPO_DIR" || { echo "❌ Ошибка: папка не найдена"; exit 1; }

    # Проверяем, инициализирован ли Git
    if [ ! -d ".git" ]; then
        echo "⚠️  Репозиторий не найден, клонирую..."
        git clone "$GIT_REPO" "$REPO_DIR"
        cd "$REPO_DIR" || exit
    fi

    # Проверяем статус Git
    git status

    # Добавляем и коммитим изменения
    git add .
    git commit -m "🔄 Backup WindSurf extensions $(date)" || echo "⚠️  Нет новых изменений для коммита"
    git push origin main

    echo "✅ Расширения сохранены!"
}

# Функция восстановления расширений из Git
restore_extensions() {
    echo "🔄 Загружаем расширения WindSurf..."
    
    # Если папки нет, клонируем
    if [ ! -d "$REPO_DIR/.git" ]; then
        echo "⚠️  Репозиторий не найден, клонирую..."
        git clone "$GIT_REPO" "$REPO_DIR"
    else
        cd "$REPO_DIR" || exit
        git pull origin main
    fi

    echo "✅ Расширения восстановлены!"
}

# Меню выбора
echo "WindSurf Extensions Sync"
echo "1) Сохранить расширения в Git"
echo "2) Восстановить расширения из Git"
echo "3) Показать статус Git"
echo "4) Выйти"
read -r choice

case $choice in
    1) backup_extensions ;;
    2) restore_extensions ;;
    3) cd "$REPO_DIR" && git status ;;
    4) exit 0 ;;
    *) echo "❌ Неверный ввод"; exit 1 ;;
esac

