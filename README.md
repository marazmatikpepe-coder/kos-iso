# K-OS ISO (сборка)
Сам ISO я собрать не мог: в моей среде нет интернета, а образ Debian качается из сети. Сборка запускается у тебя, один раз, автоматически. Конфиг сборкой НЕ проверен.

## Вариант A: GitHub (Linux не нужен)
1. Создай приватный репозиторий на github.com, загрузи туда содержимое папки (включая скрытую .github).
2. Settings > Secrets > Actions: KOS_SERVER = адрес сайта (https://...), KOS_PUBKEY = ключ из data/public.key.b64 сайта.
3. Actions > build-k-os-iso > Run workflow. Через 30-60 мин в Artifacts будет k-os.iso.

## Вариант B: свой Debian/Ubuntu
sudo ./build.sh https://твой.сайт КЛЮЧ

## Запись и установка вместо Windows
1. Rufus (GPT/UEFI, режим DD) или balenaEtcher. 2. В BIOS отключи Secure Boot, загрузись с флешки.
3. Сначала запусти как Live, проверь тачскрин, Wi-Fi, звук, поворот. 4. Установка: Calamares в меню, «Erase disk» (сотрёт Windows).
Если UEFI 32-битный и флешка не грузится, напиши мне, поправим загрузчик (самое рискованное место).
