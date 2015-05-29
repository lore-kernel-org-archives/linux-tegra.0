From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH/RFC 1/2] ARM: multi_v7_defconfig: Make drm support modular
Date: Fri, 29 May 2015 17:41:34 +0200
Message-ID: <2568731.dqdEiMuDro@wuerfel>
References: <1432905926-31606-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432905926-31606-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 29 May 2015 15:25:25 Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> 
> Make drm support modular to reduce kernel size (-620 KiB):
> 
>        text    data     bss     dec     hex   filename
>     12211122 1392076  338520 13941718  d4bbd6 vmlinux.before
>     11581470 1387196  338264 13306930  cb0c32 vmlinux.after
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> ---
> Slightly controversial:
>   - Does anyone need drm for boot testing?

Only the tegra driver is affected, so let's ask the tegra
maintainers.

	Arnd

> 
>  arch/arm/configs/multi_v7_defconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 40ca1ab29a2e350f..9b4e33d5b15e340f 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -426,15 +426,17 @@ CONFIG_VIDEO_RENESAS_VSP1=m
>  # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
>  CONFIG_VIDEO_ADV7180=m
>  CONFIG_VIDEO_ML86V7667=m
> -CONFIG_DRM=y
> +CONFIG_TEGRA_HOST1X=y
> +CONFIG_DRM=m
>  CONFIG_DRM_PTN3460=m
>  CONFIG_DRM_PS8622=m
>  CONFIG_DRM_EXYNOS=m
>  CONFIG_DRM_EXYNOS_FIMD=y
>  CONFIG_DRM_EXYNOS_HDMI=y
>  CONFIG_DRM_RCAR_DU=m
> -CONFIG_DRM_TEGRA=y
> -CONFIG_DRM_PANEL_SIMPLE=y
> +CONFIG_DRM_TEGRA=m
> +CONFIG_DRM_PANEL_SIMPLE=m
> +CONFIG_FB=y
>  CONFIG_FB_ARMCLCD=y
>  CONFIG_FB_WM8505=y
>  CONFIG_FB_SH_MOBILE_LCDC=y
> 
