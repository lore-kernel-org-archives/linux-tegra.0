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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA725C433E0
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 23:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 668AE61968
	for <linux-tegra@archiver.kernel.org>; Sun, 28 Mar 2021 23:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhC1Xes (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Mar 2021 19:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbhC1Xeg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Mar 2021 19:34:36 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4787BC061756;
        Sun, 28 Mar 2021 16:34:36 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id 1so7563542qtb.0;
        Sun, 28 Mar 2021 16:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tNDuIurJKv2MqMA4UB9CY1OUJzVsBHPWot7sK8TYg6w=;
        b=DqA6tizyrKnmoIMviQDuYLkBANPFRFcffoyyTYgkbMp05XWdYNrn/Mt8bbIvLyK1oy
         gqv2FPT6fedG+qIi4ykiNv/81Z27lO7CMZidt70A5JcytM4dSBE9OewKlaUR28ZM3eoj
         VNa1X8DM5HEI2B5ur+jJ+2Ntn49gA6rB6bCf2eIwTsTwlIkKA9HpyZj7vuW+Kk+9YXnl
         jRB+zxpnuNRJ9QSWpbiZWR44Oy16TRQLIeaS1nNBu6YIp7u8WicJGJU1WTqFCF1IPlaf
         DzPonDHLrX3wP8LUccPrBQEKR2VFZTK+d01jJjUNCwOYuLdwBUdNjLroRcfqZmnP4aVX
         L54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tNDuIurJKv2MqMA4UB9CY1OUJzVsBHPWot7sK8TYg6w=;
        b=bqeKqfGL9k021gJyTrqG5Ly7HddJQT0A56yG2kcLGhWlM7HqrjyQXLFvapyBO9r6pq
         8PG2Uu30H7RFUaR5Y0aZLykq1EmqmE1x9lf6xRe/DmBf8kXoaCPzSQInXxaZcwCgK9ym
         nYicHqaL3JT+0RJZWXA71D0E0kDSsovjqbXDY/EW9waNMggCAXvYjNTdk7JGodSSRHFb
         HbvkUVH+4J9dQ0+MQ2Uwxt/ZbslvV7VHJaVUXcJXCwzpDxG5vreraWB+Fz7A79F/t0PK
         pCeIRFulYlJhkjV47QPT6LfvhDRSL+u8OWDNhy2xZCxYLlTkGI+g4VPCj/zI4uJ3bmPn
         +XCA==
X-Gm-Message-State: AOAM531IOftCgQgNer5Dd3Xr1+vxjLIRse8M+oOQKFkcjBfzFBXcrS6H
        7ZG+DgRdQUVhotCQEu5m17s=
X-Google-Smtp-Source: ABdhPJxstrUoBBxCBUfxS1VZCB0g5E9sW8H/zIcXKNt0B0bdws4RkNv2vZ2oYIWngDm84IyXd5m28g==
X-Received: by 2002:ac8:4d02:: with SMTP id w2mr19936201qtv.126.1616974475497;
        Sun, 28 Mar 2021 16:34:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id g2sm10117905qtu.0.2021.03.28.16.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 16:34:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Will Deacon <will@kernel.org>
Cc:     iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] iommu/tegra-smmu: Defer attachment of display clients
Date:   Mon, 29 Mar 2021 02:32:55 +0300
Message-Id: <20210328233256.20494-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

All consumer-grade Android and Chromebook devices show a splash screen
on boot and then display is left enabled when kernel is booted. This
behaviour is unacceptable in a case of implicit IOMMU domains to which
devices are attached during kernel boot since devices, like display
controller, may perform DMA at that time. We can work around this problem
by deferring the enable of SMMU translation for a specific devices,
like a display controller, until the first IOMMU mapping is created,
which works good enough in practice because by that time h/w is already
stopped.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 71 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 602aab98c079..af1e4b5adb27 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -60,6 +60,8 @@ struct tegra_smmu_as {
 	dma_addr_t pd_dma;
 	unsigned id;
 	u32 attr;
+	bool display_attached[2];
+	bool attached_devices_need_sync;
 };
 
 static struct tegra_smmu_as *to_smmu_as(struct iommu_domain *dom)
