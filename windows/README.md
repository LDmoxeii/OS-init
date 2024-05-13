1. 安装 [Windows Terminal](https://apps.microsoft.com/detail/9n0dx20hk701?hl=zh-cn&gl=US)

2. 执行 `$env:AZ_ENABLE=$false; Set-ExecutionPolicy RemoteSigned`

3. 执行 `. scoop-install.ps1 -PATH "$"`
    
4. 执行 `. init.ps1 -PATH "$"`

可能需要的步骤：

在使用 `scoop checkup` 后看到如下提示

```sh
WARN  Windows Defender may slow down or disrupt installs with realtime scanning.
  Consider running:
    sudo Add-MpPreference -ExclusionPath 'C:\Scoop'
  (Requires 'sudo' command. Run 'scoop install sudo' if you don't have it.)
WARN  Windows Defender may slow down or disrupt installs with realtime scanning.
  Consider running:
    sudo Add-MpPreference -ExclusionPath 'C:\Scoop\Global'
  (Requires 'sudo' command. Run 'scoop install sudo' if you don't have it.)
WARN  LongPaths support is not enabled.
You can enable it with running:
    Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
WARN  Found 3 potential problems.
```

其中有三个『潜在』问题，可以按照自己实际情况选择执行

```sh
# Windows Defender可能会因实时扫描而减慢或破坏安装（注意对应实际 Scoop 路径）
sudo Add-MpPreference -ExclusionPath 'C:\Scoop'
sudo Add-MpPreference -ExclusionPath 'C:\Scoop\Global'
# 长路径支持（建议开启）
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name
```