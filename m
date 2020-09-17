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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D40CC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 283EA2087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1kc3i+c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgIQKIX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgIQKIV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:21 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11448C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z4so1411619wrr.4
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=czdPuULQn7FXaX//w2/IuNy72dljJKMueVpajrgEMGA=;
        b=Y1kc3i+cLkTZfUYpVNr3/Tt0RQyTgiU9SEedoROI54EgQXgxtHdTdtvff5YiCXZObX
         nwJkfeZX2FVl8Pbq/OHERdX67hcA56er5Otjf/w10OYzFWiD7sUaBDQDtjFKpqG1kZPq
         t7oM42g95hMQ+hhrfVCHML01DMqabJ/XkHtbaOQBfiHBfaKOG0KNZGjM4rJnV/sK2Z7A
         k54rVdPO96NJtecrHKY+AaJqycIuuyN+ryJRfMEBz2bR3pTSGJzVkTNh7hFYFRvdQ4Rx
         cgXvPTTlBy/L8657GEBxlDJn0Pzm2Aue9DZf48UYWFwfdE5puCfGJu7TPnS6vBIhSXb1
         Uj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=czdPuULQn7FXaX//w2/IuNy72dljJKMueVpajrgEMGA=;
        b=MrOHhkN/M105ft9hX55eigyFLfXz/GbMjDOzcreJAR2mysrX1JtEQrYtgMGDh3AzZf
         uTeH+rwhtUCOWba+hXfqk+PQV2JPOVI9SH6m4SSiMVfE0hiqa8D207GZgActqZz2L4Co
         AEi66FPOold+mMlibucMSGzYJ/6bYba0/OG0X/fs77VvDQthZmVsciSRZjG0Q/6/bYCT
         lfPe9fr2t15MeSC2nvy8FoeIWv/w04o+UZF+UStENnvxN5NRcRhSHq3Wfw3ZIPHP8LNw
         FouKWjrpiBjd4gKH6/OkPNJsyzNoPva9OfdkaowjmAsr/NcZ7P3fnGKYQQxn2gdrJvlU
         S0sg==
X-Gm-Message-State: AOAM531kGi8Wcltv3eQVSmkxA4XOYwZI8V46UXdutJ/XerZgp/+zDI7L
        oN2+r25R7bP2WWTQR5c9fZg=
X-Google-Smtp-Source: ABdhPJzwajaKK7EDJ5+O0dX6h6sN+JcQShuZCuXKogyfNUjco+ykT2nWvjnmMPUymdEl2HwB0AkFtQ==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr31044659wrw.221.1600337299786;
        Thu, 17 Sep 2020 03:08:19 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o4sm38072371wrv.86.2020.09.17.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/14] soc/tegra: fuse: Implement tegra_is_silicon()
Date:   Thu, 17 Sep 2020 12:07:46 +0200
Message-Id: <20200917100752.3516153-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This function can be used by drivers to determine whether code is
running on silicon or on a simulation platform.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- fix return value for pre-Tegra194 chips and add comment explaining
  why we always return true for those chips

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 19 +++++++++++++++++++
 include/soc/tegra/fuse.h               |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 92a2d646c183..946a2d9ad117 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -52,6 +52,25 @@ u8 tegra_get_platform(void)
 	return (tegra_read_chipid() >> 20) & 0xf;
 }
 
+bool tegra_is_silicon(void)
+{
+	switch (tegra_get_chip_id()) {
+	case TEGRA194:
+		if (tegra_get_platform() == 0)
+			return true;
+
+		return false;
+	}
+
+	/*
+	 * Chips prior to Tegra194 have a different way of determining whether
+	 * they are silicon or not. Since we never supported simulation on the
+	 * older Tegra chips, don't bother extracting the information and just
+	 * report that we're running on silicon.
+	 */
+	return true;
+}
+
 u32 tegra_read_straps(void)
 {
 	WARN(!chipid, "Tegra ABP MISC not yet available\n");
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 214908fc5581..a9db917a1d06 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -24,6 +24,7 @@
 u32 tegra_read_chipid(void);
 u8 tegra_get_chip_id(void);
 u8 tegra_get_platform(void);
+bool tegra_is_silicon(void);
 
 enum tegra_revision {
 	TEGRA_REVISION_UNKNOWN = 0,
-- 
2.28.0

