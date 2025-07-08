Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74942D97BA;
	Tue,  8 Jul 2025 10:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971984; cv=none; b=EhNI6OZvQvfcwySJp2vsLZj1GRzFGQRFSb7fShz7XZ01e4OMnS0k+x41e9DWZqfbDCVz4E5P6dwNC2O3lye240Or35qqYnTlK30YRIOB/WpGCdtTuqwIlXg2tiOi2rLnl34gPo0fm+VBp8cJ2SD4MLLN3fegBQdN0JOnvO29VMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971984; c=relaxed/simple;
	bh=4os34tukUSCcoB9zTgeHWBJhPJD9mgXMNpSqiP6eJyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bt4XuREyWHtER98ufSMGINIU1gleUOQ9pLxb6weLOBvqLTCXsvvvdiQk2h3rBstorODSl8ppCQentXaFt8yUn+WwVZ33/kCPjZYmAsZUxEhg+aqi5nLTaJ2KR27QQRZKzh7RcnQvV3Mi46rvajshoSiiyxluDC+NKlqjoLzx3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/70UywE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/70UywE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453634d8609so28543035e9.3;
        Tue, 08 Jul 2025 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751971980; x=1752576780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6HxebNTtnWCflsD0iD9yhWDvkU41a99jL+L8u3pzNA=;
        b=a/70UywESU3uV52VxnBcw9rUPUkIVZ6zSpKVcNoU1Uh8SSSqARWaCRxlkXzsdhTTpv
         0rNvqBJTbO7UZMIvoB/W1LiIF0V9I0y6lP4JlsrmncmxeIdw5qfA00QRcVVftJQO8G/r
         5CazeZ1vqSC1fIgV2400neEFTiGjFpR7BSvR+4XMmR7s+IBqXbFBwvY9vUpUzZAT0c4b
         ajXOinVkjTbfJkdTnOg1A2fnoGXia5cKCmKdhNm+FwVBeyuk0iU47ZoRq2EZa0laIt/8
         L7+E6946Y+9BgEV5k6IUFrrfksxKShDA8MBtdoGeNgvl1MbMQaPn10UwLuevNXvz8P/W
         J2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971980; x=1752576780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6HxebNTtnWCflsD0iD9yhWDvkU41a99jL+L8u3pzNA=;
        b=RtAvxjsEyo7DQSoSLOtMzO+yyKsU97WN2e7w0uORfYgPCJu8P7+mGDUNbvaM5kGx1A
         lTZuDu7VIdgB52/ddKEIihIQr+fjgEItXv4ZQ6obihEcsnHOoC0dd/daZvXhoi1rSFmQ
         5Tcjh1pKMo+kDBA2QMsnsEax93bixz70+JoRIhPuzGxgDRJH2MIISI4Xj+a7nM9ENhbC
         BvWqWejBf7tkZYba8SXNcl8SGVZVHQZTsKO+i91HgoiByMZUzWuX6W/WxjjBW11JeL8q
         kch9fGCmkOa0dGlnyt+lwFwOce2si7ZzylhRGaho1lLCavbatF9vhgmWgGgowIJ3AgR5
         S1+A==
X-Forwarded-Encrypted: i=1; AJvYcCVansYrNUltEAef1ZuJFsLcTs9VpCsJVVNlJNcgH3gry4D7k3qxGWqaL40BTD8H+GE1ByYzMi6qITNxorU=@vger.kernel.org, AJvYcCVsf66XYRa7G70TkFx0SQikoHWagx885w1cJ4u6Zz9tgcr9dyAIPyjbD61lEAkF864ZOre4AiTg3I8+uvZ6@vger.kernel.org, AJvYcCXgfvGI/+YVJr3t7+clqhTmJaz8yC5IEiXL0w65R0uf/WkIxYde3+x54aD1K8Rr4aRKYG7Y68OKs3s0@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDYZg0OkL4wQZKD/SBd17LFoWU9hK3c7wKYa/hMqwqsdIvWFD
	VKtMzM7yJ60jdM8wWLM3b29ITf9w5BPGlUwTcND3Osbv4L/Gm7p/QDLd