@@ -78,6 +80,10 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu, unsigned long offset)
 	return readl(smmu->regs + offset);
 }
 
+/* all Tegra SoCs use the same group IDs for displays */
+#define SMMU_SWGROUP_DC		1
+#define SMMU_SWGROUP_DCB	2
+
 #define SMMU_CONFIG 0x010
 #define  SMMU_CONFIG_ENABLE (1 << 0)
 
@@ -253,6 +259,20 @@ static inline void smmu_flush(struct tegra_smmu *smmu)
 	smmu_readl(smmu, SMMU_PTB_ASID);
 }
 
+static int smmu_swgroup_to_display_id(unsigned int swgroup)
+{
+	switch (swgroup) {
+	case SMMU_SWGROUP_DC:
+		return 0;
+
+	case SMMU_SWGROUP_DCB:
+		return 1;
+
+	default:
+		return -1;
+	}
+}
+
 static int tegra_smmu_alloc_asid(struct tegra_smmu *smmu, unsigned int *idp)
 {
 	unsigned long id;
@@ -318,6 +338,9 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 	as->domain.geometry.aperture_end = 0xffffffff;
 	as->domain.geometry.force_aperture = true;
 
+	/* work around implicit attachment of devices with active DMA */
+	as->attached_devices_need_sync = true;
+
 	return &as->domain;
 }
 
@@ -410,6 +433,31 @@ static void tegra_smmu_disable(struct tegra_smmu *smmu, unsigned int swgroup,
 	}
 }
 
+static void tegra_smmu_attach_deferred_devices(struct iommu_domain *domain)
+{
+	struct tegra_smmu_as *as = to_smmu_as(domain);
+
+	if (!as->attached_devices_need_sync)
+		return;
+
+	if (as->display_attached[0] || as->display_attached[1]) {
+		struct tegra_smmu *smmu = as->smmu;
+		unsigned int i;
+
+		for (i = 0; i < smmu->soc->num_clients; i++) {
+			const struct tegra_mc_client *client = &smmu->soc->clients[i];
+			const int disp_id = smmu_swgroup_to_display_id(client->swgroup);
+
+			if (disp_id < 0 || !as->display_attached[disp_id])
+				continue;
+
+			tegra_smmu_enable(smmu, client->swgroup, as->id);
+		}
+	}
+
+	as->attached_devices_need_sync = false;
+}
+
 static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
 				 struct tegra_smmu_as *as)
 {
@@ -495,10 +543,26 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 		return -ENOENT;
 
 	for (index = 0; index < fwspec->num_ids; index++) {
+		const unsigned int swgroup = fwspec->ids[index];
+		const int disp_id = smmu_swgroup_to_display_id(swgroup);
+
 		err = tegra_smmu_as_prepare(smmu, as);
 		if (err)
 			goto disable;
 
+		if (disp_id >= 0) {
+			as->display_attached[disp_id] = true;
+
+			/*
+			 * In most cases display is performing DMA before
+			 * driver is initialized by showing a splash screen
+			 * and in this case we should defer the h/w attachment
+			 * until the first mapping is created by display driver.
+			 */
+			if (as->attached_devices_need_sync)
+				continue;
+		}
+
 		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
 	}
 
@@ -527,6 +591,12 @@ static void tegra_smmu_detach_dev(struct iommu_domain *domain, struct device *de
 		return;
 
 	for (index = 0; index < fwspec->num_ids; index++) {
+		const unsigned int swgroup = fwspec->ids[index];
+		const int disp_id = smmu_swgroup_to_display_id(swgroup);
+
+		if (disp_id >= 0)
+			as->display_attached[disp_id] = false;
+
 		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
 		tegra_smmu_as_unprepare(smmu, as);
 	}
@@ -762,6 +832,7 @@ static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
 	int ret;
 
 	spin_lock_irqsave(&as->lock, flags);
+	tegra_smmu_attach_deferred_devices(domain);
 	ret = __tegra_smmu_map(domain, iova, paddr, size, prot, gfp, &flags);
 	spin_unlock_irqrestore(&as->lock, flags);
 
-- 
2.30.2

