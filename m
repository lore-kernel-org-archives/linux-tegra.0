From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v6 03/15] soc/tegra: Add ram code reader helper
Date: Mon, 2 Mar 2015 17:46:49 +0900
Message-ID: <CAAVeFuKLp=rG5oQxg7CjfZk9h2hA5kM0OoxKhyeLxAUcaB-2Eg@mail.gmail.com>
References: <1423750042-6535-1-git-send-email-tomeu.vizoso@collabora.com> <1423750042-6535-4-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423750042-6535-4-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, Mikko Perttunen <mperttunen@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 12, 2015 at 11:06 PM, Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>
> Needed for the EMC and MC drivers to know what timings from the DT to use.
>
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>
> ---
>
> v4: Replace magic number with PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT
> ---
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 19 +++++++++++++++++++
>  include/soc/tegra/fuse.h               |  1 +
>  2 files changed, 20 insertions(+)
>
> diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> index 3bf5aba..dc96a62 100644
> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> @@ -28,8 +28,13 @@
>  #define APBMISC_SIZE   0x64
>  #define FUSE_SKU_INFO  0x10
>
> +#define PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT     4
> +#define PMC_STRAPPING_OPT_A_RAM_CODE_MASK_LONG (0xf << PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT)
> +#define PMC_STRAPPING_OPT_A_RAM_CODE_MASK_SHORT        (0x3 << PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT)

I think you are slightly over 80 chars here.

> +
>  static void __iomem *apbmisc_base;
>  static void __iomem *strapping_base;
> +static bool          long_ram_code;
>
>  u32 tegra_read_chipid(void)
>  {
> @@ -54,6 +59,18 @@ u32 tegra_read_straps(void)
>                 return 0;
>  }
>
> +u32 tegra_read_ram_code(void)
> +{
> +       u32 straps = tegra_read_straps();
> +
> +       if (long_ram_code)
> +               straps &= PMC_STRAPPING_OPT_A_RAM_CODE_MASK_LONG;
> +       else
> +               straps &= PMC_STRAPPING_OPT_A_RAM_CODE_MASK_SHORT;
> +
> +       return straps >> PMC_STRAPPING_OPT_A_RAM_CODE_SHIFT;
> +}
> +
>  static const struct of_device_id apbmisc_match[] __initconst = {
>         { .compatible = "nvidia,tegra20-apbmisc", },
>         {},
> @@ -112,4 +129,6 @@ void __init tegra_init_apbmisc(void)
>         strapping_base = of_iomap(np, 1);
>         if (!strapping_base)
>                 pr_err("ioremap tegra strapping_base failed\n");
> +
> +       long_ram_code = of_property_read_bool(np, "nvidia,long-ram-code");

Is this long-ram property chip-dependent? If so, couldn't we just use
the chip ID or matched compatible string to decide whether the RAM
code length, instead of having a dedicated property for it?
