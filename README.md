# Zff Installation Repo

## Zff-Reload

**GET INSTALLATION**

Download `linux.sh` from folder `zff-reload/`.

```bash
curl https://raw.githubusercontent.com/ohzff/install/main/zff-reload/linux.sh > linux.sh
```

**START INSTALL**

First, You may need to tell the scrip where you want to install.

Check your system and choose one you want to install.

| System | Lib Path | Bin Path |
|:---|:---|:---|
| Linux (any) **[Install to system]** | `/usr/share` | `/usr/bin` |
| macOS (any) **[Install to system]** | `/usr/local/share` | `/usr/local/bin` |
| Linux & macOS **[Install to here]** | `.` | `.` |
| Windows | Use exe | |

Then, type `ZFFDIR=**LibPath** ZFFBIN=**BinPath** ./linux.sh`.

> e.g.
> 
> ```bash
> ZFFDIR=/usr/share ZFFBIN=/usr/bin ./linux.sh
> ```

