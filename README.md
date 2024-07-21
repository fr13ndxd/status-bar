### Simple status bar written in rust and gtk4.

Current status:
![image](https://github.com/user-attachments/assets/50a6c6c8-2470-4421-8ff6-8f64b70f062d)



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
