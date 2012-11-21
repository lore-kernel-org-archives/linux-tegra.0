From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 218/493] amba: remove use of __devinit
Date: Wed, 21 Nov 2012 11:56:56 +0000
Message-ID: <20121121115655.GH3290@n2100.arm.linux.org.uk>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu> <1353349642-3677-218-git-send-email-wfp5p@virginia.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353349642-3677-218-git-send-email-wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bill Pemberton <wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 19, 2012 at 01:22:47PM -0500, Bill Pemberton wrote:
> CONFIG_HOTPLUG is going away as an option so __devinit is no longer
> needed.
> 
> Signed-off-by: Bill Pemberton <wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> 

Nope, I don't speak for this driver; it's the Tegra people you want.

TEGRA SUPPORT
M:      Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
L:      linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Q:      http://patchwork.ozlabs.org/project/linux-tegra/list/
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
S:      Supported
F:      arch/arm/mach-tegra
F:      arch/arm/boot/dts/tegra*
F:      arch/arm/configs/tegra_defconfig

> ---
>  drivers/amba/tegra-ahb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
> index bd5de08..b7517ca 100644
> --- a/drivers/amba/tegra-ahb.c
> +++ b/drivers/amba/tegra-ahb.c
> @@ -241,7 +241,7 @@ static void tegra_ahb_gizmo_init(struct tegra_ahb *ahb)
>  	gizmo_writel(ahb, val, AHB_MEM_PREFETCH_CFG4);
>  }
>  
> -static int __devinit tegra_ahb_probe(struct platform_device *pdev)
> +static int tegra_ahb_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
>  	struct tegra_ahb *ahb;
> -- 
> 1.8.0
> 
