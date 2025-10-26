# abcde - A Better CD Encoder

1. Mount nfs share: `sudo mount -t nfs 192.168.0.28:/export/music /mnt/music`

2. Rip CD to FLAC using abcde:

```
abcde -o 'flac:-8' -G
```

3. Edit CDDB record: Enter Artist name and Album title when prompted

4. Tag & move to library with beets:

```
beet import ~/Music/Album
```

## Multi disc albums

For multi disc albums, use the `-W` option to specify the disc number:

```
abcde -o 'flac:-8' -G -W 1
```
