From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: add missing break to fuse initialization
 code
Date: Wed, 11 Dec 2013 17:09:06 -0800
Message-ID: <20131212010906.GB21856@quad.lixom.net>
References: <1386365462-17635-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386365462-17635-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 06, 2013 at 02:31:02PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add a missing break to the switch in tegra_init_fuse() which determines
> which SoC the code is running on. This prevents the Tegra30+ fuse
> handling code from running on Tegra20.
> 
> Fixes: 3bd1ae57f7bb ("ARM: tegra: add fuses as device randomness")
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: Add break to all cases
> ---
>  arch/arm/mach-tegra/fuse.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-tegra/fuse.c b/arch/arm/mach-tegra/fuse.c
> index 9a4e910c3796..3a9c1f1c219d 100644
> --- a/arch/arm/mach-tegra/fuse.c
> +++ b/arch/arm/mach-tegra/fuse.c
> @@ -198,10 +198,12 @@ void __init tegra_init_fuse(void)
>  	switch (tegra_chip_id) {
>  	case TEGRA20:
>  		tegra20_fuse_init_randomness();
> +		break;
>  	case TEGRA30:
>  	case TEGRA114:
>  	default:
>  		tegra30_fuse_init_randomness();
> +		break;
>  	}
>  
>  	pr_info("Tegra Revision: %s SKU: %d CPU Process: %d Core Process: %d\n",

Ah, yes, dropped previous version and applied this.


-Olof
