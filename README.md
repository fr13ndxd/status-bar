### Simple status bar written in rust and gtk4.

Current status:
![image](https://github.com/user-attachments/assets/7b14d74c-6f6d-4442-a61f-8732bb87bba3)


known-issues:
- active-app doesnt work for some reason

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
