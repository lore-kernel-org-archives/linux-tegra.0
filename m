Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62201C47097
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:46:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B9ED613F4
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhFCQsJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:48:09 -0400
Received: from mail-ej1-f47.google.com ([209.85.218.47]:43973 "EHLO
        mail-ej1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhFCQsI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:48:08 -0400
Received: by mail-ej1-f47.google.com with SMTP id ci15so10177337ejc.10
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q3vxZtPVoclQabdKu022J8j0BPxOTzbzHvAOrHFrxRM=;
        b=nCy2Pei61aDfzvs4928hmMwnDYIIH7Kyz5O4fr0CjUBTvkobQ3sXNehrHbmJOvSMc8
         TnNE9862hQ+u83Y/Trx7opcN+acqRhmQVlvUXcUbL4cKLEyeU/3nA+TpEs88aE1MHKPm
         c2AN/K9D9DtBkL542gzuygAFllKXCdefULBJbV5VUjx+XrVSjE7inUpzGlhwWJ2yA39H
         Hr4eDcBdVJMAPqnt4/oM5GTR78xq2TyEos1UQJQT1qgTBNWlpvwDsGdPrbFiauKOkp55
         brhxP1ndXoybpApJ9PjVeSJxy5GKn468gLR7SmwH7ojvESVMXkWj3566fmjbXP6dQgRS
         +Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q3vxZtPVoclQabdKu022J8j0BPxOTzbzHvAOrHFrxRM=;
        b=MYwysXjiAPURDRX2/mfggSdMZjqiGvmrl/hccMGjnDjCpj8cCxAQ97uL+dNv4SaC1+
         PueuJdyXOUuqozbEX/PGYZZkIs+X5RDj5dty+ewsJbkqqYL+5JzvRHydpyJ/jILZT/Yl
         F7WioDUthzlLLPCHSFmM/lGwAYkX4LeMo8fT+hf5PUhrTMtb5LWdfPuLd3f0i1tsu0zb
         8R5DE7lDlAwH/gQrSB/U6oS53tmpa8RqT3voJY//yIaoZXj1YNqMMD6vu++PUfFDOmP1
         Jmhwhz+oyzDJEjziIgbBr/S0C1TEIQlJe5/QRdQ+/1qI9c2pDEaTc4pm+X8Q0ctlfowa
         EohA==
X-Gm-Message-State: AOAM531/eUl+4fGo9xX+zJMUwvwURADPRb8IZlA0Oghz3Yxz0GvxMlyG
        11mAGGTN/JG94j6PaUPLkexCsWrm7YI=
X-Google-Smtp-Source: ABdhPJwZKsVDgQ4s+syaQdJ937cW3DiuFbKhKlpbFpj+N4SV2wqKmmbAD8UlzoPKh6HdVcjfz+X/9w==
X-Received: by 2002:a17:906:a017:: with SMTP id p23mr280153ejy.460.1622738710108;
        Thu, 03 Jun 2021 09:45:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p10sm1455596edy.86.2021.06.03.09.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:45:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/9] iommu/arm-smmu: tegra: Implement SID override programming
Date:   Thu,  3 Jun 2021 18:46:28 +0200
Message-Id: <20210603164632.1000458-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
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
Changes in v3:
- move .probe_finalize initialization to this patch

 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 33 ++++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 23889090eb01..01e9b50b10a1 100644
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
+	err = tegra_mc_probe_device(nvidia->mc, dev);
+	if (err < 0)
+		dev_err(smmu->dev, "memory controller probe failed for %s: %d\n",
+			dev_name(dev), err);
+}
+
 static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.read_reg = nvidia_smmu_read_reg,
 	.write_reg = nvidia_smmu_write_reg,
@@ -246,9 +267,11 @@ static const struct arm_smmu_impl nvidia_smmu_impl = {
 	.tlb_sync = nvidia_smmu_tlb_sync,
 	.global_fault = nvidia_smmu_global_fault,
 	.context_fault = nvidia_smmu_context_fault,
+	.probe_finalize = nvidia_smmu_probe_finalize,
 };
 
 static const struct arm_smmu_impl nvidia_smmu_single_impl = {
+	.probe_finalize = nvidia_smmu_probe_finalize,
 };
 
 struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
@@ -263,6 +286,10 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
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
2.31.1

