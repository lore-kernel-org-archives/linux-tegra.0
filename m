From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra-DRM: Tegra30: DMA mapping API (was: About dma mapping apis)
Date: Mon, 9 Jul 2012 17:28:28 +0200
Message-ID: <20120709.182828.1247752887335819184.hdoyu@nvidia.com>
References: <23B010BBA481A74B98487467C29BA57BF2366A1010@HKMAIL01.nvidia.com><20120706.092417.916278591811517036.hdoyu@nvidia.com><23B010BBA481A74B98487467C29BA57BF2366A1012@HKMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <23B010BBA481A74B98487467C29BA57BF2366A1012-Q4EWCATADntDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peer Chen <pchen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Emily Jiang <ejiang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mark, adding linux-tegra on Cc:.... 

Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Mon, 9 Jul 2012 14:13:13 +0200:

> > Hi Mark, Cc: Thierry & Ken,
> >
> > Can GEM allow DRM to use contigious memory? That could be easier.
> >
> > Otherwise, I think that you need to make drv->dev iommu'able before
> > calling DMA API if you want to use IOMMU. To make drv->dev iommu'able,
> > you need to call arm_iommu_create_mapping() and arm_iommu_attach_device().
> 
> Thank you. Yes, we need to call these functions otherwise iommu will not be enabled at all.
> So my question is:
> 1. in arm_iommu_create_mapping, we need to specify the base address
> of the iova. Is these an API which can get this base address? I
> mean, SMMU serves a lot of clients and maybe every client will
> specify a range of iova which it needs. So as the center point of
> these clients, does SMMU module has a function which can be used by
> client to get this base address?

The SMMU patch was sent but it depends on the following framework.

  [PATCH 0/5] IOMMU: Make IOMMU-API ready for GART-like hardware
    https://lkml.org/lkml/2012/1/19/170

> 2. I took a quick glance of tegra-smmu.c, I noticed that there is a
> dts property named dma-window, which it's value is: <0x0
> 0x40000000>. Does this means the iova which SMMU handles is from 0 -
> 1G? IIRC, SMMU handles 4G address space...

It tries to avoid overwrapping 1-1 iovirt-phys mapping, which is
necessary for some drivers right now.

> 3. Right now in my drm driver, arm_iommu_attach_device failed with
> an error code: -22(Invalid Argument). I think this is caused by
> these codes in function smmu_iommu_attach_dev:
> 
> map = (unsigned long)dev->platform_data;
>         if (!map)
>                 return -EINVAL;
> 
> So, does this mean the drm_device should have a "platform_data"(right now it is NULL so -EINVAL returned)? 
> I skimmed the codes of tegra-smmu.c, seems this "platform_data" has specific usage and should be composed in some rules.
> Could you explain a little bit about this?

You can skip that check with the following patch.

From 42a03ff88ed133db613389d2cc4c4ad33cd5d7e3 Mon Sep 17 00:00:00 2001
From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Tue, 28 Feb 2012 15:33:17 +0200
Subject: [PATCH 1/1] iommu/tegra: smmu: Enable all SWGRP by default

This should be revisited along with successors, which would
introduce different configurations.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/iommu/tegra-smmu.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index bf33c03..3bc5c91 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -38,6 +38,8 @@
 #include <mach/smmu.h>
 #include <mach/tegra_smmu.h>
 
+#define SKIP_SWGRP_CHECK /* FIXME: SWGRP should be passed from DT. */
+
 /* bitmap of the page sizes currently supported */
 #define SMMU_IOMMU_PGSIZES	(SZ_4K)
 
@@ -316,11 +318,15 @@ static int __smmu_client_set_hwgrp(struct smmu_client *c,
 		offs = HWGRP_ASID_REG(i);
 		val = smmu_read(smmu, offs);
 		if (on) {
+#if !defined(SKIP_SWGRP_CHECK)
 			if (WARN_ON(val & mask))
 				goto err_hw_busy;
+#endif
 			val |= mask;
 		} else {
+#if !defined(SKIP_SWGRP_CHECK)
 			WARN_ON((val & mask) == mask);
+#endif
 			val &= ~mask;
 		}
 		smmu_write(smmu, val, offs);
@@ -701,9 +707,15 @@ static int smmu_iommu_attach_dev(struct iommu_domain *domain,
 		return -ENOMEM;
 	client->dev = dev;
 	client->as = as;
+
+#ifdef SKIP_SWGRP_CHECK
+	/* Enable all SWGRP blindly by default */
+	map = (1 << HWGRP_COUNT) - 1;
+#else
 	map = (unsigned long)dev->platform_data;
 	if (!map)
 		return -EINVAL;
+#endif
 
 	err = smmu_client_enable_hwgrp(client, map);
 	if (err)
-- 
1.7.5.4
