Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC97BC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB65660EFE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhKLNPf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhKLNPf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:15:35 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 576EAC0613F5;
        Fri, 12 Nov 2021 05:12:44 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id c4so15410777wrd.9;
        Fri, 12 Nov 2021 05:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CD8KrErZHm2h0/ca8/KMvKQBC9npkDaLuOssn3ZYFLU=;
        b=WhgOPku/sJMt9I096l9adybmV45TCPeL5vYAMvumDuf4XLqQEQi9ByjZiWFvBqTb/T
         wePpQAZ9se+qWnxsOuElDdl6LSU2Pmm/Hsx4ehCuASikRcdDMES66ADfcFgeDaXPo/1m
         NlemVs7zbsTktVJmPRxljAF/CJDRceLKE32XC/DE7ff9YWSIZYTpde+P7zdto7OJox0e
         R/Mj2i0dNGUh4x0odLrgMPSAkdPsbpOoJibLX2lJFHF36z4/AYL59dxm6Aly/tIYunmC
         PSCN9o6jR6ab2bOdT9vgECNbEH9vKUZb5bDwpf6lpdX+sTpUYDXv/pom4HT33E0gRioZ
         kh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CD8KrErZHm2h0/ca8/KMvKQBC9npkDaLuOssn3ZYFLU=;
        b=63WmciBUZD3MmhoK1dyywK0pFy2VZxq6lW+NqcWuTDIRYsKbp29UpcIiee03g+LhQe
         vuLyGIJyvPth4OVkRhnKjZ3o5U2UHzZHibrEYwkwgHAhIxFIG7R1peILHfni6ozPvk8m
         bYC3oGmXP4hgQgpNB/DiMUa1ytkmziudf0IwCB0hivTY5dZxRQHYgPrlPG9rfCnVmUkf
         sWfFrJDYVH4SVLFlT6+79SBPI21kZSaF5gGRO2LWuxWvfiF4D1lNyiNuhdKhoc7GXf4C
         CdKkFfbkOtuw4VqhfUj6HdlKZpvV+CHCht+wyNqmgyvV+p1uRaFkoZDDp32mguOrPKUH
         YeGg==
X-Gm-Message-State: AOAM532tEN4j9vB2lmQA9MsvK2Rp3dPRl7joeOrzUacOW0SJ8wAw+ULO
        oPZPTsB4P/D3ZR16vyIpOMk=
X-Google-Smtp-Source: ABdhPJzobwIYLFkRU9Zi7ARLqvfIYTYsPB7tVqy3KAjMnKkoqWgxe1N4kFQxuKkmGCazsQHjw2/KwQ==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr18611547wrw.21.1636722762864;
        Fri, 12 Nov 2021 05:12:42 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id x1sm5665416wru.40.2021.11.12.05.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:12:41 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] iommu/arm-smmu: Support Tegra234 SMMU
Date:   Fri, 12 Nov 2021 14:12:30 +0100
Message-Id: <20211112131231.3683098-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112131231.3683098-1-thierry.reding@gmail.com>
References: <20211112131231.3683098-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Allow the NVIDIA-specific ARM SMMU implementation to bind to the SMMU
instances found on Tegra234.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 2c25cce38060..658f3cc83278 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -211,7 +211,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
 		smmu->impl = &calxeda_impl;
 
-	if (of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
+	if (of_device_is_compatible(np, "nvidia,tegra234-smmu") ||
+	    of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
 	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
 		return nvidia_smmu_impl_init(smmu);
 
-- 
2.33.1

