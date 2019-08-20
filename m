From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 2/9] soc: samsung: Convert exynos-chipid driver to use
 the regmap API
Date: Tue, 20 Aug 2019 20:24:23 +0100
Message-ID: <b5359603-b337-dcd8-b025-ca7dff5f4a06@nvidia.com>
References: <20190813150827.31972-1-s.nawrocki@samsung.com>
 <CGME20190813150852eucas1p2be4c0ab5ec2c079e3daf1af24283b27c@eucas1p2.samsung.com>
 <20190813150827.31972-3-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813150827.31972-3-s.nawrocki@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, krzk@kernel.org
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 13/08/2019 16:08, Sylwester Nawrocki wrote:
> Convert the driver to use regmap API in order to allow other
> drivers, like ASV, to access the CHIPID registers.
> 
> This patch adds definition of selected CHIPID register offsets
> and register bit fields for Exynos5422 SoC.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v2:
>  - s/_EXYNOS_ASV_H/__LINU_SOC_EXYNOS_ASV_H,
>  - removed __func__ from error log,
>  - removed unneeded <linux/of_address.h> header inclusion.
> 
> Changes since v1 (RFC):
>  - new patch
> ---
>  drivers/soc/samsung/exynos-chipid.c       | 34 ++++++---------
>  include/linux/soc/samsung/exynos-chipid.h | 52 +++++++++++++++++++++++
>  2 files changed, 65 insertions(+), 21 deletions(-)
>  create mode 100644 include/linux/soc/samsung/exynos-chipid.h
> 
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index bcf691f2b650..006a95feb618 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -9,16 +9,13 @@
>   */
>  
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
> +#include <linux/regmap.h>
>  #include <linux/slab.h>
> +#include <linux/soc/samsung/exynos-chipid.h>
>  #include <linux/sys_soc.h>
>  
> -#define EXYNOS_SUBREV_MASK	(0xF << 4)
> -#define EXYNOS_MAINREV_MASK	(0xF << 0)
> -#define EXYNOS_REV_MASK		(EXYNOS_SUBREV_MASK | EXYNOS_MAINREV_MASK)
> -#define EXYNOS_MASK		0xFFFFF000
> -
>  static const struct exynos_soc_id {
>  	const char *name;
>  	unsigned int id;
> @@ -51,29 +48,24 @@ static const char * __init product_id_to_soc_id(unsigned int product_id)
>  int __init exynos_chipid_early_init(void)
>  {
>  	struct soc_device_attribute *soc_dev_attr;
> -	void __iomem *exynos_chipid_base;
>  	struct soc_device *soc_dev;
>  	struct device_node *root;
> -	struct device_node *np;
> +	struct regmap *regmap;
>  	u32 product_id;
>  	u32 revision;
> +	int ret;
>  
> -	/* look up for chipid node */
> -	np = of_find_compatible_node(NULL, NULL, "samsung,exynos4210-chipid");
> -	if (!np)
> -		return -ENODEV;
> -
> -	exynos_chipid_base = of_iomap(np, 0);
> -	of_node_put(np);
> -
> -	if (!exynos_chipid_base) {
> -		pr_err("Failed to map SoC chipid\n");
> -		return -ENXIO;
> +	regmap = syscon_regmap_lookup_by_compatible("samsung,exynos4210-chipid");
> +	if (IS_ERR(regmap)) {
> +		pr_err("Failed to get CHIPID regmap\n");
> +		return PTR_ERR(regmap);
>  	}

Following this change, I am now seeing the above error on our Tegra
boards where this driver is enabled. This is triggering a kernel
warnings test we have to fail. Hence, I don't think that you can remove
the compatible node test here, unless you have a better way to determine
if this is a samsung device.

Cheers
Jon

-- 
nvpublic
