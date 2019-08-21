From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 2/9] soc: samsung: Convert exynos-chipid driver to
 use the regmap API
Date: Wed, 21 Aug 2019 15:31:25 +0200
Message-ID: <d9a20ae5-4bdf-cb05-d68f-a7631517c87c@samsung.com>
References: <20190813150827.31972-1-s.nawrocki@samsung.com>
        <CGME20190813150852eucas1p2be4c0ab5ec2c079e3daf1af24283b27c@eucas1p2.samsung.com>
        <20190813150827.31972-3-s.nawrocki@samsung.com>
        <b5359603-b337-dcd8-b025-ca7dff5f4a06@nvidia.com>
        <CAJKOXPf597CMx=M2JmSTWe2GzBfcHFefgzSJbJ+njZGp-WfR1A@mail.gmail.com>
        <1e428c8e-f4b5-0810-77f9-2c899c040fc7@kernel.org>
        <72eea1ea-2433-2f76-6265-5851554e845d@samsung.com>
        <CAJKOXPdh9eHrAuCxHkQBvJMqEnUCeU2xwkK=9yyiJ6BuTLJ+_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdh9eHrAuCxHkQBvJMqEnUCeU2xwkK=9yyiJ6BuTLJ+_A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, linux-tegra <linux-tegra@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org


On 8/21/19 2:16 PM, Krzysztof Kozlowski wrote:
> On Wed, 21 Aug 2019 at 13:51, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
>>>>> Following this change, I am now seeing the above error on our Tegra
>>>>> boards where this driver is enabled. This is triggering a kernel
>>>>> warnings test we have to fail. Hence, I don't think that you can remove
>>>>> the compatible node test here, unless you have a better way to determine
>>>>> if this is a samsung device.
>>>>
>>>> Right, this is really wrong... I missed that it is not a probe but
>>>> early init. And this init will be called on every board... Probably it
>>>> should be converted to a regular driver.
>>
>> Early initialization is needed for SoC driver to be used from within
>> arch/arm/mach-exynos/ and _initcall() usage is the usual way for SoC
>> drivers to be initialized:
>>
>> drivers/soc/amlogic/meson-gx-socinfo.c
>> drivers/soc/amlogic/meson-mx-socinfo.c
>> drivers/soc/atmel/soc.c
>> drivers/soc/bcm/brcmstb/common.c
>> drivers/soc/imx/soc-imx-scu.c
>> drivers/soc/imx/soc-imx8.c
>> drivers/soc/renesas/renesas-soc.c
>> drivers/soc/tegra/fuse/fuse-tegra.c
>> drivers/soc/ux500/ux500-soc-id.c
>> drivers/soc/versatile/soc-integrator.c
>> drivers/soc/versatile/soc-integrator.c
>>
>> The only SoC drivers that are regular drivers are:
>>
>> drivers/soc/fsl/guts.c
>> drivers/soc/versatile/soc-realview.c
> 
> Thanks for pointing it out.
> 
> Indeed, the initcall was needed in your set of patches here:
> https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=43565&state=*
> but this work was not continued here. Maybe it will be later
> resubmitted... maybe not... who knows? Therefore I would prefer proper

The work got delayed mainly because of the request for the formal
audit of each usage vs cache coherency. Since it is rather small
cleanup and such audit is time consuming it became a low priority.

> solution for current case (driver), unless patches for mach are being
> brought back to life now.
> 
>>> I'm also inclined to have it converted to a regular driver.  We already
>>> have "exynos-asv" driver matching on the chipid node (patch 3/9).
>>> The ASV patches will not be merged soon anyway, all this needs some more
>>> thought. Krzysztof, can we abandon the chipid patches for now? Your
>>
>> chipid driver is good and useful on its own. The preferred solution
>> IMHO would be to just revert "soc: samsung: Convert exynos-chipid
>> driver to use the regmap API" commit.

Or just fix it by re-adding removed Exynos chipid compatible checking:

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 006a95feb618..d9912bd52479 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -55,6 +55,11 @@ int __init exynos_chipid_early_init(void)
        u32 revision;
        int ret;
 
+       /* look up for chipid node */
+       np = of_find_compatible_node(NULL, NULL, "samsung,exynos4210-chipid");
+       if (!np)
+               return -ENODEV;
+
        regmap = syscon_regmap_lookup_by_compatible("samsung,exynos4210-chipid");
        if (IS_ERR(regmap)) {
                pr_err("Failed to get CHIPID regmap\n");

> I queued the chipid as a dependency for ASV but ASV requires the
> regmap. What would be left after reverting the regmap part? Simple
> unused printk driver? No need for such. If reverting, then let's drop

It provides sysfs information about SoC/platform and is useful on its
own (for debugging, reporting etc. purposes). Maybe not terrible useful
but on OTOH the driver is only ~100 LOC.

> entire driver and rework it offline.
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
