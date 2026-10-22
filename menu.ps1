# ===== Fundo preto =====
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"

# ===== Aumenta a fonte (tamanho 28, pode mudar) =====
try {
    if (-not ([System.Management.Automation.PSTypeName]'ConsoleFont').Type) {
        Add-Type @"
using System;
using System.Runtime.InteropServices;
public class ConsoleFont {
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct CONSOLE_FONT_INFOEX {
        public int cbSize;
        public int nFont;
        public short X;
        public short Y;
        public int FontFamily;
        public int FontWeight;
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
        public string FaceName;
    }
    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern IntPtr GetStdHandle(int nStdHandle);
    [DllImport("kernel32.dll", SetLastError = true)]
    public static extern bool SetCurrentConsoleFontEx(IntPtr h, bool max, ref CONSOLE_FONT_INFOEX info);
    public static void SetSize(short size) {
        CONSOLE_FONT_INFOEX info = new CONSOLE_FONT_INFOEX();
        info.cbSize = Marshal.SizeOf(info);
        info.FaceName = "Consolas";
        info.FontFamily = 54;
        info.FontWeight = 700;
        info.Y = size;
        SetCurrentConsoleFontEx(GetStdHandle(-11), false, ref info);
    }
}
"@
    }
    [ConsoleFont]::SetSize(28)
} catch {}

# ===== Links =====
$instagram = "https://www.instagram.com/blackzadass/"
$tiktok    = "https://www.tiktok.com/@blackzadasss"
$discord   = "https://discord.gg/SNQVXYtES3"

do {
    Clear-Host
    Write-Host ""
    Write-Host "  ==============================" -ForegroundColor Cyan
    Write-Host "     B L A C K Z A D" -ForegroundColor Cyan
    Write-Host "     C O M M U N I T Y" -ForegroundColor Cyan
    Write-Host "  ==============================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   [1]  Instagram" -ForegroundColor Magenta
    Write-Host "   [2]  TikTok"    -ForegroundColor Yellow
    Write-Host "   [3]  Discord"   -ForegroundColor Blue
    Write-Host "   [4]  Sair"      -ForegroundColor Red
    Write-Host ""
    Write-Host "  ==============================" -ForegroundColor Cyan
    Write-Host ""

    $opcao = Read-Host "  Escolha uma opcao"

    switch ($opcao) {
        "1" { Start-Process $instagram }
        "2" { Start-Process $tiktok }
        "3" { Start-Process $discord }
        "4" { Write-Host "  Saindo..." -ForegroundColor Green }
        default {
            Write-Host "  Opcao invalida!" -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
} while ($opcao -ne "4")
