Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BF0C43217
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Feb 2022 11:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234817AbiBRLoK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Feb 2022 06:44:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234787AbiBRLoJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Feb 2022 06:44:09 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B331812751;
        Fri, 18 Feb 2022 03:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=J+rRNDls/ju+huBYt5djRYvtPipgQzrZeloYiORvFeI=; b=LENxateumiBnveV23r6262JWWv
        0OrHv3wH+LWMNIFvJUppfim0dTHplEZeIabcBg7VEAy2aNlqY4ASntZPaA2/+r1r33SbICe15l31e
        0Tvy2U7Ai/62EcYKgq1i975L6B3NEO16sLIpAifsvEE8XGEbe1xCzS/h7osUBRArb+l7UcMvpCUdz
        OY2C02VjiYM9oeFM7+RaEIyy/K8QrQDOsnw+SD0NtuNPyGisV0q8Z4E4xq+A1i5BP+wLY9LGX126u
        TuLgaafAiqhRrTEo8if7MGK8F0UHZdLog7niuwSW/ngElXzJbBzvTakxv3azd4qeQAra3WbHX1bLJ
        3HsIOewA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1nL1fq-0006eP-7M; Fri, 18 Feb 2022 13:43:42 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
        will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 5/9] iommu/arm-smmu: Attach to host1x context device bus
Date:   Fri, 18 Feb 2022 13:39:48 +0200
Message-Id: <20220218113952.3077606-6-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220218113952.3077606-1-mperttunen@nvidia.com>
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Set itself as the IOMMU for the host1x context device bus, containing
"dummy" devices used for Host1x context isolation.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4bc75c4ce402..23082675d542 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -39,6 +39,7 @@
 
 #include <linux/amba/bus.h>
 #include <linux/fsl/mc.h>
+#include <linux/host1x_context_bus.h>
 
 #include "arm-smmu.h"
 
@@ -2051,8 +2052,20 @@ static int arm_smmu_bus_init(struct iommu_ops *ops)
 			goto err_reset_pci_ops;
 	}
 #endif
+#ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
+	if (!iommu_present(&host1x_context_device_bus_type)) {
+		err = bus_set_iommu(&host1x_context_device_bus_type, ops);
+		if (err)
+			goto err_reset_fsl_mc_ops;
+	}
+#endif
+
 	return 0;
 
+err_reset_fsl_mc_ops: __maybe_unused;
+#ifdef CONFIG_FSL_MC_BUS
+	bus_set_iommu(&fsl_mc_bus_type, NULL);
+#endif
 err_reset_pci_ops: __maybe_unused;
 #ifdef CONFIG_PCI
 	bus_set_iommu(&pci_bus_type, NULL);
-- 
2.35.0

