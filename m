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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609A1C07E9B
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Jul 2021 00:14:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4213D61042
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Jul 2021 00:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhGLAR2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 20:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhGLAR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 20:17:27 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83951C0613DD;
        Sun, 11 Jul 2021 17:14:40 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id f5so7680327qvu.8;
        Sun, 11 Jul 2021 17:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbWrCRAXNKnrsAOs9jzjwaP+o7LOU1NoMDrvo6psqh0=;
        b=pcZhmUBcBartxQVH+z7tpAIZMC86HC+ySHISakIRBBaS3KGUJa+s9ghxKBdpT3cesy
         LaKgepCTVBG43f87Q5L7av2e1NvU43Ui0UtZSSwGOIkiuxunRYGoitmjF+Q8fyPB7F9F
         G6S2trIQ8lVL1wploYqYw6O1vSea0sQXACuZBcd91DrQLo+ygk6V4DGlxpHX1TWpnFYM
         FzQrhG020laUrHf6orAxZWFOduVXCsGpxcGYlF0qDatd75s0qZwNyK5ROHlCcB75D225
         uk5HVuwBS1XGf5dzg7pzOlHN9iQZy0ehNZWwlTBnrGsuhpVgrJlltmJyCJAhYHPkgTjg
         rMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbWrCRAXNKnrsAOs9jzjwaP+o7LOU1NoMDrvo6psqh0=;
        b=K60Ds9LR7VhhO+P5xSCyGCONSAd495NsVSxvupedKztcsF9QeCysnMVxvIiu6CRk5N
         cS0LqwtyiXZdI0osG/W4OGktL3gsWKOdUDxg3oX4eGy0xJ691GUJUNz9B6qddETM6TFJ
         lNGLDe3VWvaPB3N6t/IDTbTht1/nZNs81gvRzeCeyKir6BbDtDqxTxkOLUq87E86zKfw
         GzayhPRosq16wq7VLo0r9H9+rC7rW1OyzRoOwBUpZTSzjS9Fk4yyQg9qbJAAJ0vqy4M4
         LBfqNbvFrCzO8smqQC8BrtpiPVVZHIl2fuRbCl80GMZgxko00aYQ/T8AZcinwEjr4x0/
         vICQ==
X-Gm-Message-State: AOAM532e0TLCZtIbmmqh9p60XuiLoZwVsjsztvlZ0A3jaSsoIVMGxiOa
        JeSvNGnMHC7zWRKbjG+qejU=
X-Google-Smtp-Source: ABdhPJxOe5ByYnSBkxL9fC/fx33DHCY7UT7W1x8vp0k92vpxW0k3wg+UPpWI9Vis/OijUYmVaG97+Q==
X-Received: by 2002:a0c:9e6a:: with SMTP id z42mr34205762qve.37.1626048879641;
        Sun, 11 Jul 2021 17:14:39 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id b5sm687481qtk.46.2021.07.11.17.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 17:14:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc:     linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] iommu/tegra-smmu: Change debugfs directory name
Date:   Mon, 12 Jul 2021 03:13:41 +0300
Message-Id: <20210712001341.11166-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Change debugfs directory name to "smmu", which is a much more obvious name
than the generic name of the memory controller device-tree node.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 0a281833f611..093c270b9245 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1141,7 +1141,7 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 
 	tegra_smmu_ahb_enable();
 
-	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, dev_name(dev));
+	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, "smmu");
 	if (err)
 		return ERR_PTR(err);
 
-- 
2.32.0

