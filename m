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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05433C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 15:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C51F964FF3
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 15:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhCLP4S (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 10:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231907AbhCLP4D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 10:56:03 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B38C061574;
        Fri, 12 Mar 2021 07:56:03 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id s17so7354945ljc.5;
        Fri, 12 Mar 2021 07:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uz8axRJtNwOGJiSaHqygjzHfEXoywnTTEXk/8QEVZWc=;
        b=aEk/ptF91oAruIKJCh5kBzObHw8A21+pu5m9So7irpHVhCtzTskmjARilRC8bYCWzo
         H23ZiWdsa7iQ0D9gXpJ9Zk5iO+ALMlhy5tzcBVABoNID4NDYZH6kVZ3KzScldu36d3fS
         B49dZb5EMjoRWQvi0JnjaTeKBF8X2CyfkAbkJoqI+xnnsySjWWWt1xi308IiIU1ipgSa
         ufExRffYHsZxXbJPLY9RrW6tQBOjPKlpwXEDdEbOpP4BpAcp0O/ZlH4/ohREQjrPIvxO
         JUyatwzzldqu71TeBDPC9rgkpPmYhidxTqTi3uigZGGuTQiffhO83NslnKWLd4qRe8j2
         RW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uz8axRJtNwOGJiSaHqygjzHfEXoywnTTEXk/8QEVZWc=;
        b=hQJzpMnxhjvN1sfOSY7DrGSYpYnMrVDogtRb9dJlXXTiVCv79UzF7knGQxJmfM5Z+v
         11nQp+fnxQjF1r/cXWIA93/iKOp1F/peOzqeNakj4PA6p2D8GLzRW5iZyjGMT9eXBP0c
         fZSirOHksfzSgmcnk8FB8t8YYKtCXdvwaa8mlAT5lH39jiGzWCCyCS2C1Bt2FnyKuFI0
         wrbJu7ZASxTXg96ta+Orfw29HVI2bfctC3g5d64UEiO6+UOuEi5NAQizpKjzRaPuAAw0
         6EaS8J734qlUMPa+Lnv3545Y2TvUxrgPTXM1a0iKamcCs+RUgj2+kmYf3l6dtkELTilT
         rAzg==
X-Gm-Message-State: AOAM5302+sVKi2fwOp7BCpqL+Olz6//33AZUfLhLdSa0+vxxkA2haaL6
        euXMF1W4ULyCxit8MELrcLo5Nm8tBsc=
X-Google-Smtp-Source: ABdhPJyNqC+zjAUitl09iFh8JuBYf69cws7MGpkC+ezD8XZhsmCo09/B4p/pXb7GbW7EHSEN2ok4Ng==
X-Received: by 2002:a05:651c:384:: with SMTP id e4mr2690606ljp.500.1615564561904;
        Fri, 12 Mar 2021 07:56:01 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id u11sm1759224lfg.275.2021.03.12.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 07:56:01 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Will Deacon <will@kernel.org>
Cc:     iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] iommu/tegra-smmu: Make tegra_smmu_probe_device() to handle all IOMMU phandles
Date:   Fri, 12 Mar 2021 18:54:39 +0300
Message-Id: <20210312155439.18477-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra_smmu_probe_device() handles only the first IOMMU device-tree
phandle, skipping the rest. Devices like 3D module on Tegra30 have
multiple IOMMU phandles, one for each h/w block, and thus, only one
IOMMU phandle is added to fwspec for the 3D module, breaking GPU.
Previously this problem was masked by tegra_smmu_attach_dev() which
didn't use the fwspec, but parsed the DT by itself. The previous commit
to tegra-smmu driver partially reverted changes that caused problems for
T124 and now we have tegra_smmu_attach_dev() that uses the fwspec and
the old-buggy variant of tegra_smmu_probe_device() which skips secondary
IOMMUs.

Make tegra_smmu_probe_device() not to skip the secondary IOMMUs. This
fixes a partially attached IOMMU of the 3D module on Tegra30 and now GPU
works properly once again.

Fixes: 765a9d1d02b2 ("iommu/tegra-smmu: Fix mc errors on tegra124-nyan")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 97eb62f667d2..602aab98c079 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -849,12 +849,11 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 		smmu = tegra_smmu_find(args.np);
 		if (smmu) {
 			err = tegra_smmu_configure(smmu, dev, &args);
-			of_node_put(args.np);
 
-			if (err < 0)
+			if (err < 0) {
+				of_node_put(args.np);
 				return ERR_PTR(err);
-
-			break;
+			}
 		}
 
 		of_node_put(args.np);
-- 
2.29.2

