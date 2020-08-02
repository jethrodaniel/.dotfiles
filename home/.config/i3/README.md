# i3

## Volume don't work

See
- https://askubuntu.com/a/1037477/651414
- https://askubuntu.com/a/948383/651414

```
pulseaudio --kill
pulseaudio --start
pulseaudio -k && sudo alsa force-reload
```
