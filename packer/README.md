# hatak Packer build

## init

```shell
packer init .
```

## build

NOTE: https://github.com/hashicorp/packer-plugin-parallels/issues/36#issuecomment-1279810302

```shell
PYTHONPATH=/Library/Frameworks/ParallelsVirtualizationSDK.framework/Versions/10/Libraries/Python/3.7 packer build .
```
