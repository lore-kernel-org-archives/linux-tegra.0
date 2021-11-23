Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F87C4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Nov 2021 14:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235554AbhKWOOG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Nov 2021 09:14:06 -0500
Received: from foss.arm.com ([217.140.110.172]:53506 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233719AbhKWOOD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Nov 2021 09:14:03 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0092F1063;
        Tue, 23 Nov 2021 06:10:55 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 655F93F66F;
        Tue, 23 Nov 2021 06:10:53 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     joro@8bytes.org, will@kernel.org
Cc:     iommu@lists.linux-foundation.org, suravee.suthikulpanit@amd.com,
        baolu.lu@linux.intel.com, willy@infradead.org,
        linux-kernel@vger.kernel.org, john.garry@huawei.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/9] gpu: host1x: Add missing DMA API include
Date:   Tue, 23 Nov 2021 14:10:36 +0000
Message-Id: <d7bc49bfda25a7ea19dc574f8e212cd9e42bf2e2.1637671820.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1637671820.git.robin.murphy@arm.com>
References: <cover.1637671820.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Host1x seems to be relying on picking up dma-mapping.h transitively from
iova.h, which has no reason to include it in the first place. Fix the
former issue before we totally break things by fixing the latter one.

CC: Thierry Reding <thierry.reding@gmail.com>
CC: Mikko Perttunen <mperttunen@nvidia.com>
CC: dri-devel@lists.freedesktop.org
CC: linux-tegra@vger.kernel.org
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

Feel free to pick this into drm-misc-next or drm-misc-fixes straight
away if that suits - it's only to avoid a build breakage once the rest
of the series gets queued.

Robin.

 drivers/gpu/host1x/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 218e3718fd68..881fad5c3307 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/dma-mapping.h>
 #include <linux/host1x.h>
 #include <linux/of.h>
 #include <linux/seq_file.h>
-- 
2.28.0.dirty