X-Gm-Gg: ASbGncuUMNPu9a+Wnux4bYZf9OsOzxk7ju3uDkkFjVuYJFJizREQnzrCUsTad5W6zK3
	83ynHQS3KD+mNhqwZWYdZIscmZpDDOg0SGB8xsMToy4lDHh0UBwILJ7iCMZhn/Q1QEKD9AVBqhq
	Vq7xMmwuv6gQ78ex8M5mGnWcsmzrZXItLlRinZxiAkjPNgnbxscKkuFLfO23daLagzvwo/a0qlQ
	1qLiJ6jYClrJDuqq2tp/vM9+XbtLvok7q2IFLZVLcv3dPJnurhirGQWtnckCO4s8b0bB+5fEFQt
	Hax5dOzI7yF3fAWhFPi+A+h28beuXm46bkn8pdkOk9/Qf+5z2AnmkUsvUPSAIIQ880SfGe0hI5G
	WP48xng6q38lhgRJp9lL7F5JqjafkSOecRJgjKsMRc5+HW433Opk6Qg==
X-Google-Smtp-Source: AGHT+IEG2Plv1gj+rljPJxC0ndbx2NSe3k9EdRhITIzAe8/bum514d5tkUca/o/OwiFJ6ZI1qKnPnA==
X-Received: by 2002:a05:600c:64ca:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-454cd5461a7mr20244955e9.32.1751971979877;
        Tue, 08 Jul 2025 03:52:59 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454cd4938ffsm18185685e9.21.2025.07.08.03.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:52:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] memory: tegra: Add Tegra264 MC and EMC support
Date: Tue,  8 Jul 2025 12:52:45 +0200
Message-ID: <20250708105245.1516143-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708105245.1516143-1-thierry.reding@gmail.com>
References: <20250708105245.1516143-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sumit Gupta <sumitg@nvidia.com>

Add support to enable Memory Controller (MC) and External Memory
Controller (EMC) drivers for Tegra264. The nodes for MC and EMC are
mostly the same as Tegra234 but differ in number of channels and
interrupt numbers.

The patch also adds the bandwidth manager definitions required for
Tegra264 and uses them to populate the memory client table. All of
these are needed to properly enable memory interconnect (ICC) support.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/Makefile         |   2 +
 drivers/memory/tegra/mc.c             |   5 +-
 drivers/memory/tegra/mc.h             |   9 +-
 drivers/memory/tegra/tegra186-emc.c   |   5 +-
 drivers/memory/tegra/tegra186.c       |  17 +-
 drivers/memory/tegra/tegra264-bwmgr.h |  50 ++++
 drivers/memory/tegra/tegra264.c       | 313 ++++++++++++++++++++++++++
 7 files changed, 395 insertions(+), 6 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra264-bwmgr.h
 create mode 100644 drivers/memory/tegra/tegra264.c

diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 0750847dac3c..6334601e6120 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -10,6 +10,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra194.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra186.o tegra234.o
+tegra-mc-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra186.o tegra264.o
 
 obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
 
@@ -21,5 +22,6 @@ obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o
 obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-emc.o
 obj-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186-emc.o
 obj-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra186-emc.o
+obj-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra186-emc.o
 
 tegra210-emc-y := tegra210-emc-core.o tegra210-emc-cc-r21021.o
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index bd5b58f1fd42..6edb210287dc 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -48,6 +48,9 @@ static const struct of_device_id tegra_mc_of_match[] = {
 #endif
 #ifdef CONFIG_ARCH_TEGRA_234_SOC
 	{ .compatible = "nvidia,tegra234-mc", .data = &tegra234_mc_soc },
+#endif
+#ifdef CONFIG_ARCH_TEGRA_264_SOC
+	{ .compatible = "nvidia,tegra264-mc", .data = &tegra264_mc_soc },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index c3f6655bec60..1d97cf4d3a94 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #ifndef MEMORY_TEGRA_MC_H
@@ -182,6 +182,10 @@ extern const struct tegra_mc_soc tegra194_mc_soc;
 extern const struct tegra_mc_soc tegra234_mc_soc;
 #endif
 
+#ifdef CONFIG_ARCH_TEGRA_264_SOC
+extern const struct tegra_mc_soc tegra264_mc_soc;
+#endif
+
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC) || \
     defined(CONFIG_ARCH_TEGRA_114_SOC) || \
     defined(CONFIG_ARCH_TEGRA_124_SOC) || \
@@ -193,7 +197,8 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
     defined(CONFIG_ARCH_TEGRA_194_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_234_SOC)
+    defined(CONFIG_ARCH_TEGRA_234_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_264_SOC)
 extern const struct tegra_mc_ops tegra186_mc_ops;
 #endif
 
diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index bc807d7fcd4e..d6cd90c7ad53 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2019 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2019-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -393,6 +393,9 @@ static const struct of_device_id tegra186_emc_of_match[] = {
 #endif
 #if defined(CONFIG_ARCH_TEGRA_234_SOC)
 	{ .compatible = "nvidia,tegra234-emc" },
+#endif
+#if defined(CONFIG_ARCH_TEGRA_264_SOC)
+	{ .compatible = "nvidia,tegra264-emc" },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 1b3183951bfe..aee11457bf8e 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/io.h>
@@ -26,11 +26,24 @@
 static int tegra186_mc_probe(struct tegra_mc *mc)
 {
 	struct platform_device *pdev = to_platform_device(mc->dev);
+	struct resource *res;
 	unsigned int i;
 	char name[8];
 	int err;
 
-	mc->bcast_ch_regs = devm_platform_ioremap_resource_byname(pdev, "broadcast");
+	/*
+	 * From Tegra264, the SID region is not present in MC node and BROADCAST is first.
+	 * The common function 'tegra_mc_probe()' already maps first region entry from DT.
+	 * Check if the SID region is present in DT then map BROADCAST. Otherwise, consider
+	 * the first entry mapped in mc probe as the BROADCAST region. This is done to avoid
+	 * mapping the region twice when SID is not present and keep backward compatibility.
+	 */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sid");
+	if (res)
+		mc->bcast_ch_regs = devm_platform_ioremap_resource_byname(pdev, "broadcast");
+	else
+		mc->bcast_ch_regs = mc->regs;
+
 	if (IS_ERR(mc->bcast_ch_regs)) {
 		if (PTR_ERR(mc->bcast_ch_regs) == -EINVAL) {
 			dev_warn(&pdev->dev,
diff --git a/drivers/memory/tegra/tegra264-bwmgr.h b/drivers/memory/tegra/tegra264-bwmgr.h
new file mode 100644
index 000000000000..93bfceaac9c8
--- /dev/null
+++ b/drivers/memory/tegra/tegra264-bwmgr.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 NVIDIA CORPORATION.  All rights reserved. */
+
+#ifndef MEMORY_TEGRA_TEGRA264_BWMGR_H
+#define MEMORY_TEGRA_TEGRA264_BWMGR_H
+
+#define TEGRA264_BWMGR_ICC_PRIMARY	1
+#define TEGRA264_BWMGR_DEBUG		2
+#define TEGRA264_BWMGR_CPU_CLUSTER0	3
+#define TEGRA264_BWMGR_CPU_CLUSTER1	4
+#define TEGRA264_BWMGR_CPU_CLUSTER2	5
+#define TEGRA264_BWMGR_CPU_CLUSTER3	6
+#define TEGRA264_BWMGR_CPU_CLUSTER4	7
+#define TEGRA264_BWMGR_CPU_CLUSTER5	8
+#define TEGRA264_BWMGR_CPU_CLUSTER6	9
+#define TEGRA264_BWMGR_CACTMON		10
+#define TEGRA264_BWMGR_DISPLAY		11
+#define TEGRA264_BWMGR_VI		12
+#define TEGRA264_BWMGR_APE		13
+#define TEGRA264_BWMGR_VIFAL		14
+#define TEGRA264_BWMGR_GPU		15
+#define TEGRA264_BWMGR_EQOS		16
+#define TEGRA264_BWMGR_PCIE_0		17
+#define TEGRA264_BWMGR_PCIE_1		18
+#define TEGRA264_BWMGR_PCIE_2		19
+#define TEGRA264_BWMGR_PCIE_3		20
+#define TEGRA264_BWMGR_PCIE_4		21
+#define TEGRA264_BWMGR_PCIE_5		22
+#define TEGRA264_BWMGR_SDMMC_1		23
+#define TEGRA264_BWMGR_SDMMC_2		24
+#define TEGRA264_BWMGR_NVDEC		25
+#define TEGRA264_BWMGR_NVENC		26
+#define TEGRA264_BWMGR_NVJPG_0		27
+#define TEGRA264_BWMGR_NVJPG_1		28
+#define TEGRA264_BWMGR_OFAA		29
+#define TEGRA264_BWMGR_XUSB_HOST	30
+#define TEGRA264_BWMGR_XUSB_DEV		31
+#define TEGRA264_BWMGR_TSEC		32
+#define TEGRA264_BWMGR_VIC		33
+#define TEGRA264_BWMGR_APEDMA		34
+#define TEGRA264_BWMGR_SE		35
+#define TEGRA264_BWMGR_ISP		36
+#define TEGRA264_BWMGR_HDA		37
+#define TEGRA264_BWMGR_VI2FAL		38
+#define TEGRA264_BWMGR_VI2		39
+#define TEGRA264_BWMGR_RCE		40
+#define TEGRA264_BWMGR_PVA		41
+#define TEGRA264_BWMGR_NVPMODEL		42
+
+#endif
diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
new file mode 100644
index 000000000000..5203e6c11372
--- /dev/null
+++ b/drivers/memory/tegra/tegra264.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <dt-bindings/memory/nvidia,tegra264.h>
+
+#include <linux/interconnect.h>
+#include <linux/of_device.h>
+#include <linux/tegra-icc.h>
+
+#include <soc/tegra/bpmp.h>
+#include <soc/tegra/mc.h>
+
+#include "mc.h"
+#include "tegra264-bwmgr.h"
+
+/*
+ * MC Client entries are sorted in the increasing order of the
+ * override and security register offsets.
+ */
+static const struct tegra_mc_client tegra264_mc_clients[] = {
+	{
+		.id = TEGRA264_MEMORY_CLIENT_HDAR,
+		.name = "hdar",
+		.bpmp_id = TEGRA264_BWMGR_HDA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_HDAW,
+		.name = "hdaw",
+		.bpmp_id = TEGRA264_BWMGR_HDA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE0R,
+		.name = "mgbe0r",
+		.bpmp_id = TEGRA264_BWMGR_EQOS,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE0W,
+		.name = "mgbe0w",
+		.bpmp_id = TEGRA264_BWMGR_EQOS,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE1R,
+		.name = "mgbe1r",
+		.bpmp_id = TEGRA264_BWMGR_EQOS,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_MGBE1W,
+		.name = "mgbe1w",
+		.bpmp_id = TEGRA264_BWMGR_EQOS,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SDMMC0R,
+		.name = "sdmmc0r",
+		.bpmp_id = TEGRA264_BWMGR_SDMMC_1,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_SDMMC0W,
+		.name = "sdmmc0w",
+		.bpmp_id = TEGRA264_BWMGR_SDMMC_1,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_VICR,
+		.name = "vicr",
+		.bpmp_id = TEGRA264_BWMGR_VIC,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_VICW,
+		.name = "vicw",
+		.bpmp_id = TEGRA264_BWMGR_VIC,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_APER,
+		.name = "aper",
+		.bpmp_id = TEGRA264_BWMGR_APE,
+		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_APEW,
+		.name = "apew",
+		.bpmp_id = TEGRA264_BWMGR_APE,
+		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_APEDMAR,
+		.name = "apedmar",
+		.bpmp_id = TEGRA264_BWMGR_APEDMA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_APEDMAW,
+		.name = "apedmaw",
+		.bpmp_id = TEGRA264_BWMGR_APEDMA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_VIFALCONR,
+		.name = "vifalconr",
+		.bpmp_id = TEGRA264_BWMGR_VIFAL,
+		.type = TEGRA_ICC_ISO_VIFAL,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_VIFALCONW,
+		.name = "vifalconw",
+		.bpmp_id = TEGRA264_BWMGR_VIFAL,
+		.type = TEGRA_ICC_ISO_VIFAL,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_RCER,
+		.name = "rcer",
+		.bpmp_id = TEGRA264_BWMGR_RCE,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_RCEW,
+		.name = "rcew",
+		.bpmp_id = TEGRA264_BWMGR_RCE,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE0W,
+		.name = "pcie0w",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_0,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE1R,
+		.name = "pcie1r",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_1,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE1W,
+		.name = "pcie1w",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_1,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE2AR,
+		.name = "pcie2ar",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_2,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE2AW,
+		.name = "pcie2aw",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_2,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE3R,
+		.name = "pcie3r",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_3,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE3W,
+		.name = "pcie3w",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_3,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE4R,
+		.name = "pcie4r",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_4,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE4W,
+		.name = "pcie4w",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_4,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE5R,
+		.name = "pcie5r",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_5,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_PCIE5W,
+		.name = "pcie5w",
+		.bpmp_id = TEGRA264_BWMGR_PCIE_5,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_GPUR02MC,
+		.name = "gpur02mc",
+		.bpmp_id = TEGRA264_BWMGR_GPU,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_GPUW02MC,
+		.name = "gpuw02mc",
+		.bpmp_id = TEGRA264_BWMGR_GPU,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_NVDECSRD2MC,
+		.name = "nvdecsrd2mc",
+		.bpmp_id = TEGRA264_BWMGR_NVDEC,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA264_MEMORY_CLIENT_NVDECSWR2MC,
+		.name = "nvdecswr2mc",
+		.bpmp_id = TEGRA264_BWMGR_NVDEC,
+		.type = TEGRA_ICC_NISO,
+	},
+};
+
+/*
+ * tegra264_mc_icc_set() - Pass MC client info to the BPMP-FW
+ * @src: ICC node for Memory Controller's (MC) Client
+ * @dst: ICC node for Memory Controller (MC)
+ *
+ * Passing the current request info from the MC to the BPMP-FW where
+ * LA and PTSA registers are accessed and the final EMC freq is set
+ * based on client_id, type, latency and bandwidth.
+ * icc_set_bw() makes set_bw calls for both MC and EMC providers in
+ * sequence. Both the calls are protected by 'mutex_lock(&icc_lock)'.
+ * So, the data passed won't be updated by concurrent set calls from
+ * other clients.
+ */
+static int tegra264_mc_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct tegra_mc *mc = icc_provider_to_tegra_mc(dst->provider);
+	struct mrq_bwmgr_int_request bwmgr_req = { 0 };
+	struct mrq_bwmgr_int_response bwmgr_resp = { 0 };
+	const struct tegra_mc_client *pclient = src->data;
+	struct tegra_bpmp_message msg;
+	int ret;
+
+	/*
+	 * Same Src and Dst node will happen during boot from icc_node_add().
+	 * This can be used to pre-initialize and set bandwidth for all clients
+	 * before their drivers are loaded. We are skipping this case as for us,
+	 * the pre-initialization already happened in Bootloader(MB2) and BPMP-FW.
+	 */
+	if (src->id == dst->id)
+		return 0;
+
+	if (!mc->bwmgr_mrq_supported)
+		return 0;
+
+	if (!mc->bpmp) {
+		dev_err(mc->dev, "BPMP reference NULL\n");
+		return -ENOENT;
+	}
+
+	if (pclient->type == TEGRA_ICC_NISO)
+		bwmgr_req.bwmgr_calc_set_req.niso_bw = src->avg_bw;
+	else
+		bwmgr_req.bwmgr_calc_set_req.iso_bw = src->avg_bw;
+
+	bwmgr_req.bwmgr_calc_set_req.client_id = pclient->bpmp_id;
+
+	bwmgr_req.cmd = CMD_BWMGR_INT_CALC_AND_SET;
+	bwmgr_req.bwmgr_calc_set_req.mc_floor = src->peak_bw;
+	bwmgr_req.bwmgr_calc_set_req.floor_unit = BWMGR_INT_UNIT_KBPS;
+
+	memset(&msg, 0, sizeof(msg));
+	msg.mrq = MRQ_BWMGR_INT;
+	msg.tx.data = &bwmgr_req;
+	msg.tx.size = sizeof(bwmgr_req);
+	msg.rx.data = &bwmgr_resp;
+	msg.rx.size = sizeof(bwmgr_resp);
+
+	ret = tegra_bpmp_transfer(mc->bpmp, &msg);
+	if (ret < 0) {
+		dev_err(mc->dev, "BPMP transfer failed: %d\n", ret);
+		goto error;
+	}
+	if (msg.rx.ret < 0) {
+		pr_err("failed to set bandwidth for %u: %d\n",
+		       bwmgr_req.bwmgr_calc_set_req.client_id, msg.rx.ret);
+		ret = -EINVAL;
+	}
+
+error:
+	return ret;
+}
+
+static int tegra264_mc_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
+				     u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	struct icc_provider *p = node->provider;
+	struct tegra_mc *mc = icc_provider_to_tegra_mc(p);
+
+	if (!mc->bwmgr_mrq_supported)
+		return 0;
+
+	*agg_avg += avg_bw;
+	*agg_peak = max(*agg_peak, peak_bw);
+
+	return 0;
+}
+
+static int tegra264_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	*avg = 0;
+	*peak = 0;
+
+	return 0;
+}
+
+static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
+	.xlate = tegra_mc_icc_xlate,
+	.aggregate = tegra264_mc_icc_aggregate,
+	.get_bw = tegra264_mc_icc_get_init_bw,
+	.set = tegra264_mc_icc_set,
+};
+
+const struct tegra_mc_soc tegra264_mc_soc = {
+	.num_clients = ARRAY_SIZE(tegra264_mc_clients),
+	.clients = tegra264_mc_clients,
+	.num_address_bits = 40,
+	.num_channels = 16,
+	.client_id_mask = 0x1ff,
+	.intmask = MC_INT_DECERR_ROUTE_SANITY |
+		   MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
+		   MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	.has_addr_hi_reg = true,
+	.ops = &tegra186_mc_ops,
+	.icc_ops = &tegra264_mc_icc_ops,
+	.ch_intmask = 0x0000ff00,
+	.global_intstatus_channel_shift = 8,
+	/*
+	 * Additionally, there are lite carveouts but those are not currently
+	 * supported.
+	 */
+	.num_carveouts = 32,
+};
-- 
2.50.0

