From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH 03/10] iommu/omap: convert to SPDX license tags
Date: Fri, 14 Jun 2019 00:55:02 +0800
Message-ID: <CAEExFWuM+oMUKf440myr0GHAnatdzaxr=0ibFDGVXDHs6J1bzA@mail.gmail.com>
References: <20190613162703.986-1-tiny.windzz@gmail.com> <20190613162703.986-3-tiny.windzz@gmail.com>
 <ac67e363-70cf-af64-d634-c3b0b6d408fa@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ac67e363-70cf-af64-d634-c3b0b6d408fa@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suman Anna <s-anna@ti.com>
Cc: "joro@8bytes.org" <joro@8bytes.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "kgene@kernel.org" <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "agross@kernel.org" <agross@kernel.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "robdclark@gmail.com" <robdclark@gmail.com>, "heiko@sntech.de" <heiko@sntech.de>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradea
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 14, 2019 at 12:39 AM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Yangtao,
>
> On 6/13/19 11:26 AM, Yangtao Li wrote:
> > Updates license to use SPDX-License-Identifier.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
>
> Thanks for the patch. Can you also update another related file
> while at this. Will leave it to Joerg if he prefers it as a separate
> patch, or folded into this patch.
>
> include/linux/platform_data/iommu-omap.h
>

Done.

Yangtao

> Acked-by: Suman Anna <s-anna@ti.com>
>
> regards
> Suman
>
> > ---
> >  drivers/iommu/omap-iommu-debug.c | 5 +----
> >  drivers/iommu/omap-iommu.c       | 5 +----
> >  drivers/iommu/omap-iommu.h       | 5 +----
> >  drivers/iommu/omap-iopgtable.h   | 5 +----
> >  4 files changed, 4 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/iommu/omap-iommu-debug.c b/drivers/iommu/omap-iommu-debug.c
> > index 4abc0ef522a8..55ec67a45101 100644
> > --- a/drivers/iommu/omap-iommu-debug.c
> > +++ b/drivers/iommu/omap-iommu-debug.c
> > @@ -1,13 +1,10 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >  /*
> >   * omap iommu: debugfs interface
> >   *
> >   * Copyright (C) 2008-2009 Nokia Corporation
> >   *
> >   * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License version 2 as
> > - * published by the Free Software Foundation.
> >   */
> >
> >  #include <linux/err.h>
> > diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> > index d2fb347aa4ff..e6442876913f 100644
> > --- a/drivers/iommu/omap-iommu.c
> > +++ b/drivers/iommu/omap-iommu.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >  /*
> >   * omap iommu: tlb and pagetable primitives
> >   *
> > @@ -6,10 +7,6 @@
> >   *
> >   * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>,
> >   *           Paul Mundt and Toshihiro Kobayashi
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License version 2 as
> > - * published by the Free Software Foundation.
> >   */
> >
> >  #include <linux/dma-mapping.h>
> > diff --git a/drivers/iommu/omap-iommu.h b/drivers/iommu/omap-iommu.h
> > index 1703159ef5af..5256e17d86a7 100644
> > --- a/drivers/iommu/omap-iommu.h
> > +++ b/drivers/iommu/omap-iommu.h
> > @@ -1,13 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> >  /*
> >   * omap iommu: main structures
> >   *
> >   * Copyright (C) 2008-2009 Nokia Corporation
> >   *
> >   * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License version 2 as
> > - * published by the Free Software Foundation.
> >   */
> >
> >  #ifndef _OMAP_IOMMU_H
> > diff --git a/drivers/iommu/omap-iopgtable.h b/drivers/iommu/omap-iopgtable.h
> > index 01a315227bf0..871c2a38f453 100644
> > --- a/drivers/iommu/omap-iopgtable.h
> > +++ b/drivers/iommu/omap-iopgtable.h
> > @@ -1,13 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> >  /*
> >   * omap iommu: pagetable definitions
> >   *
> >   * Copyright (C) 2008-2010 Nokia Corporation
> >   *
> >   * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License version 2 as
> > - * published by the Free Software Foundation.
> >   */
> >
> >  #ifndef _OMAP_IOPGTABLE_H
> >
>
