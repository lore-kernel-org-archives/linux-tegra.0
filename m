Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BA3C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 11:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51F2C208DB
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 11:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsuvpATr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgIQLp7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 07:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgIQLfY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 07:35:24 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022B5C061788;
        Thu, 17 Sep 2020 04:35:24 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id l126so1040776pfd.5;
        Thu, 17 Sep 2020 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hqyi/xOOSPbq2sLccfUIMg/IBaONt+TI3nAR/jdQ8+0=;
        b=XsuvpATrxnyOdZ082PfZTqiGJyd5VlehgmOaeJaKRRM4R126cOSKFT+qJcTU6uOvhV
         ZMeLo0Hd67CjMu2Md6hOJ+f0sz9wpK1I34RwwfwYoEGlPEmF2O//beqQGvqdc5czH1aY
         cKq68fsy6BWWkX1ByTwnGJt3xJShFoWN4X68TTILMXcBDsIh/xEEikgKPxFHBmSbghkI
         XddoxBFZxims91ZXYarpGtGau7mgsKN51Ky4lzIdDt8QcXo+j48GdBsD8a222U71Oa3D
         ucHWKBWBD0cxomnrN3w4puxhAefRMSxx5eyYYYmZd4MCFs57W/or90JBmp9umAnuyN7e
         56wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hqyi/xOOSPbq2sLccfUIMg/IBaONt+TI3nAR/jdQ8+0=;
        b=aamtL5nY/FWgHeglVKYui5rw+WIA5Fo0ZgZQYT7af3oj0YfYCog1myXQaqxz6sG+O/
         DHi1hmqC+TTkPu0s6VzBF2zdAQhVvomU/7sl7cjPvFVsZ/azF9oH95NecTMY+L3MdRBS
         ZNqakmbKiZwQT0SPXUqEOEKseHvU+oS7aanUA4OnW0I1uDM3XOXHNYGj7tCm1g2jByfP
         rhfgARciPFR3n4U1EvUjPJO0meA8EKFRwIym74DfWPVhq0q3ZLl9/NtIe1bheaHpQNqz
         Xt55sIBW1TvaGJr1LQ2ADXG2klk/H/VX4EC+mN6YaaRJXl/rIZ/S39Hj9r81Svawae3E
         vAuQ==
X-Gm-Message-State: AOAM532gQI+KGESzuayARp7vKNEXdl8VgMkWaf5/hRhDl8n+CRVKHJs5
        9AbjBqYMw5yiy/vRjOxGCWDmMsTjS4I=
X-Google-Smtp-Source: ABdhPJxaX6IVt6BLr1kYX9VUY1eqb/Tte57kwnZ5NhQhWQmbw/7fD278jhNmMt53/Cf0dMC3L/LUEg==
X-Received: by 2002:a62:2b52:0:b029:142:2501:39e9 with SMTP id r79-20020a622b520000b0290142250139e9mr10824105pfr.56.1600342522014;
        Thu, 17 Sep 2020 04:35:22 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id a138sm21128382pfd.19.2020.09.17.04.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:35:21 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     krzk@kernel.org, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
        vdumpa@nvidia.com, thierry.reding@gmail.com
Subject: [RESEND][PATCH 1/2] iommu/tegra-smmu: Fix tlb_mask
Date:   Thu, 17 Sep 2020 04:31:54 -0700
Message-Id: <20200917113155.13438-2-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917113155.13438-1-nicoleotsuka@gmail.com>
References: <20200917113155.13438-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The "num_tlb_lines" might not be a power-of-2 value, being 48 on
Tegra210 for example. So the current way of calculating tlb_mask
using the num_tlb_lines is not correct: tlb_mask=0x5f in case of
num_tlb_lines=48, which will trim a setting of 0x30 (48) to 0x10.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 84fdee473873..0becdbfea306 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1120,7 +1120,7 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 		BIT_MASK(mc->soc->num_address_bits - SMMU_PTE_SHIFT) - 1;
 	dev_dbg(dev, "address bits: %u, PFN mask: %#lx\n",
 		mc->soc->num_address_bits, smmu->pfn_mask);
-	smmu->tlb_mask = (smmu->soc->num_tlb_lines << 1) - 1;
+	smmu->tlb_mask = (1 << fls(smmu->soc->num_tlb_lines)) - 1;
 	dev_dbg(dev, "TLB lines: %u, mask: %#lx\n", smmu->soc->num_tlb_lines,
 		smmu->tlb_mask);
 
-- 
2.17.1

