Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692F6C433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33A4E61076
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbhDTR0Y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhDTR0X (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 13:26:23 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4209FC06174A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:50 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id r12so59483897ejr.5
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p2ZJr/xZleVG5vuo3vPYmm91QfUd+NNqHlfpozdoe+o=;
        b=jsa3AkWNBDjgamJbXDaljolIixvaPZTNVV8eniMr+VOD+kTy4Fj29gy79z7XKq9ykE
         3gv2/EAkhd1gsGruvhDqp4wEjnxIiCimFU/RgrQqGSiQjRR4eFBlPrh6zBc0BKERnw5F
         1qyUSbxcCq5tFgj6BuuNvb0LuuLnGYNWHaES+USLwewwJlOR+Gx5msYK59HjmCWZndl4
         i7ew+P/BDjt1IOwlOzH9k+hIULL915piRp0lNPCuJ0C9Uo8E1ydT1RU01gaecdS8Wqf8
         4TfDnfckvXCJzgb/IEVkd7fdiGAwSSlT1SPFv2MwTGzAI5IaxaPAM+KeJ7q/GxX38Dn/
         hBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2ZJr/xZleVG5vuo3vPYmm91QfUd+NNqHlfpozdoe+o=;
        b=MRpDyLjEkEU8HexCT3a+h+Ld41RmhXy77MGPlOKEsJtN1WWtl2/7v+Yo1U2YeXAKKp
         RfVS/hhvu7h5IrIbDX80C5m3ApKRUGLXY5z3Sgpbm+37s8Yj5vktbRbPKgZsDdOXf0z2
         l6nzNk5zgdB0k/DvlEJGv3WH2j9QTNfdwp3nMaEpxhgzwctYUuUZExrZEb909vXBLxAR
         dcXyXeQ74qik3z2Y66QnS4tRaH7bitK79RCLnzMs4zAhR0ibvDNYW7G+1MJgq5ks51lB
         hDewzeX3MU3GujHCFHTOjot9fAv/ESKcRV+wklHXfsXxCkQSaVER7xVLzVfkAs6n+ndC
         I2JA==
X-Gm-Message-State: AOAM533lFsqZzvJcWV+J1l/Desf51uyjyoVAag6l0u6RJRwHmhz9H2UZ
        rSDa5CvXXvRwe3D6o5UoBRQ=
X-Google-Smtp-Source: ABdhPJwzCWpVw7Ve1FfA3VZFd2TaFsdaYTJrv8OF17ztwD6A/Jl0H4QyQKbqByeQhd5d35kji3SBew==
X-Received: by 2002:a17:906:4ec3:: with SMTP id i3mr29149586ejv.119.1618939549020;
        Tue, 20 Apr 2021 10:25:49 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y11sm16781977eds.10.2021.04.20.10.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:25:48 -0700 (PDT)
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
Subject: [PATCH v2 06/10] iommu/arm-smmu: Use Tegra implementation on Tegra186
Date:   Tue, 20 Apr 2021 19:26:15 +0200
Message-Id: <20210420172619.3782831-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420172619.3782831-1-thierry.reding@gmail.com>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
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
2.30.2

