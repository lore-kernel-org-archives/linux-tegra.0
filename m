Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB181C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4DF76108E
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:06:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235042AbhKLNJb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:09:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235035AbhKLNJa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:09:30 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1223C061766;
        Fri, 12 Nov 2021 05:06:39 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d5so15445714wrc.1;
        Fri, 12 Nov 2021 05:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fTHHJ+UWi7BdrOxsQnCQYqnm3vf9rD3LvX2xHPI4jAI=;
        b=mwkS7IMU7+8PcUJ2Jrc3IYtJEnEEj8igkJcWrc/z2UNmo440xx6pTKTPWZCP2hU/9p
         3yU1sHCl53OD887aMkdW8YyEMb5iyIft6Z44lCFpmw/KNQb7Ia392qkz++t6IqdxlGhk
         X+nJzGnDtkdWoJ8MipkzrfGxrgIe7LGKT+gHmealbZa6dIHe20y/4F8ku8S/At8l4Ndf
         gwe7hNIHYlanQTYhwJwr+ejIhMTPJrDgpKRdVa3oRIETdFb/VDYa0RoL57p6/ge7cDIB
         SpofBNodfuCmq7WlnNbvacUtNv3yjBsa8ziDfdLw7HiLFdRuFyYQEnqsVtl1izb8LjzH
         gVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fTHHJ+UWi7BdrOxsQnCQYqnm3vf9rD3LvX2xHPI4jAI=;
        b=0SuKi46UI8d+AU89tDXInMQtAFfQ7ahLeGWzBwrzRL21xsRXD7KEnqU4+XsNwacNtP
         GEvWSfcJdjwTDi19ASzwwQdkYlCjrDerrY8DthCJ6XCMVxL4yhwFB8oo6Jk/NCkKRYaW
         HGxARd9uojfyoc2plaudfx/RaKXmILThzAnLFvo0YSFZl7ifBAlCrtxWaFR+5csmZREJ
         Mtnpc/VtayGRoO8pFzJ8oKMvmVGqwcCsZr2TeqOwe+Jv85NVp5vqwkWupDr8eOOMGAKz
         UdvEIhmpnifvFZg/etAk/5e5TcP8gyiZH4hwILStPYnurCveT9KPiYSHqWCFsTUHhR5U
         aVng==
X-Gm-Message-State: AOAM530DUsw0RjRvLpnQhO2Cnc6lzSNiNFa4+SVGtFWUX0GDeXJZwieU
        V2jGG0/RJc9BdHDutnGtDyM=
X-Google-Smtp-Source: ABdhPJyO3NIoTWLP/P1jsV+QBZYEQcxojCX4d2t7FoD9vaKJZdB3vff2ZfFELiRZpoRm9fHf+c9xUA==
X-Received: by 2002:a05:6000:154b:: with SMTP id 11mr18979572wry.394.1636722398235;
        Fri, 12 Nov 2021 05:06:38 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id k13sm1074413wri.6.2021.11.12.05.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:06:37 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] memory: tegra: Add Tegra234 support
Date:   Fri, 12 Nov 2021 14:06:25 +0100
Message-Id: <20211112130627.3682795-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112130627.3682795-1-thierry.reding@gmail.com>
References: <20211112130627.3682795-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The memory controller and external memory controller found on Tegra234
is similar to the version found on earlier SoCs but supports a number of
new memory clients.

Add initial memory client definitions for the Tegra234 so that the SMMU
stream ID override registers can be properly programmed at boot time.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/Makefile       |  1 +
 drivers/memory/tegra/mc.c           |  3 ++
 drivers/memory/tegra/mc.h           |  7 ++-
 drivers/memory/tegra/tegra186-emc.c |  3 ++
 drivers/memory/tegra/tegra234.c     | 81 +++++++++++++++++++++++++++++
 5 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 drivers/memory/tegra/tegra234.c

diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index c992e87782d2..1df0b43e40b1 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -9,6 +9,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra124.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra194.o
+tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra234.o
 
 obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
 
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 44b4a4080920..bf3abb6d8354 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -44,6 +44,9 @@ static const struct of_device_id tegra_mc_of_match[] = {
 #endif
 #ifdef CONFIG_ARCH_TEGRA_194_SOC
 	{ .compatible = "nvidia,tegra194-mc", .data = &tegra194_mc_soc },
+#endif
+#ifdef CONFIG_ARCH_TEGRA_234_SOC
+	{ .compatible = "nvidia,tegra234-mc", .data = &tegra234_mc_soc },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 1e492989c363..062886e94c04 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -137,6 +137,10 @@ extern const struct tegra_mc_soc tegra186_mc_soc;
 extern const struct tegra_mc_soc tegra194_mc_soc;
 #endif
 
+#ifdef CONFIG_ARCH_TEGRA_234_SOC
+extern const struct tegra_mc_soc tegra234_mc_soc;
+#endif
+
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC) || \
     defined(CONFIG_ARCH_TEGRA_114_SOC) || \
     defined(CONFIG_ARCH_TEGRA_124_SOC) || \
@@ -147,7 +151,8 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
 #endif
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_194_SOC)
+    defined(CONFIG_ARCH_TEGRA_194_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_mc_ops tegra186_mc_ops;
 #endif
 
diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 746c4ef2c0af..54b47ca33483 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -272,6 +272,9 @@ static const struct of_device_id tegra186_emc_of_match[] = {
 #endif
 #if defined(CONFIG_ARCH_TEGRA_194_SOC)
 	{ .compatible = "nvidia,tegra194-emc" },
+#endif
+#if defined(CONFIG_ARCH_TEGRA_234_SOC)
+	{ .compatible = "nvidia,tegra234-emc" },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
new file mode 100644
index 000000000000..45efc5139960
--- /dev/null
+++ b/drivers/memory/tegra/tegra234.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <soc/tegra/mc.h>
+
+#include <dt-bindings/memory/tegra234-mc.h>
+
+#include "mc.h"
+
+static const struct tegra_mc_client tegra234_mc_clients[] = {
+	{
+		.id = TEGRA234_MEMORY_CLIENT_SDMMCRAB,
+		.name = "sdmmcrab",
+		.sid = TEGRA234_SID_SDMMC4,
+		.regs = {
+			.sid = {
+				.override = 0x318,
+				.security = 0x31c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_SDMMCWAB,
+		.name = "sdmmcwab",
+		.sid = TEGRA234_SID_SDMMC4,
+		.regs = {
+			.sid = {
+				.override = 0x338,
+				.security = 0x33c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_BPMPR,
+		.name = "bpmpr",
+		.sid = TEGRA234_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x498,
+				.security = 0x49c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_BPMPW,
+		.name = "bpmpw",
+		.sid = TEGRA234_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x4a0,
+				.security = 0x4a4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_BPMPDMAR,
+		.name = "bpmpdmar",
+		.sid = TEGRA234_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x4a8,
+				.security = 0x4ac,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_BPMPDMAW,
+		.name = "bpmpdmaw",
+		.sid = TEGRA234_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x4b0,
+				.security = 0x4b4,
+			},
+		},
+	},
+};
+
+const struct tegra_mc_soc tegra234_mc_soc = {
+	.num_clients = ARRAY_SIZE(tegra234_mc_clients),
+	.clients = tegra234_mc_clients,
+	.num_address_bits = 40,
+	.ops = &tegra186_mc_ops,
+};
-- 
2.33.1

