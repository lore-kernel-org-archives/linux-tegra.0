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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A93C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B3132087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPokwmFv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgIQKIZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgIQKIY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:24 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C43CC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:23 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k18so1424192wmj.5
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NUyGgCyoC1I2akC3uVjZ2yqsqNamKvu1koU581xQ5q0=;
        b=NPokwmFvc00RyEnIY7d3kKxBS3lsjzXPwvmFpbEUiIWZSupOg9r8KHnHgZqVYrSSWi
         frxFGj5GSkVnxhMaEcrq8di7lWa+9c35NNkP2kg00tMzZLzkp7rYTB5X0tYLAN7sa2lt
         haOQqw1TEIfwIMFYBcAohNjBhQ9S5aNN8KuZexCQmNBqYKi3DdyMQiIcFjupdJZcUtpD
         NwrRVtcvjffaf+9KUkd0VYUH1WLmfQVnIoOMszH+ielX07UfaHhcrcuPbuRguB0OG5Qf
         3om8XwOOYq8bSSXSSUI3c4GKkNRpiz0KFAETGtdM2ud6DGozhOAjSCulsiNsDSmiHEFj
         wGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NUyGgCyoC1I2akC3uVjZ2yqsqNamKvu1koU581xQ5q0=;
        b=J0G/EAa/VfMVAz/RQ3zmNIW0LmgDU1EV1JZUXD99N9hcVnEqQozDPU9bAC3Kc2YMYM
         aGSsH8jpkJq5xvspwMdkDpKVzbJL3yuf5GgN1ziOLOGIftC5n+tpcRfOUM7/5LOTLFP3
         m1mgCYu7xdSQpDghYq68WmYz4aCzP2iaGgdzolomGLJuk0Bcbyjgwb08UKlvU11yTn7z
         dSvUuy4Ml6fxsT0UvXCV+XUPbeJv+RUO0UwOBWpfBNFHvX3Q9Bv7zyZHx0AuS1pjUw5d
         PsRTsOKUUR4pDsh3zJ6FVpWVvnileozJ0tp0DJe+cqYJOGRZc3lDR8zHWFxnFNwV4J8G
         mmbA==
X-Gm-Message-State: AOAM532gBNbuB31nik5/RcF3yw8oQFLQlAC3HMGlvYPOYj63z2796oiI
        yKVv16Mlx92cdBT+y21OOTA=
X-Google-Smtp-Source: ABdhPJzsPPiyeU6zd4gP5gpwmAKBoZ5OjGdiGNbz24uHaFHfG89gdkXjxpwiFYDRlPF+wGLUpWXGNQ==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr9608681wmd.78.1600337302350;
        Thu, 17 Sep 2020 03:08:22 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i11sm38592653wre.32.2020.09.17.03.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 09/14] soc/tegra: fuse: Add Tegra234 support
Date:   Thu, 17 Sep 2020 12:07:47 +0200
Message-Id: <20200917100752.3516153-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add support for FUSE block found on the Tegra234 SoC, which is largely
similar to the IP found on previous generations.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    |  6 +++++-
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 30 ++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h          | 10 ++++++++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  1 +
 include/soc/tegra/fuse.h               |  1 +
 5 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 7e6b6ee59120..94b60a692b51 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -49,6 +49,9 @@ static struct tegra_fuse *fuse = &(struct tegra_fuse) {
 };
 
 static const struct of_device_id tegra_fuse_match[] = {
+#ifdef CONFIG_ARCH_TEGRA_234_SOC
+	{ .compatible = "nvidia,tegra234-efuse", .data = &tegra234_fuse_soc },
+#endif
 #ifdef CONFIG_ARCH_TEGRA_194_SOC
 	{ .compatible = "nvidia,tegra194-efuse", .data = &tegra194_fuse_soc },
 #endif
@@ -326,7 +329,8 @@ const struct attribute_group tegra_soc_attr_group = {
 	.attrs = tegra_soc_attr,
 };
 
-#ifdef CONFIG_ARCH_TEGRA_194_SOC
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 85accef41fa1..9ea7f0168457 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -356,3 +356,33 @@ const struct tegra_fuse_soc tegra194_fuse_soc = {
 	.soc_attr_group = &tegra194_soc_attr_group,
 };
 #endif
+
+#if defined(CONFIG_ARCH_TEGRA_234_SOC)
+static const struct nvmem_cell_lookup tegra234_fuse_lookups[] = {
+	{
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration",
+		.dev_id = "3520000.padctl",
+		.con_id = "calibration",
+	}, {
+		.nvmem_name = "fuse",
+		.cell_name = "xusb-pad-calibration-ext",
+		.dev_id = "3520000.padctl",
+		.con_id = "calibration-ext",
+	},
+};
+
+static const struct tegra_fuse_info tegra234_fuse_info = {
+	.read = tegra30_fuse_read,
+	.size = 0x300,
+	.spare = 0x280,
+};
+
+const struct tegra_fuse_soc tegra234_fuse_soc = {
+	.init = tegra30_fuse_init,
+	.info = &tegra234_fuse_info,
+	.lookups = tegra234_fuse_lookups,
+	.num_lookups = ARRAY_SIZE(tegra234_fuse_lookups),
+	.soc_attr_group = &tegra194_soc_attr_group,
+};
+#endif
diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.h
index 9d4fc315a007..e057a58e2060 100644
--- a/drivers/soc/tegra/fuse/fuse.h
+++ b/drivers/soc/tegra/fuse/fuse.h
@@ -115,9 +115,17 @@ extern const struct tegra_fuse_soc tegra210_fuse_soc;
 extern const struct tegra_fuse_soc tegra186_fuse_soc;
 #endif
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+extern const struct attribute_group tegra194_soc_attr_group;
+#endif
+
 #ifdef CONFIG_ARCH_TEGRA_194_SOC
 extern const struct tegra_fuse_soc tegra194_fuse_soc;
-extern const struct attribute_group tegra194_soc_attr_group;
+#endif
+
+#ifdef CONFIG_ARCH_TEGRA_234_SOC
+extern const struct tegra_fuse_soc tegra234_fuse_soc;
 #endif
 
 #endif
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 946a2d9ad117..0e4eb2656f44 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -56,6 +56,7 @@ bool tegra_is_silicon(void)
 {
 	switch (tegra_get_chip_id()) {
 	case TEGRA194:
+	case TEGRA234:
 		if (tegra_get_platform() == 0)
 			return true;
 
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index a9db917a1d06..c702bd2911bc 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -14,6 +14,7 @@
 #define TEGRA210	0x21
 #define TEGRA186	0x18
 #define TEGRA194	0x19
+#define TEGRA234	0x23
 
 #define TEGRA_FUSE_SKU_CALIB_0	0xf0
 #define TEGRA30_FUSE_SATA_CALIB	0x124
-- 
2.28.0

