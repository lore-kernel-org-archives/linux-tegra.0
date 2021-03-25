Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7B1C433E3
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 161AF61A11
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhCYND7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 09:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbhCYNDn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 09:03:43 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18CC7C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:43 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b9so2189245wrt.8
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p2ZJr/xZleVG5vuo3vPYmm91QfUd+NNqHlfpozdoe+o=;
        b=b9p+BJqLAOyKGwz7BGORFcfWe1SnBSJN57Ur8/KUGDQzC3zjC10qVEmkQIY25Xp2ob
         8RQVaEeuDH80SZerjHOE5/pI+x2LRzXJeLACnZUbmy/6FRAlbHNplEupgC5twlNMKXyY
         tRzjdQmWL45AdOo8WdVHb4/5qurahs/c+eg4dDvHyzR+0VPCVstYh5vUJ7LkDLCbBBG9
         57ULubjRi1M1H410LaBhghrAYwHCxDaHAEeekrXarO7YD7Y7ivN9dYVqLxpmJ/LX0DAz
         DulYEq9U+9/ahB0aKcr7SaZQ+yeiEPW7FFsA/v6nrxKrh6UoJgcTDePDaNdIcDEqn5t8
         ZnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2ZJr/xZleVG5vuo3vPYmm91QfUd+NNqHlfpozdoe+o=;
        b=gv0HL/orJ0+SiWkrKK77OeqIjlxo8EiqDNvfi5KxjfIzMIX/Lu0dAmeiGTlhzO3mG6
         kOJ/TEfNfMa0GV3pempNJd5Zq7pwce8igt/y7sbL1qytyrYO+lx8Bh3OIpEnb8u7GoR7
         gCc1XDPancusVp2CV1RUxGpiMozfXBq6CjMogsXRQFOIz/HXPXn+U/6kDnH6jr5YlIoC
         23WgLElq65N/lhECtUyLUnF1TLhIKvO4y8lXl1SLxHVvgAkV26nnmxHxzNl0H2FB5z0F
         LXTvnKjhEZpv8I0pWPwTiFAAQJx9ZX4CKASUWKzh2Azrjd7mRsz+c7QdTBoJle8ProFj
         de/g==
X-Gm-Message-State: AOAM530HRcSXSk7ArWcnKuhqN92FPEYPRjBSu1bJ9kk3Z5ILFlE2jDLq
        kARL1IRfgH7E/DlsesHkkdI=
X-Google-Smtp-Source: ABdhPJwKeFtKFkBOdAh9H/ZHiBxwBkM7hwaJ4gXK8GulNDMTzhjAj/zMDpSNpAbmeOVWuqx3NWDIbQ==
X-Received: by 2002:a5d:591a:: with SMTP id v26mr8835899wrd.172.1616677421814;
        Thu, 25 Mar 2021 06:03:41 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f22sm6187595wmc.33.2021.03.25.06.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:03:40 -0700 (PDT)
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
Subject: [PATCH 7/9] iommu/arm-smmu: Use Tegra implementation on Tegra186
Date:   Thu, 25 Mar 2021 14:03:30 +0100
Message-Id: <20210325130332.778208-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325130332.778208-1-thierry.reding@gmail.com>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
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

