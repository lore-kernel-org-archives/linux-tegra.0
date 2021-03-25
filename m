Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6488FC433E4
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36AE561A2C
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhCYND6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 09:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhCYNDl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 09:03:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DBDC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:41 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id y124-20020a1c32820000b029010c93864955so3045379wmy.5
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZoqNF/gGuA5Gs5uX5f4xa4y0Y8C4l2BjL01vShT4it8=;
        b=QwoqXo0fAen4mOpUNFdvOn00l3Vk0BmZyAZv2vpkF3MoHfDiCNjDTSyLjdCASjc6fu
         KQBv3+UG2uEW+PTZXD5fwm8w0R5Wvr7bWO3N6k/mclBcOy/5OTwomhoRRIMjBwdDpwOK
         8WlzCefY2C/j7B+IB/Rh9yGOMQoLzFenu5RvJsEdZKCY4Uj+6kU0ZpLO0t1w1b66yUpH
         S+S7Urc7dfNCRAXOPKzXZsDKr1pEtP3Uia/jMr/sTWNp908s5lxpq8qUAI+8qqWmoAhE
         TppwuYaeTL9zXh2cZXL/rEQFIhXooygfDDr/r9H3jX3JVrsnTY0P7prJR+jaixH4tSCL
         A66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZoqNF/gGuA5Gs5uX5f4xa4y0Y8C4l2BjL01vShT4it8=;
        b=U3AtvtuhAklr7S/uQ0/KxRVuMeUTNnFKKaP9BVztKmS1jaXrBcdSsfV8STEwudVvU2
         JvWhN0NUXXmu0ZWKcKysejI9SlvoG5DOcwLqveegcnqKuibTOmWMcSAHJbxJbviPVCyC
         cn17OjkU5dDPO1PWFQpIGCQHHqCWRQtNCIphEBY6zUfBi6qF5H097u24V/ySguBQsQwq
         Burufio/iwW1y8e/NYRw5BXMeGR28YURQc/RWz4wviGpxG7NIudY+mdtqShD73llHPbj
         Pp+V/Ng7eTEkx2CCHutNxbLKfqjXHNG5fk4KzLe0o/drPEQnIrbTfFv/WyRM+X9rlC5s
         0JXQ==
X-Gm-Message-State: AOAM530lWfCbHggdRUW34phEi6+9CWU2lEJJz38ygFNGGW4TvjJiKNp9
        mPERHF/DowJDlCwGmsL9yBg=
X-Google-Smtp-Source: ABdhPJy03bFJaz7/PXrtLNfarELvwnKrwxTynPyb3hEzita1vlbHfQUqW5/J6rDYuzmeyrkv6yLqgA==
X-Received: by 2002:a1c:541a:: with SMTP id i26mr7671486wmb.75.1616677419168;
        Thu, 25 Mar 2021 06:03:39 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i10sm7602527wrs.11.2021.03.25.06.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:03:38 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/9] iommu/arm-smmu: tegra: Implement SID override programming
Date:   Thu, 25 Mar 2021 14:03:29 +0100
Message-Id: <20210325130332.778208-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325130332.778208-1-thierry.reding@gmail.com>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The secure firmware keeps some SID override registers set as passthrough
in order to allow devices such as the display controller to operate with
no knowledge of SMMU translations until an operating system driver takes
over. This is needed in order to seamlessly transition from the firmware
framebuffer to the OS framebuffer.

Upon successfully attaching a device to the SMMU and in the process
creating identity mappings for memory regions that are being accessed,
the Tegra implementation will call into the memory controller driver to
program the override SIDs appropriately.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 32 ++++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 5b1170b028f0..127b51e6445f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
@@ -7,6 +7,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include <soc/tegra/mc.h>
+
 #include "arm-smmu.h"
 
 /*
@@ -15,10 +17,17 @@
  * interleaved IOVA accesses across them and translates accesses from
  * non-isochronous HW devices.
  * Third one is used for translating accesses from isochronous HW devices.
+ *
+ * In addition, the SMMU driver needs to coordinate with the memory controller
+ * driver to ensure that the right SID override is programmed for any given
+ * memory client. This is necessary to allow for use-case such as seamlessly
+ * handing over the display controller configuration from the firmware to the
+ * kernel.
+ *
  * This implementation supports programming of the two instances that must
- * be programmed identically.
- * The third instance usage is through standard arm-smmu driver itself and
- * is out of scope of this implementation.
+ * be programmed identically and takes care of invoking the memory controller
+ * driver for SID override programming after devices have been attached to an
+ * SMMU instance.
  */
 #define MAX_SMMU_INSTANCES 2
 
@@ -26,6 +35,7 @@ struct nvidia_smmu {
 	struct arm_smmu_device smmu;
 	void __iomem *bases[MAX_SMMU_INSTANCES];
 	unsigned int num_instances;
+	struct tegra_mc *mc;
 };
 
 static inline struct nvidia_smmu *to_nvidia_smmu(struct arm_smmu_device *smmu)
@@ -237,6 +247,17 @@ static irqreturn_t nvidia_smmu_context_fault(int irq, void *dev)
 	return ret;
 }
 
+static void nvidia_smmu_probe_finalize(struct arm_smmu_device *smmu, struct device *dev)
+{
+	struct nvidia_smmu *nvidia = to_nvidia_smmu(smmu);
+	int err;
+
+	err = tegra186_mc_probe_device(nvidia->mc, dev);
+	if (err < 0)
+		dev_err(smmu->dev, "memory controller probe failed for %s: %d\n",
+			dev_name(dev), err);
+}
+
 static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.read_reg = nvidia_smmu_read_reg,
 	.write_reg = nvidia_smmu_write_reg,
@@ -246,6 +267,7 @@ static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.tlb_sync = nvidia_smmu_tlb_sync,
 	.global_fault = nvidia_smmu_global_fault,
 	.context_fault = nvidia_smmu_context_fault,
+	.probe_finalize = nvidia_smmu_probe_finalize,
 };
 
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
@@ -260,6 +282,10 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (!nvidia_smmu)
 		return ERR_PTR(-ENOMEM);
 
+	nvidia_smmu->mc = devm_tegra_memory_controller_get(dev);
+	if (IS_ERR(nvidia_smmu->mc))
+		return ERR_CAST(nvidia_smmu->mc);
+
 	/* Instance 0 is ioremapped by arm-smmu.c. */
 	nvidia_smmu->bases[0] = smmu->base;
 	nvidia_smmu->num_instances++;
-- 
2.30.2

