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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6006AC43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 289E32087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKbTCxXl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgIQKIT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgIQKIT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:19 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6572EC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:18 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d4so1381763wmd.5
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LTTvnN7h1giqzGBn0jgQpPTrpXXAfS+8xuM6lWplWks=;
        b=jKbTCxXlp+3Uc6wfjxw56OIRQmme7ezOZtxJGDNCbD7aRPVlc93adtuw0LPBME9/w1
         xlj3jeFHkxAkW6+dvIXa5YEU0n6tzKZbdF0QwL3WIWKSND3cxX+oIL0Scmd9NviJya/l
         fnxOzR4sCdfQeOiJ8w5HVlGx6YPvHVPxlS7bs8bJbDrRnAAD2YuA6VPxESKbj3L32Wio
         JizhqGsk6tNNI6oP7W54JwKsEDsmhfdliDcA7iTd4OfdL1dJKzcg5OEEzEXZ545q+dsv
         AZnDTj51F9tYJVu2oXYQHLWYeLgfvPhZ74xReaTL4BgckTUAo+MH6frKsNBuZgwBBiqL
         LEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTTvnN7h1giqzGBn0jgQpPTrpXXAfS+8xuM6lWplWks=;
        b=QnAF1XuSdU8L9wIL3HgVpCSgnzjofbWQNssHUkUWTlt+UdRd8NKWe9eBffMNziRun7
         WCkx/3oytqL/dcKQVO7baqadYDFwNRH9jpW3nvUP0gUZRpsMP3F+ZPPL0vwLjiI8nQKN
         GqysP/a5fx5IN848ie97PKaVgyswnxNX4KbI+go02DwPFNLTUS7iaenG35QkQ7bzkhkv
         bMqfsv2P9VRmiD5+oJjur00tcV0RxGFtiB0FLzwU0zaq/hBafGBk+vbK5agfAk22Tny2
         9X5JHhODr4UtPe/F73JsoMkxhK4/wwSmmp9WnDZg+kTnIveqOp+xDFLiC61esNBglg+4
         dR2g==
X-Gm-Message-State: AOAM530KMQngqLBJovujkEX2QW3YQs+tfCjk5kJGQtcbL0HlIacDikYr
        4sHtCoKxN3rOc4AdqrYjcxU=
X-Google-Smtp-Source: ABdhPJwNbdThURz1CUtSnCJ4UFy3jXBerwtQmeCNSsUIzbbbHJwdvA/uDil996hN/ViJaR0YLibrmA==
X-Received: by 2002:a1c:9cd3:: with SMTP id f202mr9133765wme.148.1600337297045;
        Thu, 17 Sep 2020 03:08:17 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id y1sm10104979wma.36.2020.09.17.03.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/14] soc/tegra: fuse: Extract tegra_get_platform()
Date:   Thu, 17 Sep 2020 12:07:45 +0200
Message-Id: <20200917100752.3516153-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This function extracts the PRE_SI_PLATFORM field from the HIDREV
register and can be used to determine which platform the kernel runs on
(silicon, simulation, ...). Note that while only Tegra194 and later
define this field, it should be safe to call this on prior generations
as well since this field should read as 0, indicating silicon.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    | 2 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 5 +++++
 include/soc/tegra/fuse.h               | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index d1f8dd0289e6..7e6b6ee59120 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -336,7 +336,7 @@ static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
 	 * platform type is silicon and all other non-zero values indicate
 	 * the type of simulation platform is being used.
 	 */
-	return sprintf(buf, "%d\n", (tegra_read_chipid() >> 20) & 0xf);
+	return sprintf(buf, "%d\n", tegra_get_platform());
 }
 
 static DEVICE_ATTR_RO(platform);
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 8e416ad91ee2..92a2d646c183 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -47,6 +47,11 @@ u8 tegra_get_minor_rev(void)
 	return (tegra_read_chipid() >> 16) & 0xf;
 }
 
+u8 tegra_get_platform(void)
+{
+	return (tegra_read_chipid() >> 20) & 0xf;
+}
+
 u32 tegra_read_straps(void)
 {
 	WARN(!chipid, "Tegra ABP MISC not yet available\n");
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 1097feca41ed..214908fc5581 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -23,6 +23,7 @@
 
 u32 tegra_read_chipid(void);
 u8 tegra_get_chip_id(void);
+u8 tegra_get_platform(void);
 
 enum tegra_revision {
 	TEGRA_REVISION_UNKNOWN = 0,
-- 
2.28.0

