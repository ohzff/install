# Zff Installation Repo

## Zff-Reload

**GET INSTALLATION**

Download `linux.sh` from folder `zff-reload/`.

```bash
curl https://raw.githubusercontent.com/ohzff/install/main/zff-reload/linux.sh > linux.sh
chmod +x ./linux.sh
```

**START INSTALL**

First, You may need to tell the scrip where you want to install.

Check your system and choose one you want to install.

| System | Lib Path | Bin Path |
|:---|:---|:---|
| Linux (any) **[Install to system]** | `/usr/share` | `/usr/bin` |
| macOS (any) **[Install to system]** | `/usr/local/share` | `/usr/local/bin` |
| Linux & macOS **[Install to here]** | PATH TO HERE | PATH TO HERE |
| Windows | Use exe | |

> you must use absolute path.

Then, type `./linux.sh`.

```bash
$ ./linux.sh                                   # Start the installation

Where do you want to put the game resources?
 read (/usr/share/) > **LibPath**              # Input the Lib path here.
Where do you want to put the binary file?
 read (/usr/bin/) > **BinPath**                # Input the bin path here.
```

**UPDATE**

Run this script and add flag `-u`.

> e.g.
> 
> ```bash
> sudo ./linux.sh -u
> ```
