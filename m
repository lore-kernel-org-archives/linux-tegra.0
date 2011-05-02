From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: Tegra: dt: s/rootdelay/rootwait/ in cmdline
 args
Date: Mon, 2 May 2011 15:02:05 -0600
Message-ID: <20110502210205.GA10097@ponder.secretlab.ca>
References: <1304362231-21909-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1304362231-21909-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 02, 2011 at 12:50:29PM -0600, Stephen Warren wrote:
> rootwait is more robust than rootdelay for slow devices.
> 
> Suggested-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Squashed into 'arm/dt: full tegra devicetree support', thanks.

g.

> ---
> v2: New patch for v2 of series
> 
>  arch/arm/boot/dts/tegra-harmony.dts |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
> index e87c27c..7fe007b 100644
> --- a/arch/arm/boot/dts/tegra-harmony.dts
> +++ b/arch/arm/boot/dts/tegra-harmony.dts
> @@ -9,7 +9,7 @@
>  	interrupt-parent = <&intc>;
>  
>  	chosen {
> -		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootdelay=2";
> +		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootwait";
>  	};
>  
>  	memory {
> -- 
> 1.7.0.4
> 
