$instagram = "https://www.instagram.com/blackzadass/"
$tiktok    = "https://www.tiktok.com/@blackzadasss"
$discord   = "https://discord.gg/SNQVXYtES3"

do {
    Clear-Host
    Write-Host "=============================="
    Write-Host "     BLACKZAD COMMUNITY" -ForegroundColor Cyan
    Write-Host "=============================="
    Write-Host "1 - Instagram"
    Write-Host "2 - TikTok"
    Write-Host "3 - Discord"
    Write-Host "4 - Sair"
    Write-Host "=============================="

    $opcao = Read-Host "Escolha uma opção"

    switch ($opcao) {
        "1" { Start-Process $instagram }
        "2" { Start-Process $tiktok }
        "3" { Start-Process $discord }
        "4" { Write-Host "Saindo..." }
        default {
            Write-Host "Opção inválida!"
            Start-Sleep -Seconds 1
        }
    }
} while ($opcao -ne "4")
