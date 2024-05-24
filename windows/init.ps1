iwr -useb get.scoop.sh | iex

scoop update
scoop bucket add versions
scoop bucket add extras
scoop bucket add nonportable
scoop bucket add java
scoop bucket add JetBrains
scoop bucket add nerd-fonts       
scoop bucket add dorado https://github.com/chawyehsu/dorado

scoop install `
    main/7zip main/git main/dark main/innounp main/lessmsi main/oh-my-posh main/sudo `
    main/pwsh main/zstd `
    extras/archwsl extras/DiskGenius extras/dismplusplus extras/Everything extras/clash-verge-rev`
    extras/geekuninstaller extras/obsidian extras/posh-git extras/wechat extras/vscode `
    nerd-fonts/JetBrainsMono-NF-Mono

if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force } 

@"
# 导入 posh-git 模块
Import-Module posh-git

# 设置 oh-my-posh Shell 提示主题
oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\ys.omp.json" | Invoke-Expression

# 设置 Ctrl + Z 为撤销
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo

# 设置 Tab 键菜单补全
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# 使用 ls 和 ll 查看目录
function ListDirectory {
    (Get-ChildItem).Name
    Write-Host("")
}
Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ll -Value Get-ChildItem

# 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward

# 设置向下键为前向搜索历史纪录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# 清除 scoop 缓存和软件旧版本 | 别名: scoopwipe
function scoopwipe{sudo scoop cleanup -gk * && sudo scoop cleanup * -g && scoop cache rm * && scoop cleanup * && Write-Host "Scoop 缓存清理完成啦~👌" }
"@ | Out-File -FilePath $PROFILE -Encoding utf8

. $PROFILE