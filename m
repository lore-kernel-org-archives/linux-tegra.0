From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: iommu: tegra/common: Initial support for IOVMM
 driver
Date: Mon, 21 Nov 2011 09:11:01 +0100
Message-ID: <20111121.101101.272842631528669512.hdoyu@nvidia.com>
References: <1321527667-12923-1-git-send-email-hdoyu@nvidia.com><1321527667-12923-2-git-send-email-hdoyu@nvidia.com><20111117203202.GB20889@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111117203202.GB20889-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Hiro Sugawara <hsugawara-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: iommu: tegra/common: Initial support for IOVMM driver
Date: Thu, 17 Nov 2011 21:32:02 +0100
Message-ID: <20111117203202.GB20889-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>

> * PGP Signed by an unknown key
> 
> I'm not very knowledgeable about IOMMUs in general, so my comments are more
> about general style.

Thank you for your review. Mostly I'll take them in the next version
of patchset.

> * hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote:
> > From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > This is the tegra specific IOMMU framework, independent of H/W. H/W
> 
> You should keep the spelling of "Tegra" consistent.
> 
> > dependent modules are to be registered to this framework so that this
> > can support different IOMMU H/Ws among Tegra generations, Tegra2/GART,
> > and Tegra3/SMMU H/Ws.
> >
> > Most of this part could be replaced with a generic IOMMU
> > framework. This is expected to ease finding similarities with
> > different platforms, with the intention of solving problems once in a
> > generic framework which everyone can use.
> >
> > Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Hiro Sugawara <hsugawara-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Cc: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/mach-tegra/include/mach/iovmm.h |  283 +++++++++
> >  drivers/iommu/Kconfig                    |    6 +
> >  drivers/iommu/Makefile                   |    1 +
> >  drivers/iommu/tegra-iovmm.c              |  936 ++++++++++++++++++++++++++++++
> >  4 files changed, 1226 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm/mach-tegra/include/mach/iovmm.h
> >  create mode 100644 drivers/iommu/tegra-iovmm.c
> >
> > diff --git a/arch/arm/mach-tegra/include/mach/iovmm.h b/arch/arm/mach-tegra/include/mach/iovmm.h
> > new file mode 100644
> > index 0000000..6fd0bb6
> > --- /dev/null
> > +++ b/arch/arm/mach-tegra/include/mach/iovmm.h
> > @@ -0,0 +1,283 @@
> > +/*
> > + * Copyright (c) 2010-2011, NVIDIA Corporation.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed i the hope that it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along
> > + * with this program; if not, write to the Free Software Foundation, Inc.,
> > + * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> > + */
> > +
> > +#include <linux/list.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/rbtree.h>
> > +#include <linux/rwsem.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/types.h>
> > +
> > +#ifndef _MACH_TEGRA_IOVMM_H_
> > +#define _MACH_TEGRA_IOVMM_H_
> > +
> > +typedef u32 tegra_iovmm_addr_t;
> > +
> > +struct tegra_iovmm_device_ops;
> > +
> > +/* each I/O virtual memory manager unit should register a device with
> > + * the iovmm system
> > + */
> 
> Generally, multi-line comments have the starting /* and ending */ on separate
> lines. Also since this API is public it may be better to document it using
> kerneldoc.

I'll leave this kerneldoc out for a while since those public API may
be replaced with geneic IOMMU ones.
