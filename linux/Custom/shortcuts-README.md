В **Linux Mint** (основанном на Ubuntu) кастомные сочетания клавиш (Custom Keyboard Shortcuts) хранятся в **dconf**.  

### Где именно?
Настройки пользовательских сочетаний клавиш можно найти в **dconf**-базе по пути:  
```
/org/cinnamon/desktop/keybindings/custom-keybindings/
```
или  
```
/org/mate/desktop/keybindings/
```  
в зависимости от используемой среды рабочего стола (Cinnamon или MATE).

### Как посмотреть?
1. Откройте терминал и введите команду:
   ```
   dconf dump /org/cinnamon/desktop/keybindings/custom-keybindings/
   ```
   (если используете Cinnamon)  
   или  
   ```
   dconf dump /org/mate/desktop/keybindings/
   ```
   (если MATE).  

2. Также можно использовать **dconf-editor**:
   - Установите его (если не установлен):  
     ```
     sudo apt install dconf-editor
     ```
   - Запустите:  
     ```
     dconf-editor
     ```
   - Перейдите по пути `/org/cinnamon/desktop/keybindings/custom-keybindings/` и посмотрите список сочетаний.

### Где хранится физический файл?
Файл конфигурации dconf для пользователя хранится в:
```
~/.config/dconf/user
```
Но он в бинарном формате, поэтому править его напрямую не очень удобно.

### Как изменить или удалить?
Используйте **dconf-cli**:  
1. Сбросить все кастомные шорткаты:
   ```
   dconf reset -f /org/cinnamon/desktop/keybindings/custom-keybindings/
   ```
2. Удалить конкретный шорткат:
   ```
   dconf write /org/cinnamon/desktop/keybindings/custom-keybindings/custom0/name "['']"
   ```

Если нужно экспортировать и импортировать, можно сделать так:  
- Экспорт:
  ```
  dconf dump /org/cinnamon/desktop/keybindings/custom-keybindings/ > shortcuts.conf
  ```
- Импорт:
  ```
  dconf load /org/cinnamon/desktop/keybindings/custom-keybindings/ < shortcuts.conf
  ```

Если у тебя Linux Mint с **XFCE**, настройки хранятся в файлах:
```
~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
```  
Его можно редактировать вручную или через `xfce4-settings-editor`.
