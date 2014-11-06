From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 03/13] soc/tegra: Add ram code reader helper
Date: Thu, 6 Nov 2014 14:25:02 +0900
Message-ID: <545B062E.2040508@nvidia.com>
References: <1414599796-30597-1-git-send-email-tomeu.vizoso@collabora.com> <1414599796-30597-4-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414599796-30597-4-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/30/2014 01:22 AM, Tomeu Vizoso wrote:
> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Needed for the EMC and MC drivers to know what timings from the DT to use.
>
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>   drivers/soc/tegra/fuse/tegra-apbmisc.c | 19 +++++++++++++++++++
>   include/soc/tegra/fuse.h               |  1 +
>   2 files changed, 20 insertions(+)
>
> diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> index 3bf5aba..e580892 100644
> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> @@ -28,8 +28,13 @@
>   #define APBMISC_SIZE	0x64
>   #define FUSE_SKU_INFO	0x10
>
> +#define PMC_STRAPPING_OPT_A_RAM_CODE_MASK_LONG	(0xf << 4)
> +#define PMC_STRAPPING_OPT_A_RAM_CODE_MASK_SHORT	(0x3 << 4)

Shouldn't these two shifts also use PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT 
defined right after?

> +#define PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT	4
> +
>   static void __iomem *apbmisc_base;
>   static void __iomem *strapping_base;
> +static bool          long_ram_code;
>
>   u32 tegra_read_chipid(void)
>   {
> @@ -54,6 +59,18 @@ u32 tegra_read_straps(void)
>   		return 0;
>   }
>
> +u32 tegra_read_ram_code(void)
> +{
> +	u32 straps = tegra_read_straps();
> +
> +	if (long_ram_code)
> +		straps &= PMC_STRAPPING_OPT_A_RAM_CODE_MASK_LONG;
> +	else
> +		straps &= PMC_STRAPPING_OPT_A_RAM_CODE_MASK_SHORT;
> +
> +	return straps >> PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT;

... this is what triggered my remark above, since it seems like you want 
to return the ram_code field.

> +}
> +
>   static const struct of_device_id apbmisc_match[] __initconst = {
>   	{ .compatible = "nvidia,tegra20-apbmisc", },
>   	{},
> @@ -112,4 +129,6 @@ void __init tegra_init_apbmisc(void)
>   	strapping_base = of_iomap(np, 1);
>   	if (!strapping_base)
>   		pr_err("ioremap tegra strapping_base failed\n");
> +
> +	long_ram_code = of_property_read_bool(np, "nvidia,long-ram-code");
>   }
> diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
> index 8e12494..4ad6fd9 100644
> --- a/include/soc/tegra/fuse.h
> +++ b/include/soc/tegra/fuse.h
> @@ -55,6 +55,7 @@ struct tegra_sku_info {
>   };
>
>   u32 tegra_read_straps(void);
> +u32 tegra_read_ram_code(void);
>   u32 tegra_read_chipid(void);
>   int tegra_fuse_readl(unsigned long offset, u32 *value);
>
>
