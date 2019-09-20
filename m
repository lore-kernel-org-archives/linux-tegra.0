From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] media: staging: tegra-vde: Fix build error
Date: Fri, 20 Sep 2019 21:32:51 +0200
Message-ID: <CAK8P3a2Lxv6Wz3jv0eeNc7mfvNzSvh37QEx51W39eUnYPsxaYw@mail.gmail.com>
References: <dc354ede-5963-cd7f-ee53-f3df3061d39a@gmail.com>
 <20190725024129.22664-1-yuehaibing@huawei.com> <dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, gregkh <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, driverdevel <devel@driverdev.osuosl.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 25, 2019 at 2:24 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 25.07.2019 5:41, YueHaibing пишет:
> > If IOMMU_SUPPORT is not set, and COMPILE_TEST is y,
> > IOMMU_IOVA may be set to m. So building will fails:
> >
> > drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
> > iommu.c:(.text+0x41): undefined reference to `alloc_iova'
> > iommu.c:(.text+0x56): undefined reference to `__free_iova'
> >
> > Select IOMMU_IOVA while COMPILE_TEST is set to fix this.

> > @@ -3,7 +3,7 @@ config TEGRA_VDE
> >       tristate "NVIDIA Tegra Video Decoder Engine driver"
> >       depends on ARCH_TEGRA || COMPILE_TEST
> >       select DMA_SHARED_BUFFER
> > -     select IOMMU_IOVA if IOMMU_SUPPORT
> > +     select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
> >       select SRAM
> >       help
> >           Say Y here to enable support for the NVIDIA Tegra video decoder
> >
>
> This results in missing the case of compile-testing !IOMMU_IOVA for the
> driver, but probably that's not a big deal.
>
> Acked-by: Dmitry Osipenko <digetx@gmail.com>

I don't know what happened here, but the patch from YueHaibing caused this
error for me, which is very much like the problem it was meant to fix:

drivers/gpu/host1x/dev.o: In function `host1x_probe':
dev.c:(.text+0x1734): undefined reference to `put_iova_domain'
dev.c:(.text+0x1744): undefined reference to `iova_cache_put'
drivers/gpu/host1x/dev.o: In function `host1x_remove':
dev.c:(.text+0x1894): undefined reference to `put_iova_domain'
dev.c:(.text+0x1898): undefined reference to `iova_cache_put'
drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
cdma.c:(.text+0x5d0): undefined reference to `alloc_iova'
cdma.c:(.text+0x61c): undefined reference to `__free_iova'
drivers/gpu/host1x/cdma.o: In function `host1x_cdma_deinit':
cdma.c:(.text+0x6c8): undefined reference to `free_iova'
drivers/gpu/host1x/job.o: In function `host1x_job_pin':
job.c:(.text+0x514): undefined reference to `alloc_iova'
job.c:(.text+0x528): undefined reference to `__free_iova'
drivers/gpu/host1x/job.o: In function `host1x_job_unpin':
job.c:(.text+0x5bc): undefined reference to `free_iova'

After reverthing commit 6b2265975239 ("media: staging:
tegra-vde: Fix build error"), I can no longer reproduce the
issue.

       Arnd
