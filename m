Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97970C6FA8C
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Sep 2022 17:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238097AbiIERJG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 13:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237992AbiIERIr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 13:08:47 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13725E669;
        Mon,  5 Sep 2022 10:08:45 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id kk26so18218836ejc.11;
        Mon, 05 Sep 2022 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WgjgV6exEQAEiAyC6E25mKANsasFgoGpWzbdU8ZUP1c=;
        b=qsP4xrxwyFsC1aHjBN9OomtOEc6gHWzZzwrLVOA2rT+J3/v1Osls/cpZ3DlbRAIAIO
         /GR2lT5alv7UiXSP9+LJmqlykl4HMApITzyKSn46nRSw5E71yyPb4xWtaeXKbb3HIvJg
         5ABwTOU71KG8RcT/TLOTGjFJuVpfSwRLAyv7GnGQl/Geqb0SHES2oP7OuE9o28tnoyK/
         ZiHmqTSVBW9Vuzmr8pxFKtRe1NKcxeq8In4NXNQCjETkUkttkb+DifZoNSrBjiA/cINj
         O0/om1fp+bS921k4sVCtFOO3P3U1YUSGnNhvFJi6Szs/iUXQ06dTaCytUbKp15ta+5pc
         LX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WgjgV6exEQAEiAyC6E25mKANsasFgoGpWzbdU8ZUP1c=;
        b=YdQ6hQxsQzgtCQwD7QifQzEzs5wGnDE2WoGkzPaDvFWxoL8yWKeYPET1Adhvb470Jc
         /qGUqEBtdI1wiURIoYmbj0phL7FTI+76iCuqI0NYh24FY2B7g7VcYxkvNpcQzuGs136F
         L9ddpRNHvoRGME/9Y2XhXQqdFMSGq+ehsybLyLsorpZA9VR1Uc59OuI81zrRSirYFoIg
         pi5XXADc0JoLa+KBFTEvOZ0Cb6RzdNnIP4huFY9VCfNYuEMuF3ifLGXGiT6DUykhN+Fa
         1pTXfP5StRVjD+Nkok/kwLpLn3SaqAS8wnGrx1/z/8Xoj9d7p2rQk0UeMeBLU7u39/P0
         +hBg==
X-Gm-Message-State: ACgBeo3gIcarVfXTjKkiMqfJvlo1gpxKkL00x2AYG6i5NMbdZYPlI1lX
        ax9FJoF0n86v0MUQtzXb9jA=
X-Google-Smtp-Source: AA6agR6gD6HpBH6h8rRmD/uYLRg3TsUXl3vhLS56kcvAY5q4cDsjroHjjx1d5Mqew3h2bO9QrY759w==
X-Received: by 2002:a17:907:970c:b0:741:748b:6dac with SMTP id jg12-20020a170907970c00b00741748b6dacmr27360129ejc.479.1662397724538;
        Mon, 05 Sep 2022 10:08:44 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m14-20020a50ef0e000000b0043d5ead65a6sm6690584eds.84.2022.09.05.10.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:08:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v8 3/5] iommu: dma: Use of_iommu_get_resv_regions()
Date:   Mon,  5 Sep 2022 19:08:31 +0200
Message-Id: <20220905170833.396892-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905170833.396892-1-thierry.reding@gmail.com>
References: <20220905170833.396892-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For device tree nodes, use the standard of_iommu_get_resv_regions()
implementation to obtain the reserved memory regions associated with a
device.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/dma-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 17dd683b2fce..67be1542a994 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -24,6 +24,7 @@
 #include <linux/memremap.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/of_iommu.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
@@ -390,6 +391,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
 		iort_iommu_get_resv_regions(dev, list);
 
+	if (dev->of_node)
+		of_iommu_get_resv_regions(dev, list);
 }
 EXPORT_SYMBOL(iommu_dma_get_resv_regions);
 
-- 
2.37.2

