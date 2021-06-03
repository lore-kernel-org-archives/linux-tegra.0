Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A2CC47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:46:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3CFC613F1
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhFCQsI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:48:08 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:43939 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhFCQsF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:48:05 -0400
Received: by mail-ed1-f53.google.com with SMTP id s6so7882489edu.10
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r8fGUpVpptMRBfRxglvA8AvxNT0zJcmuot8FSf94QpQ=;
        b=Mrsq9SXzuGTG87HBigTQmdjHKtQRZcvmcijXZy0iHk8e8caUNdUOM25vJm0ajCrxks
         LYbrnBw3UPxmQis3WBDa4V+KEDL1Vei8VmCI6hui5y3CzL+dbEncV0o+ivy7R8nK3dPJ
         LqZl0YI9vvPE2k5i6RP23IpMFw+1++nnZfcPnBDyKmiQYeNAKnV3H/sETmvp9DZyKvW4
         iJqLcPktC23EY6MQ7wHC/9ExVlmEDxOaypiyzfgI4ghYGOaJzQ+Oqc65RGC62bcUQO/W
         bFiz5OwCDWcaZOBlwbIHIFuUhj7BOzDLN2/G22fNMfx0ZkzawJJpiCgEAsyzAVD/4Z6Q
         uSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r8fGUpVpptMRBfRxglvA8AvxNT0zJcmuot8FSf94QpQ=;
        b=kSSB/D0N/EAIEvQZXTU3+cUI+e2WOSoCDdjRpvBHH+WENFFp7E9d3EOo8/evRmkTG4
         HpDupaGv1ylc/EDhmSjOpZiX6cigFuwZUX6vV4sWebeAKTDzu68ZtYN9TfyhWbyQM2/m
         uSaGsA6nzUo/Z9MqurfeEjW1XGrVc5kh0fHCdBWSK2GvhPiacg5SuPeBoDpj5fDPlfTA
         kjsuAubUpg3PakGaWLZBx09Io/8iqhUpw6r/MgiKqVYMwVmOH8gV89VcCjVnABJMa7wn
         zw4l0di2U+UAIqYPAjGI27gbcUI5vdnpFepmBkZcdzOLj2f3vFAwnQ78qyG9d9MqXeG7
         EhnA==
X-Gm-Message-State: AOAM5324+l3l3RFzJtNPKimrX/UyYsDL1oiAVUdzfsmhH+exMRg5Vzii
        tlftfztXUqRZ2otSFgV67JI=
X-Google-Smtp-Source: ABdhPJyv8jWy2m1Ygx1oXaeKL6HrcQqVoQpZlQ2h/P1i3CxsxCxRctVO/8Y/6oidTLC0t+bmxRs0TQ==
X-Received: by 2002:a05:6402:1c83:: with SMTP id cy3mr428442edb.108.1622738712418;
        Thu, 03 Jun 2021 09:45:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o4sm1906443edc.94.2021.06.03.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:45:11 -0700 (PDT)
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
Subject: [PATCH v3 6/9] iommu/arm-smmu: Use Tegra implementation on Tegra186
Date:   Thu,  3 Jun 2021 18:46:29 +0200
Message-Id: <20210603164632.1000458-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra186 requires the same SID override programming as Tegra194 in order
to seamlessly transition from the firmware framebuffer to the Linux
framebuffer, so the Tegra implementation needs to be used on Tegra186
devices as well.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 136872e77195..9f465e146799 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -211,7 +211,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
 		smmu->impl = &calxeda_impl;
 
-	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
+	if (of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
+	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
 		return nvidia_smmu_impl_init(smmu);
 
 	smmu = qcom_smmu_impl_init(smmu);
-- 
2.31.1

