### Simple status bar written in rust and gtk4.

Current status:
![image](https://github.com/user-attachments/assets/47fd6a0b-841b-45d5-81a5-0ad95b0b39c0)



TODO:
- [ ] make workspace widget better
- [ ] add more components similar to gnome-shell
- [ ] add css watcher


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
