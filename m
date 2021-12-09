Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39CDC4321E
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 16:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbhLIQjs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 11:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236531AbhLIQjr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 11:39:47 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D3EC0617A1;
        Thu,  9 Dec 2021 08:36:13 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a18so10695849wrn.6;
        Thu, 09 Dec 2021 08:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RBVbB9vWDMJLfuwUYZUrRPLV7w25shhYgWxxhrA4Z48=;
        b=DGTmwROcRMmvUsuy3YNzANsG6/H/eUb9VX0utTdtacM8z6GqwRXVbC16JeNePjBBHE
         O55Lqu5LqXYX+xVavU00nqw3JV3zVVvasfffLIOYCVbEYjBFW9sEf63e7WXDdodZoRYU
         VdG0oFsYnOuIc5CcB7i9KT7XGIj9UPc9DzI6JfaZIhNaBiTRx6DPT9BTC9H2PLGY9Dln
         KgylB4YajKqGbcfIVCX7ea8KgNU6l+mp3oOP1+5NSJil2XFG3yZaisW4rMhV8dbJ73/w
         OnhDDp6NUZyATkuzV4x3mnHSiQELVzNokQT7UIOiSyRr01Echrq5VC4Lc2vlGZ3UHlKR
         3OKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RBVbB9vWDMJLfuwUYZUrRPLV7w25shhYgWxxhrA4Z48=;
        b=VhaM0M6xWyDoPapQePdNcMKjTfT9zX6XLNEzNWrbBbgAU38W7+6bHneS/qoBSjVvUp
         EaczUGGdOR+GSXnyKmCP04Gr33gWc+ueR00CiLXNjQPxhYXw8+MJJKuZIFx0Ogg91VH0
         jo38+m3ego2wflH4PaKWl/UHdbscHDdZwoiULKnO66Eb7zEVJx3GKYW++r/7aAk+ylQH
         t6smBNits4y4sScnA4tVp2DgEBIp0Xal9+5/I+Z3XjUUdfQJHr5C3C1hitq63R3jnRIO
         OZXus5/AZT8RzTo0ywqN39FtcWZbFdwsb6gJDdgpY564Fzy+7GwJtGUNEiyPuzS5UDYT
         nI5Q==
X-Gm-Message-State: AOAM533bQz+FfZBsBPWOBK7PGUenlxNvJ28Mq9ZTeb2NNdtm4TPXPKjQ
        iaCqe4tHzKwD0ufwgH3pSo8=
X-Google-Smtp-Source: ABdhPJyoyzm35sKhtbHbEgfcyRTMC6E0F0fB9LiKI1mNHER0VWEYotU23cMbHIBCAVjMsVva3cZv1A==
X-Received: by 2002:adf:f491:: with SMTP id l17mr7747810wro.525.1639067771765;
        Thu, 09 Dec 2021 08:36:11 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id v2sm250094wmc.36.2021.12.09.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 08:36:10 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] iommu/arm-smmu: Support Tegra234 SMMU
Date:   Thu,  9 Dec 2021 17:35:59 +0100
Message-Id: <20211209163600.609613-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209163600.609613-1-thierry.reding@gmail.com>
References: <20211209163600.609613-1-thierry.reding@gmail.com>
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
2.34.1

