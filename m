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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD32C433E9
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Jan 2021 16:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA66922CB2
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Jan 2021 16:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbhAWQgT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 23 Jan 2021 11:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbhAWQgR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 23 Jan 2021 11:36:17 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB9BC0613D6;
        Sat, 23 Jan 2021 08:35:36 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id p21so6779800lfu.11;
        Sat, 23 Jan 2021 08:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RdS8PzD7Ibjy6mHF6U6e866r37t0ObE5ee8FBFWPC9o=;
        b=n1oK2wPmc1zKJb5temOL8TvyDObS4K6TbF/uNveszGj58KnxQ8qkJQWgHGcE04I3Po
         zkmDcN+8OFVBBCCvoZbw+weeXu+xBHEL961YnDu1RKSpwy26/gWmltgOBTBsCGxhHRSd
         p6roLj+8Uvk5JYIougyZFPFzHolpXPbyifYM+HMihlleYJ8XIV/XvNLPuGDEISais4sw
         U85ppclVzLMH2g8bXqeTBwDCe/djUeJatZcrnyazXlu0e9DLMjtOXif++d1p5XBPK4/G
         ft4PDyDcCNW4BsjNQ4TSlwFyRgQoqqM3SxbUJT15bJOww9+PNGKiqWWjt2RTehJX027T
         gYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RdS8PzD7Ibjy6mHF6U6e866r37t0ObE5ee8FBFWPC9o=;
        b=nKxpDKlwa23wWSU2uK2uRkVsOBsnkH58R7P0CUD4M81Z4CfA8UtLOfB4BvrqUt8miQ
         Ojp4EMbCMXvCrFYUhUekjo3p3uZ6aftqk3EqZrRbWZmwqMcdQB7Xuxg4YwKJ+N9k2r8C
         iwk4iQH1fmo6A4nPRG7Z7Az5gr7gm9SmxBiirVw6ftVhK8dlK+dlZMNycICVAJfpFPsb
         xB9F1/ODYhsisTG0If45Oznjmulp9i7W3adVlYRB+8Ek2qky5vpCovvRC65frpdch1UY
         1q0tWZkijtOIJgoLyjkZS3dhqPiMte+0x8S/+sZsKsfmxU1zwSw44tFV8azHwfedfA+E
         w/rA==
X-Gm-Message-State: AOAM531yp6GqMxzcXahhG0aK4bfdQxzTryR6e+Wtu6KYsZ8jjJm5zZ3e
        BHc95tapOwZx4AKo9WSzMWo=
X-Google-Smtp-Source: ABdhPJxmBRw6XZAG+XWdhpK/dfFEU+9wpJLG3Cm/6r4knxc/zjJn8/WAFf+TkI5uWnN/lkCZnNQ0Ug==
X-Received: by 2002:ac2:59ce:: with SMTP id x14mr135834lfn.545.1611419734536;
        Sat, 23 Jan 2021 08:35:34 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id r26sm78594lfi.295.2021.01.23.08.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 08:35:33 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] reset: Add devm_reset_control_get_optional_exclusive_released()
Date:   Sat, 23 Jan 2021 19:34:45 +0300
Message-Id: <20210123163445.24474-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

NVIDIA Tegra DRM and media drivers will need a resource-managed-optional
variant of reset_control_get_exclusive_released() in order to switch away
from a legacy Tegra-specific PD API to a GENPD API without much hassle.
Add the new reset helper to the reset API.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Hello Philipp,

This patch is a prerequisite for a power domain enablement using
GENPD API on NVIDIA Tegra20/30 SoCs. The hardware resets are acquired
by a Tegra PMC (Power Management Controller) driver until device is
RPM-resumed if GENPD API is used, and thus, device drivers need to
request resets in a released state. The resets are also optional,
depending on hardware and DTB versions. This is why we will need the
new helper. Will be awesome if you could pick up this patch for v5.12,
this will help to avoid inter-subsystem dependencies for the driver
patches that will target v5.13. Thanks in advance!

 include/linux/reset.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/reset.h b/include/linux/reset.h
index 439fec7112a9..b9109efa2a5c 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -362,6 +362,25 @@ __must_check devm_reset_control_get_exclusive_released(struct device *dev,
 	return __devm_reset_control_get(dev, id, 0, false, false, false);
 }
 
+/**
+ * devm_reset_control_get_optional_exclusive_released - resource managed
+ *                                                      reset_control_get_optional_exclusive_released()
+ * @dev: device to be reset by the controller
+ * @id: reset line name
+ *
+ * Managed-and-optional variant of reset_control_get_exclusive_released(). For
+ * reset controllers returned from this function, reset_control_put() is called
+ * automatically on driver detach.
+ *
+ * See reset_control_get_exclusive_released() for more information.
+ */
+static inline struct reset_control *
+__must_check devm_reset_control_get_optional_exclusive_released(struct device *dev,
+								const char *id)
+{
+	return __devm_reset_control_get(dev, id, 0, false, true, false);
+}
+
 /**
  * devm_reset_control_get_shared - resource managed reset_control_get_shared()
  * @dev: device to be reset by the controller
-- 
2.29.2

