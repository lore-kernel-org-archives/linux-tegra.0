Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40635C25B47
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Oct 2023 11:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234657AbjJYLBz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Oct 2023 07:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234703AbjJYLBs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Oct 2023 07:01:48 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB02AC
        for <linux-tegra@vger.kernel.org>; Wed, 25 Oct 2023 04:01:46 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53ebf429b4fso8649398a12.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Oct 2023 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1698231704; x=1698836504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gC1STNfqo/ReIXjrh5ODTmjb0+/6zWRqz5Oi0kVvdL8=;
        b=XDPxJP0gZYInX9OA/c/VCeHS6F/3gWUZATS9yGOaGaM9kVgMaZ26M0/nMT9OTE91n6
         ceWYiMVAt3/7LnXMk+pEoOuBe2bIEOXgHb/vgFOCTuHdrHA2HALlXcmA7qAB/RwE9RgX
         n93o3csd25lrNPkFhY9NUNtUuKJgyCRofGxIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698231704; x=1698836504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gC1STNfqo/ReIXjrh5ODTmjb0+/6zWRqz5Oi0kVvdL8=;
        b=bBEDY2guSlprvf/7qjhYZweURM2WiiY+wNtSqxIm/StXAupId90c+zgqiftvCZOrs5
         mn4v85ky+hp43ijGF1fx/vX9ktl8XYZ7mH0kiRUAa+Ly5wX3DuqyyaRn1gLMhErOQGCs
         Y7H+RIFZSZRZUhFBb3k1EirY3V6FScWPnMjcZSkuDI8SE6mMtNx/HZvlvrvvQZRnEn+C
         1wUJWPmIpz9BU2zxS2ELLRjoqI5ULHhchmkpWigG5iaV760boR28Jd+8o1yEIIMytiNE
         +GPFBMVXA7Oq/6hbiObOAYI4xjXSbwwRFrym4qU7MVRkUqYt/qd2OMJShrRjWGgThZ1P
         lDcA==
X-Gm-Message-State: AOJu0Yy86gDJ/sErlpjwZy1QlSH+FZomXd0q2yi4qjGi8uPvQwXLQibt
        +URS7De1/pKyjwhm6G21jPYxrw==
X-Google-Smtp-Source: AGHT+IH9w2CN0Aj8bDNQ5kfS1kQwZ9JApoyTHfrWQGMBaOerFMfpeyEW2qCqPLWSXbl29/SfvmGxCA==
X-Received: by 2002:a50:d0c1:0:b0:540:ea03:af81 with SMTP id g1-20020a50d0c1000000b00540ea03af81mr819224edf.41.1698231704313;
        Wed, 25 Oct 2023 04:01:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-50-51-252.retail.telecomitalia.it. [82.50.51.252])
        by smtp.gmail.com with ESMTPSA id v15-20020a056402174f00b0054042ebbb86sm5222999edx.89.2023.10.25.04.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:01:43 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
        linux-tegra@vger.kernel.org
Subject: [PATCH] iommu/tegra-smmu: fix error checking for debugfs_create_dir()
Date:   Wed, 25 Oct 2023 13:01:31 +0200
Message-ID: <20231025110140.2034650-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The return value of debugfs_create_dir() should be checked using the
IS_ERR() function.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/iommu/tegra-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index e445f80d0226..cd1d80c4c673 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1056,7 +1056,7 @@ DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
 static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
 {
 	smmu->debugfs = debugfs_create_dir("smmu", NULL);
-	if (!smmu->debugfs)
+	if (IS_ERR(smmu->debugfs))
 		return;
 
 	debugfs_create_file("swgroups", S_IRUGO, smmu->debugfs, smmu,
-- 
2.42.0

