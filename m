From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/9] soc: samsung: Convert exynos-chipid driver to use
 the regmap API
Date: Wed, 21 Aug 2019 14:16:44 +0200
Message-ID: <CAJKOXPdh9eHrAuCxHkQBvJMqEnUCeU2xwkK=9yyiJ6BuTLJ+_A@mail.gmail.com>
References: <20190813150827.31972-1-s.nawrocki@samsung.com>
 <CGME20190813150852eucas1p2be4c0ab5ec2c079e3daf1af24283b27c@eucas1p2.samsung.com>
 <20190813150827.31972-3-s.nawrocki@samsung.com> <b5359603-b337-dcd8-b025-ca7dff5f4a06@nvidia.com>
 <CAJKOXPf597CMx=M2JmSTWe2GzBfcHFefgzSJbJ+njZGp-WfR1A@mail.gmail.com>
 <1e428c8e-f4b5-0810-77f9-2c899c040fc7@kernel.org> <72eea1ea-2433-2f76-6265-5851554e845d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <72eea1ea-2433-2f76-6265-5851554e845d@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, linux-tegra <linux-tegra@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

On Wed, 21 Aug 2019 at 13:51, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> >>> Following this change, I am now seeing the above error on our Tegra
> >>> boards where this driver is enabled. This is triggering a kernel
> >>> warnings test we have to fail. Hence, I don't think that you can remove
> >>> the compatible node test here, unless you have a better way to determine
> >>> if this is a samsung device.
> >>
> >> Right, this is really wrong... I missed that it is not a probe but
> >> early init. And this init will be called on every board... Probably it
> >> should be converted to a regular driver.
>
> Early initialization is needed for SoC driver to be used from within
> arch/arm/mach-exynos/ and _initcall() usage is the usual way for SoC
> drivers to be initialized:
>
> drivers/soc/amlogic/meson-gx-socinfo.c
> drivers/soc/amlogic/meson-mx-socinfo.c
> drivers/soc/atmel/soc.c
> drivers/soc/bcm/brcmstb/common.c
> drivers/soc/imx/soc-imx-scu.c
> drivers/soc/imx/soc-imx8.c
> drivers/soc/renesas/renesas-soc.c
> drivers/soc/tegra/fuse/fuse-tegra.c
> drivers/soc/ux500/ux500-soc-id.c
> drivers/soc/versatile/soc-integrator.c
> drivers/soc/versatile/soc-integrator.c
>
> The only SoC drivers that are regular drivers are:
>
> drivers/soc/fsl/guts.c
> drivers/soc/versatile/soc-realview.c

Thanks for pointing it out.

Indeed, the initcall was needed in your set of patches here:
https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=43565&state=*
but this work was not continued here. Maybe it will be later
resubmitted... maybe not... who knows? Therefore I would prefer proper
solution for current case (driver), unless patches for mach are being
brought back to life now.

> > I'm also inclined to have it converted to a regular driver.  We already
> > have "exynos-asv" driver matching on the chipid node (patch 3/9).
> > The ASV patches will not be merged soon anyway, all this needs some more
> > thought. Krzysztof, can we abandon the chipid patches for now? Your
>
> chipid driver is good and useful on its own. The preferred solution
> IMHO would be to just revert "soc: samsung: Convert exynos-chipid
> driver to use the regmap API" commit.

I queued the chipid as a dependency for ASV but ASV requires the
regmap. What would be left after reverting the regmap part? Simple
unused printk driver? No need for such. If reverting, then let's drop
entire driver and rework it offline.

Best regards,
Krzysztof
