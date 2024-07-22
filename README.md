### Simple status bar written in rust and gtk4.

Current status:
![image](https://github.com/user-attachments/assets/972e38d2-1e8c-4487-917d-3ac17d77e4cf)



TODO:
- [ ] add css watcher
- [ ] quicksettings
- [ ] system indicators (temps of different pc components (cpu, ssd...), battery details, ...)
- [ ] clipboard manager
- [ ] tray


## Instalation:
### Home manager:
- add status-bar to inputs:
```nix
inputs.status-bar.url = "github:fr13ndxd/status-bar";
```
- add status-bar to home-manager packages:
```nix
{ inputs, ...}:

{
  home.packages = [
    inputs.status-bar.defaultPackage.${system}
  ];
}

```
