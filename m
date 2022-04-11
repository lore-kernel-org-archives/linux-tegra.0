Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D1BC433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Apr 2022 13:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234985AbiDKNtS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Apr 2022 09:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346738AbiDKNtH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Apr 2022 09:49:07 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A62B3BBDB
        for <linux-tegra@vger.kernel.org>; Mon, 11 Apr 2022 06:46:47 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A365E1570;
        Mon, 11 Apr 2022 06:46:47 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC3083F73B;
        Mon, 11 Apr 2022 06:46:46 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        dmitry.osipenko@collabora.com
Subject: [PATCH v2] drm/tegra: Stop using iommu_present()
Date:   Mon, 11 Apr 2022 14:46:43 +0100
Message-Id: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Refactor the confusing logic to make it both clearer and more robust. If
the host1x parent device does have an IOMMU domain then iommu_present()
is redundantly true, while otherwise for the 32-bit DMA mask case it
still doesn't say whether the IOMMU driver actually knows about the DRM
device or not.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: Fix logic for older SoCs and clarify.

 drivers/gpu/drm/tegra/drm.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 9464f522e257..4f2bdab31064 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1092,6 +1092,19 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
 	struct iommu_domain *domain;
 
+	/* For starters, this is moot if no IOMMU is available */
+	if (!device_iommu_mapped(&dev->dev))
+		return false;
+
+	/*
+	 * Tegra20 and Tegra30 don't support addressing memory beyond the
+	 * 32-bit boundary, so the regular GATHER opcodes will always be
+	 * sufficient and whether or not the host1x is attached to an IOMMU
+	 * doesn't matter.
+	 */
+	if (host1x_get_dma_mask(host1x) <= DMA_BIT_MASK(32))
+		return true;
+
 	/*
 	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
 	 * likely to be allocated beyond the 32-bit boundary if sufficient
@@ -1122,14 +1135,13 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	domain = iommu_get_domain_for_dev(dev->dev.parent);
 
 	/*
-	 * Tegra20 and Tegra30 don't support addressing memory beyond the
-	 * 32-bit boundary, so the regular GATHER opcodes will always be
-	 * sufficient and whether or not the host1x is attached to an IOMMU
-	 * doesn't matter.
+	 * At the moment, the exact type of domain doesn't actually matter.
+	 * Only for 64-bit kernels might this be a managed DMA API domain, and
+	 * then only on newer SoCs using arm-smmu, since tegra-smmu doesn't
+	 * support default domains at all, and since those SoCs are the same
+	 * ones with extended GATHER support, even if it's a passthrough domain
+	 * it can still work out OK.
 	 */
-	if (!domain && host1x_get_dma_mask(host1x) <= DMA_BIT_MASK(32))
-		return true;
-
 	return domain != NULL;
 }
 
@@ -1149,7 +1161,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto put;
 	}
 
-	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
+	if (host1x_drm_wants_iommu(dev)) {
 		tegra->domain = iommu_domain_alloc(&platform_bus_type);
 		if (!tegra->domain) {
 			err = -ENOMEM;
-- 
2.28.0.dirty

