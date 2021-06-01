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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC72DC47092
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF84E61375
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 17:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234677AbhFASAZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 14:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234668AbhFASAY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 14:00:24 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB9FC061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 10:58:41 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id qq22so14817794ejb.9
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JGVFhwycnE7YPRiac+h4z5+mrKpkU0CvWqb8g3WpioQ=;
        b=XdZUbgWIdEuYejHbRGOnPOrxxj1xm6IHWaXUT3VZUqt60GUxuBAjX5QHXgri+usWpj
         3SYrHwv9I/0sDUrwhrdOl2Nd3R3LsPDy+qZMTfPvaKqJLbDerPZ/JgtuycZikIG4Newq
         xHg7AmRcF5HJrGobYJdy7IWHT2n6Eub1bRemNnmkgwptXWFPQ6rFmfrORGaSmwyfgHdl
         M+rhMO8Yv8aIBmPejOsmyVPmyIAX5nfiX0TeZebHnUrzh7guSjHkRroEeayB9ZFijZJc
         s5VRKl1frrjX81PBBcuqbi56D3c2TGQfQlvz1AspCnh7bHQ294KvEC1t81V2CDsTNuuc
         4htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JGVFhwycnE7YPRiac+h4z5+mrKpkU0CvWqb8g3WpioQ=;
        b=fT16D2h7z4kawUSF25Ui/mRZ+HZYg9Xx9vitpRc+z2u5jnaQLOv4AN/87uyQXXe1pq
         XtPQUQE2AVSBDT97diFu7M3g3zomGiLnenLjuoPzX+t5Aqy8QGIxTkaGxTcKSF4HDqna
         tktxF8pqwjn/4RpTZixBvbPUshFipWssjXkk8ihEUdvBHoIH420+s2KwOUHa0elIyDE4
         U9TRDbTWj/EDvh49V7S+86I1fn8Y/WJ80L+eq46YN8O6oV+NIJZEme8VdDHfXVm6v8uh
         5iouKanUJHLLbPdm1NXiZblhC7DOdzcNXZo27KYzA4NmpFSMNFbIb9j4o/q8jpJZTFfz
         a48w==
X-Gm-Message-State: AOAM532251U/YUat4VCBVPmej9eMKzDTbmrz4ccYBKGSvDcsPPodPJg3
        3LIGjtvir/JdDgiXrtKoQ90=
X-Google-Smtp-Source: ABdhPJw39XEESqUs7C/VeZQZnS5QjEaV9ioNMrbJbIn0T85Sk/wEHaJC1eusztvzOU6gWXZqQPT03Q==
X-Received: by 2002:a17:907:a06b:: with SMTP id ia11mr29903155ejc.528.1622570319983;
        Tue, 01 Jun 2021 10:58:39 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t14sm8864363edv.27.2021.06.01.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:58:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 12/12] memory: tegra: Split Tegra194 data into separate file
Date:   Tue,  1 Jun 2021 19:59:42 +0200
Message-Id: <20210601175942.1920588-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601175942.1920588-1-thierry.reding@gmail.com>
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Keep the directory structure consistent by splitting the Tegra194 data
into a separate file.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/Makefile   |    2 +-
 drivers/memory/tegra/mc.h       |    5 +
 drivers/memory/tegra/tegra186.c | 1349 +-----------------------------
 drivers/memory/tegra/tegra194.c | 1353 +++++++++++++++++++++++++++++++
 4 files changed, 1360 insertions(+), 1349 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra194.c

diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 1af0fefacdda..c992e87782d2 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -8,7 +8,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_124_SOC) += tegra124.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra124.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
-tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o
+tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra194.o
 
 obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
 
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 154c078b4360..28862e023b7d 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -147,6 +147,11 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
 extern const struct tegra_mc_ops tegra30_mc_ops;
 #endif
 
+#if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_194_SOC)
+extern const struct tegra_mc_ops tegra186_mc_ops;
+#endif
+
 extern const char * const tegra_mc_status_names[32];
 extern const char * const tegra_mc_error_names[8];
 
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 2f6ef46c33a4..1f87915ccd62 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -15,10 +15,6 @@
 #include <dt-bindings/memory/tegra186-mc.h>
 #endif
 
-#if defined(CONFIG_ARCH_TEGRA_194_SOC)
-#include <dt-bindings/memory/tegra194-mc.h>
-#endif
-
 static void tegra186_mc_program_sid(struct tegra_mc *mc)
 {
 	unsigned int i;
@@ -70,7 +66,7 @@ static int tegra186_mc_resume(struct tegra_mc *mc)
 	return 0;
 }
 
-static const struct tegra_mc_ops tegra186_mc_ops = {
+const struct tegra_mc_ops tegra186_mc_ops = {
 	.probe = tegra186_mc_probe,
 	.remove = tegra186_mc_remove,
 	.resume = tegra186_mc_resume,
@@ -808,1346 +804,3 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 	.ops = &tegra186_mc_ops,
 };
 #endif
-
-#if defined(CONFIG_ARCH_TEGRA_194_SOC)
-static const struct tegra_mc_client tegra194_mc_clients[] = {
-	{
-		.id = TEGRA194_MEMORY_CLIENT_PTCR,
-		.name = "ptcr",
-		.sid = TEGRA194_SID_PASSTHROUGH,
-		.regs = {
-			.sid = {
-				.override = 0x000,
-				.security = 0x004,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU7R,
-		.name = "miu7r",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x008,
-				.security = 0x00c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU7W,
-		.name = "miu7w",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x010,
-				.security = 0x014,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_HDAR,
-		.name = "hdar",
-		.sid = TEGRA194_SID_HDA,
-		.regs = {
-			.sid = {
-				.override = 0x0a8,
-				.security = 0x0ac,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_HOST1XDMAR,
-		.name = "host1xdmar",
-		.sid = TEGRA194_SID_HOST1X,
-		.regs = {
-			.sid = {
-				.override = 0x0b0,
-				.security = 0x0b4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVENCSRD,
-		.name = "nvencsrd",
-		.sid = TEGRA194_SID_NVENC,
-		.regs = {
-			.sid = {
-				.override = 0x0e0,
-				.security = 0x0e4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SATAR,
-		.name = "satar",
-		.sid = TEGRA194_SID_SATA,
-		.regs = {
-			.sid = {
-				.override = 0x0f8,
-				.security = 0x0fc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MPCORER,
-		.name = "mpcorer",
-		.sid = TEGRA194_SID_PASSTHROUGH,
-		.regs = {
-			.sid = {
-				.override = 0x138,
-				.security = 0x13c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVENCSWR,
-		.name = "nvencswr",
-		.sid = TEGRA194_SID_NVENC,
-		.regs = {
-			.sid = {
-				.override = 0x158,
-				.security = 0x15c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_HDAW,
-		.name = "hdaw",
-		.sid = TEGRA194_SID_HDA,
-		.regs = {
-			.sid = {
-				.override = 0x1a8,
-				.security = 0x1ac,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MPCOREW,
-		.name = "mpcorew",
-		.sid = TEGRA194_SID_PASSTHROUGH,
-		.regs = {
-			.sid = {
-				.override = 0x1c8,
-				.security = 0x1cc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SATAW,
-		.name = "sataw",
-		.sid = TEGRA194_SID_SATA,
-		.regs = {
-			.sid = {
-				.override = 0x1e8,
-				.security = 0x1ec,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_ISPRA,
-		.name = "ispra",
-		.sid = TEGRA194_SID_ISP,
-		.regs = {
-			.sid = {
-				.override = 0x220,
-				.security = 0x224,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_ISPFALR,
-		.name = "ispfalr",
-		.sid = TEGRA194_SID_ISP_FALCON,
-		.regs = {
-			.sid = {
-				.override = 0x228,
-				.security = 0x22c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_ISPWA,
-		.name = "ispwa",
-		.sid = TEGRA194_SID_ISP,
-		.regs = {
-			.sid = {
-				.override = 0x230,
-				.security = 0x234,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_ISPWB,
-		.name = "ispwb",
-		.sid = TEGRA194_SID_ISP,
-		.regs = {
-			.sid = {
-				.override = 0x238,
-				.security = 0x23c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_XUSB_HOSTR,
-		.name = "xusb_hostr",
-		.sid = TEGRA194_SID_XUSB_HOST,
-		.regs = {
-			.sid = {
-				.override = 0x250,
-				.security = 0x254,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_XUSB_HOSTW,
-		.name = "xusb_hostw",
-		.sid = TEGRA194_SID_XUSB_HOST,
-		.regs = {
-			.sid = {
-				.override = 0x258,
-				.security = 0x25c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_XUSB_DEVR,
-		.name = "xusb_devr",
-		.sid = TEGRA194_SID_XUSB_DEV,
-		.regs = {
-			.sid = {
-				.override = 0x260,
-				.security = 0x264,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_XUSB_DEVW,
-		.name = "xusb_devw",
-		.sid = TEGRA194_SID_XUSB_DEV,
-		.regs = {
-			.sid = {
-				.override = 0x268,
-				.security = 0x26c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SDMMCRA,
-		.name = "sdmmcra",
-		.sid = TEGRA194_SID_SDMMC1,
-		.regs = {
-			.sid = {
-				.override = 0x300,
-				.security = 0x304,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SDMMCR,
-		.name = "sdmmcr",
-		.sid = TEGRA194_SID_SDMMC3,
-		.regs = {
-			.sid = {
-				.override = 0x310,
-				.security = 0x314,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SDMMCRAB,
-		.name = "sdmmcrab",
-		.sid = TEGRA194_SID_SDMMC4,
-		.regs = {
-			.sid = {
-				.override = 0x318,
-				.security = 0x31c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SDMMCWA,
-		.name = "sdmmcwa",
-		.sid = TEGRA194_SID_SDMMC1,
-		.regs = {
-			.sid = {
-				.override = 0x320,
-				.security = 0x324,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SDMMCW,
-		.name = "sdmmcw",
-		.sid = TEGRA194_SID_SDMMC3,
-		.regs = {
-			.sid = {
-				.override = 0x330,
-				.security = 0x334,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SDMMCWAB,
-		.name = "sdmmcwab",
-		.sid = TEGRA194_SID_SDMMC4,
-		.regs = {
-			.sid = {
-				.override = 0x338,
-				.security = 0x33c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_VICSRD,
-		.name = "vicsrd",
-		.sid = TEGRA194_SID_VIC,
-		.regs = {
-			.sid = {
-				.override = 0x360,
-				.security = 0x364,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_VICSWR,
-		.name = "vicswr",
-		.sid = TEGRA194_SID_VIC,
-		.regs = {
-			.sid = {
-				.override = 0x368,
-				.security = 0x36c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_VIW,
-		.name = "viw",
-		.sid = TEGRA194_SID_VI,
-		.regs = {
-			.sid = {
-				.override = 0x390,
-				.security = 0x394,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVDECSRD,
-		.name = "nvdecsrd",
-		.sid = TEGRA194_SID_NVDEC,
-		.regs = {
-			.sid = {
-				.override = 0x3c0,
-				.security = 0x3c4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVDECSWR,
-		.name = "nvdecswr",
-		.sid = TEGRA194_SID_NVDEC,
-		.regs = {
-			.sid = {
-				.override = 0x3c8,
-				.security = 0x3cc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_APER,
-		.name = "aper",
-		.sid = TEGRA194_SID_APE,
-		.regs = {
-			.sid = {
-				.override = 0x3c0,
-				.security = 0x3c4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_APEW,
-		.name = "apew",
-		.sid = TEGRA194_SID_APE,
-		.regs = {
-			.sid = {
-				.override = 0x3d0,
-				.security = 0x3d4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVJPGSRD,
-		.name = "nvjpgsrd",
-		.sid = TEGRA194_SID_NVJPG,
-		.regs = {
-			.sid = {
-				.override = 0x3f0,
-				.security = 0x3f4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVJPGSWR,
-		.name = "nvjpgswr",
-		.sid = TEGRA194_SID_NVJPG,
-		.regs = {
-			.sid = {
-				.override = 0x3f0,
-				.security = 0x3f4,
-			},
-		},
-	}, {
-		.name = "axiapr",
-		.id = TEGRA194_MEMORY_CLIENT_AXIAPR,
-		.sid = TEGRA194_SID_PASSTHROUGH,
-		.regs = {
-			.sid = {
-				.override = 0x410,
-				.security = 0x414,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_AXIAPW,
-		.name = "axiapw",
-		.sid = TEGRA194_SID_PASSTHROUGH,
-		.regs = {
-			.sid = {
-				.override = 0x418,
-				.security = 0x41c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_ETRR,
-		.name = "etrr",
-		.sid = TEGRA194_SID_ETR,
-		.regs = {
-			.sid = {
-				.override = 0x420,
-				.security = 0x424,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_ETRW,
-		.name = "etrw",
-		.sid = TEGRA194_SID_ETR,
-		.regs = {
-			.sid = {
-				.override = 0x428,
-				.security = 0x42c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_AXISR,
-		.name = "axisr",
-		.sid = TEGRA194_SID_PASSTHROUGH,
-		.regs = {
-			.sid = {
-				.override = 0x460,
-				.security = 0x464,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_AXISW,
-		.name = "axisw",
-		.sid = TEGRA194_SID_PASSTHROUGH,
-		.regs = {
-			.sid = {
-				.override = 0x468,
-				.security = 0x46c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_EQOSR,
-		.name = "eqosr",
-		.sid = TEGRA194_SID_EQOS,
-		.regs = {
-			.sid = {
-				.override = 0x470,
-				.security = 0x474,
-			},
-		},
-	}, {
-		.name = "eqosw",
-		.id = TEGRA194_MEMORY_CLIENT_EQOSW,
-		.sid = TEGRA194_SID_EQOS,
-		.regs = {
-			.sid = {
-				.override = 0x478,
-				.security = 0x47c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_UFSHCR,
-		.name = "ufshcr",
-		.sid = TEGRA194_SID_UFSHC,
-		.regs = {
-			.sid = {
-				.override = 0x480,
-				.security = 0x484,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_UFSHCW,
-		.name = "ufshcw",
-		.sid = TEGRA194_SID_UFSHC,
-		.regs = {
-			.sid = {
-				.override = 0x488,
-				.security = 0x48c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVDISPLAYR,
-		.name = "nvdisplayr",
-		.sid = TEGRA194_SID_NVDISPLAY,
-		.regs = {
-			.sid = {
-				.override = 0x490,
-				.security = 0x494,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_BPMPR,
-		.name = "bpmpr",
-		.sid = TEGRA194_SID_BPMP,
-		.regs = {
-			.sid = {
-				.override = 0x498,
-				.security = 0x49c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_BPMPW,
-		.name = "bpmpw",
-		.sid = TEGRA194_SID_BPMP,
-		.regs = {
-			.sid = {
-				.override = 0x4a0,
-				.security = 0x4a4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_BPMPDMAR,
-		.name = "bpmpdmar",
-		.sid = TEGRA194_SID_BPMP,
-		.regs = {
-			.sid = {
-				.override = 0x4a8,
-				.security = 0x4ac,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_BPMPDMAW,
-		.name = "bpmpdmaw",
-		.sid = TEGRA194_SID_BPMP,
-		.regs = {
-			.sid = {
-				.override = 0x4b0,
-				.security = 0x4b4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_AONR,
-		.name = "aonr",
-		.sid = TEGRA194_SID_AON,
-		.regs = {
-			.sid = {
-				.override = 0x4b8,
-				.security = 0x4bc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_AONW,
-		.name = "aonw",
-		.sid = TEGRA194_SID_AON,
-		.regs = {
-			.sid = {
-				.override = 0x4c0,
-				.security = 0x4c4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_AONDMAR,
-		.name = "aondmar",
-		.sid = TEGRA194_SID_AON,
-		.regs = {
-			.sid = {
-				.override = 0x4c8,
-				.security = 0x4cc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_AONDMAW,
-		.name = "aondmaw",
-		.sid = TEGRA194_SID_AON,
-		.regs = {
-			.sid = {
-				.override = 0x4d0,
-				.security = 0x4d4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SCER,
-		.name = "scer",
-		.sid = TEGRA194_SID_SCE,
-		.regs = {
-			.sid = {
-				.override = 0x4d8,
-				.security = 0x4dc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SCEW,
-		.name = "scew",
-		.sid = TEGRA194_SID_SCE,
-		.regs = {
-			.sid = {
-				.override = 0x4e0,
-				.security = 0x4e4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SCEDMAR,
-		.name = "scedmar",
-		.sid = TEGRA194_SID_SCE,
-		.regs = {
-			.sid = {
-				.override = 0x4e8,
-				.security = 0x4ec,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_SCEDMAW,
-		.name = "scedmaw",
-		.sid = TEGRA194_SID_SCE,
-		.regs = {
-			.sid = {
-				.override = 0x4f0,
-				.security = 0x4f4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_APEDMAR,
-		.name = "apedmar",
-		.sid = TEGRA194_SID_APE,
-		.regs = {
-			.sid = {
-				.override = 0x4f8,
-				.security = 0x4fc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_APEDMAW,
-		.name = "apedmaw",
-		.sid = TEGRA194_SID_APE,
-		.regs = {
-			.sid = {
-				.override = 0x500,
-				.security = 0x504,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVDISPLAYR1,
-		.name = "nvdisplayr1",
-		.sid = TEGRA194_SID_NVDISPLAY,
-		.regs = {
-			.sid = {
-				.override = 0x508,
-				.security = 0x50c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_VICSRD1,
-		.name = "vicsrd1",
-		.sid = TEGRA194_SID_VIC,
-		.regs = {
-			.sid = {
-				.override = 0x510,
-				.security = 0x514,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVDECSRD1,
-		.name = "nvdecsrd1",
-		.sid = TEGRA194_SID_NVDEC,
-		.regs = {
-			.sid = {
-				.override = 0x518,
-				.security = 0x51c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU0R,
-		.name = "miu0r",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x530,
-				.security = 0x534,
-			},
-		},
-	}, {
-		.name = "miu0w",
-		.id = TEGRA194_MEMORY_CLIENT_MIU0W,
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x538,
-				.security = 0x53c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU1R,
-		.name = "miu1r",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x540,
-				.security = 0x544,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU1W,
-		.name = "miu1w",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x548,
-				.security = 0x54c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU2R,
-		.name = "miu2r",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x570,
-				.security = 0x574,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU2W,
-		.name = "miu2w",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x578,
-				.security = 0x57c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU3R,
-		.name = "miu3r",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x580,
-				.security = 0x584,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU3W,
-		.name = "miu3w",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x588,
-				.security = 0x58c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU4R,
-		.name = "miu4r",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x590,
-				.security = 0x594,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU4W,
-		.name = "miu4w",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x598,
-				.security = 0x59c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DPMUR,
-		.name = "dpmur",
-		.sid = TEGRA194_SID_PASSTHROUGH,
-		.regs = {
-			.sid = {
-				.override = 0x598,
-				.security = 0x59c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_VIFALR,
-		.name = "vifalr",
-		.sid = TEGRA194_SID_VI_FALCON,
-		.regs = {
-			.sid = {
-				.override = 0x5e0,
-				.security = 0x5e4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_VIFALW,
-		.name = "vifalw",
-		.sid = TEGRA194_SID_VI_FALCON,
-		.regs = {
-			.sid = {
-				.override = 0x5e8,
-				.security = 0x5ec,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA0RDA,
-		.name = "dla0rda",
-		.sid = TEGRA194_SID_NVDLA0,
-		.regs = {
-			.sid = {
-				.override = 0x5f0,
-				.security = 0x5f4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA0FALRDB,
-		.name = "dla0falrdb",
-		.sid = TEGRA194_SID_NVDLA0,
-		.regs = {
-			.sid = {
-				.override = 0x5f8,
-				.security = 0x5fc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA0WRA,
-		.name = "dla0wra",
-		.sid = TEGRA194_SID_NVDLA0,
-		.regs = {
-			.sid = {
-				.override = 0x600,
-				.security = 0x604,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA0FALWRB,
-		.name = "dla0falwrb",
-		.sid = TEGRA194_SID_NVDLA0,
-		.regs = {
-			.sid = {
-				.override = 0x608,
-				.security = 0x60c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA1RDA,
-		.name = "dla1rda",
-		.sid = TEGRA194_SID_NVDLA1,
-		.regs = {
-			.sid = {
-				.override = 0x610,
-				.security = 0x614,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA1FALRDB,
-		.name = "dla1falrdb",
-		.sid = TEGRA194_SID_NVDLA1,
-		.regs = {
-			.sid = {
-				.override = 0x618,
-				.security = 0x61c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA1WRA,
-		.name = "dla1wra",
-		.sid = TEGRA194_SID_NVDLA1,
-		.regs = {
-			.sid = {
-				.override = 0x620,
-				.security = 0x624,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA1FALWRB,
-		.name = "dla1falwrb",
-		.sid = TEGRA194_SID_NVDLA1,
-		.regs = {
-			.sid = {
-				.override = 0x628,
-				.security = 0x62c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA0RDA,
-		.name = "pva0rda",
-		.sid = TEGRA194_SID_PVA0,
-		.regs = {
-			.sid = {
-				.override = 0x630,
-				.security = 0x634,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA0RDB,
-		.name = "pva0rdb",
-		.sid = TEGRA194_SID_PVA0,
-		.regs = {
-			.sid = {
-				.override = 0x638,
-				.security = 0x63c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA0RDC,
-		.name = "pva0rdc",
-		.sid = TEGRA194_SID_PVA0,
-		.regs = {
-			.sid = {
-				.override = 0x640,
-				.security = 0x644,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA0WRA,
-		.name = "pva0wra",
-		.sid = TEGRA194_SID_PVA0,
-		.regs = {
-			.sid = {
-				.override = 0x648,
-				.security = 0x64c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA0WRB,
-		.name = "pva0wrb",
-		.sid = TEGRA194_SID_PVA0,
-		.regs = {
-			.sid = {
-				.override = 0x650,
-				.security = 0x654,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA0WRC,
-		.name = "pva0wrc",
-		.sid = TEGRA194_SID_PVA0,
-		.regs = {
-			.sid = {
-				.override = 0x658,
-				.security = 0x65c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA1RDA,
-		.name = "pva1rda",
-		.sid = TEGRA194_SID_PVA1,
-		.regs = {
-			.sid = {
-				.override = 0x660,
-				.security = 0x664,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA1RDB,
-		.name = "pva1rdb",
-		.sid = TEGRA194_SID_PVA1,
-		.regs = {
-			.sid = {
-				.override = 0x668,
-				.security = 0x66c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA1RDC,
-		.name = "pva1rdc",
-		.sid = TEGRA194_SID_PVA1,
-		.regs = {
-			.sid = {
-				.override = 0x670,
-				.security = 0x674,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA1WRA,
-		.name = "pva1wra",
-		.sid = TEGRA194_SID_PVA1,
-		.regs = {
-			.sid = {
-				.override = 0x678,
-				.security = 0x67c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA1WRB,
-		.name = "pva1wrb",
-		.sid = TEGRA194_SID_PVA1,
-		.regs = {
-			.sid = {
-				.override = 0x680,
-				.security = 0x684,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA1WRC,
-		.name = "pva1wrc",
-		.sid = TEGRA194_SID_PVA1,
-		.regs = {
-			.sid = {
-				.override = 0x688,
-				.security = 0x68c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_RCER,
-		.name = "rcer",
-		.sid = TEGRA194_SID_RCE,
-		.regs = {
-			.sid = {
-				.override = 0x690,
-				.security = 0x694,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_RCEW,
-		.name = "rcew",
-		.sid = TEGRA194_SID_RCE,
-		.regs = {
-			.sid = {
-				.override = 0x698,
-				.security = 0x69c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_RCEDMAR,
-		.name = "rcedmar",
-		.sid = TEGRA194_SID_RCE,
-		.regs = {
-			.sid = {
-				.override = 0x6a0,
-				.security = 0x6a4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_RCEDMAW,
-		.name = "rcedmaw",
-		.sid = TEGRA194_SID_RCE,
-		.regs = {
-			.sid = {
-				.override = 0x6a8,
-				.security = 0x6ac,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVENC1SRD,
-		.name = "nvenc1srd",
-		.sid = TEGRA194_SID_NVENC1,
-		.regs = {
-			.sid = {
-				.override = 0x6b0,
-				.security = 0x6b4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVENC1SWR,
-		.name = "nvenc1swr",
-		.sid = TEGRA194_SID_NVENC1,
-		.regs = {
-			.sid = {
-				.override = 0x6b8,
-				.security = 0x6bc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE0R,
-		.name = "pcie0r",
-		.sid = TEGRA194_SID_PCIE0,
-		.regs = {
-			.sid = {
-				.override = 0x6c0,
-				.security = 0x6c4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE0W,
-		.name = "pcie0w",
-		.sid = TEGRA194_SID_PCIE0,
-		.regs = {
-			.sid = {
-				.override = 0x6c8,
-				.security = 0x6cc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE1R,
-		.name = "pcie1r",
-		.sid = TEGRA194_SID_PCIE1,
-		.regs = {
-			.sid = {
-				.override = 0x6d0,
-				.security = 0x6d4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE1W,
-		.name = "pcie1w",
-		.sid = TEGRA194_SID_PCIE1,
-		.regs = {
-			.sid = {
-				.override = 0x6d8,
-				.security = 0x6dc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE2AR,
-		.name = "pcie2ar",
-		.sid = TEGRA194_SID_PCIE2,
-		.regs = {
-			.sid = {
-				.override = 0x6e0,
-				.security = 0x6e4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE2AW,
-		.name = "pcie2aw",
-		.sid = TEGRA194_SID_PCIE2,
-		.regs = {
-			.sid = {
-				.override = 0x6e8,
-				.security = 0x6ec,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE3R,
-		.name = "pcie3r",
-		.sid = TEGRA194_SID_PCIE3,
-		.regs = {
-			.sid = {
-				.override = 0x6f0,
-				.security = 0x6f4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE3W,
-		.name = "pcie3w",
-		.sid = TEGRA194_SID_PCIE3,
-		.regs = {
-			.sid = {
-				.override = 0x6f8,
-				.security = 0x6fc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE4R,
-		.name = "pcie4r",
-		.sid = TEGRA194_SID_PCIE4,
-		.regs = {
-			.sid = {
-				.override = 0x700,
-				.security = 0x704,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE4W,
-		.name = "pcie4w",
-		.sid = TEGRA194_SID_PCIE4,
-		.regs = {
-			.sid = {
-				.override = 0x708,
-				.security = 0x70c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE5R,
-		.name = "pcie5r",
-		.sid = TEGRA194_SID_PCIE5,
-		.regs = {
-			.sid = {
-				.override = 0x710,
-				.security = 0x714,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE5W,
-		.name = "pcie5w",
-		.sid = TEGRA194_SID_PCIE5,
-		.regs = {
-			.sid = {
-				.override = 0x718,
-				.security = 0x71c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_ISPFALW,
-		.name = "ispfalw",
-		.sid = TEGRA194_SID_ISP_FALCON,
-		.regs = {
-			.sid = {
-				.override = 0x720,
-				.security = 0x724,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA0RDA1,
-		.name = "dla0rda1",
-		.sid = TEGRA194_SID_NVDLA0,
-		.regs = {
-			.sid = {
-				.override = 0x748,
-				.security = 0x74c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_DLA1RDA1,
-		.name = "dla1rda1",
-		.sid = TEGRA194_SID_NVDLA1,
-		.regs = {
-			.sid = {
-				.override = 0x750,
-				.security = 0x754,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA0RDA1,
-		.name = "pva0rda1",
-		.sid = TEGRA194_SID_PVA0,
-		.regs = {
-			.sid = {
-				.override = 0x758,
-				.security = 0x75c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA0RDB1,
-		.name = "pva0rdb1",
-		.sid = TEGRA194_SID_PVA0,
-		.regs = {
-			.sid = {
-				.override = 0x760,
-				.security = 0x764,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA1RDA1,
-		.name = "pva1rda1",
-		.sid = TEGRA194_SID_PVA1,
-		.regs = {
-			.sid = {
-				.override = 0x768,
-				.security = 0x76c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PVA1RDB1,
-		.name = "pva1rdb1",
-		.sid = TEGRA194_SID_PVA1,
-		.regs = {
-			.sid = {
-				.override = 0x770,
-				.security = 0x774,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE5R1,
-		.name = "pcie5r1",
-		.sid = TEGRA194_SID_PCIE5,
-		.regs = {
-			.sid = {
-				.override = 0x778,
-				.security = 0x77c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVENCSRD1,
-		.name = "nvencsrd1",
-		.sid = TEGRA194_SID_NVENC,
-		.regs = {
-			.sid = {
-				.override = 0x780,
-				.security = 0x784,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVENC1SRD1,
-		.name = "nvenc1srd1",
-		.sid = TEGRA194_SID_NVENC1,
-		.regs = {
-			.sid = {
-				.override = 0x788,
-				.security = 0x78c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_ISPRA1,
-		.name = "ispra1",
-		.sid = TEGRA194_SID_ISP,
-		.regs = {
-			.sid = {
-				.override = 0x790,
-				.security = 0x794,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_PCIE0R1,
-		.name = "pcie0r1",
-		.sid = TEGRA194_SID_PCIE0,
-		.regs = {
-			.sid = {
-				.override = 0x798,
-				.security = 0x79c,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVDEC1SRD,
-		.name = "nvdec1srd",
-		.sid = TEGRA194_SID_NVDEC1,
-		.regs = {
-			.sid = {
-				.override = 0x7c8,
-				.security = 0x7cc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVDEC1SRD1,
-		.name = "nvdec1srd1",
-		.sid = TEGRA194_SID_NVDEC1,
-		.regs = {
-			.sid = {
-				.override = 0x7d0,
-				.security = 0x7d4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_NVDEC1SWR,
-		.name = "nvdec1swr",
-		.sid = TEGRA194_SID_NVDEC1,
-		.regs = {
-			.sid = {
-				.override = 0x7d8,
-				.security = 0x7dc,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU5R,
-		.name = "miu5r",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x7e0,
-				.security = 0x7e4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU5W,
-		.name = "miu5w",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x7e8,
-				.security = 0x7ec,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU6R,
-		.name = "miu6r",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x7f0,
-				.security = 0x7f4,
-			},
-		},
-	}, {
-		.id = TEGRA194_MEMORY_CLIENT_MIU6W,
-		.name = "miu6w",
-		.sid = TEGRA194_SID_MIU,
-		.regs = {
-			.sid = {
-				.override = 0x7f8,
-				.security = 0x7fc,
-			},
-		},
-	},
-};
-
-const struct tegra_mc_soc tegra194_mc_soc = {
-	.num_clients = ARRAY_SIZE(tegra194_mc_clients),
-	.clients = tegra194_mc_clients,
-	.num_address_bits = 40,
-	.ops = &tegra186_mc_ops,
-};
-#endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
new file mode 100644
index 000000000000..3ae6fbb76997
--- /dev/null
+++ b/drivers/memory/tegra/tegra194.c
@@ -0,0 +1,1353 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <soc/tegra/mc.h>
+
+#include <dt-bindings/memory/tegra194-mc.h>
+
+#include "mc.h"
+
+#if defined(CONFIG_ARCH_TEGRA_194_SOC)
+static const struct tegra_mc_client tegra194_mc_clients[] = {
+	{
+		.id = TEGRA194_MEMORY_CLIENT_PTCR,
+		.name = "ptcr",
+		.sid = TEGRA194_SID_PASSTHROUGH,
+		.regs = {
+			.sid = {
+				.override = 0x000,
+				.security = 0x004,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU7R,
+		.name = "miu7r",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x008,
+				.security = 0x00c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU7W,
+		.name = "miu7w",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x010,
+				.security = 0x014,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_HDAR,
+		.name = "hdar",
+		.sid = TEGRA194_SID_HDA,
+		.regs = {
+			.sid = {
+				.override = 0x0a8,
+				.security = 0x0ac,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_HOST1XDMAR,
+		.name = "host1xdmar",
+		.sid = TEGRA194_SID_HOST1X,
+		.regs = {
+			.sid = {
+				.override = 0x0b0,
+				.security = 0x0b4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENCSRD,
+		.name = "nvencsrd",
+		.sid = TEGRA194_SID_NVENC,
+		.regs = {
+			.sid = {
+				.override = 0x0e0,
+				.security = 0x0e4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SATAR,
+		.name = "satar",
+		.sid = TEGRA194_SID_SATA,
+		.regs = {
+			.sid = {
+				.override = 0x0f8,
+				.security = 0x0fc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MPCORER,
+		.name = "mpcorer",
+		.sid = TEGRA194_SID_PASSTHROUGH,
+		.regs = {
+			.sid = {
+				.override = 0x138,
+				.security = 0x13c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENCSWR,
+		.name = "nvencswr",
+		.sid = TEGRA194_SID_NVENC,
+		.regs = {
+			.sid = {
+				.override = 0x158,
+				.security = 0x15c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_HDAW,
+		.name = "hdaw",
+		.sid = TEGRA194_SID_HDA,
+		.regs = {
+			.sid = {
+				.override = 0x1a8,
+				.security = 0x1ac,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MPCOREW,
+		.name = "mpcorew",
+		.sid = TEGRA194_SID_PASSTHROUGH,
+		.regs = {
+			.sid = {
+				.override = 0x1c8,
+				.security = 0x1cc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SATAW,
+		.name = "sataw",
+		.sid = TEGRA194_SID_SATA,
+		.regs = {
+			.sid = {
+				.override = 0x1e8,
+				.security = 0x1ec,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPRA,
+		.name = "ispra",
+		.sid = TEGRA194_SID_ISP,
+		.regs = {
+			.sid = {
+				.override = 0x220,
+				.security = 0x224,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPFALR,
+		.name = "ispfalr",
+		.sid = TEGRA194_SID_ISP_FALCON,
+		.regs = {
+			.sid = {
+				.override = 0x228,
+				.security = 0x22c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPWA,
+		.name = "ispwa",
+		.sid = TEGRA194_SID_ISP,
+		.regs = {
+			.sid = {
+				.override = 0x230,
+				.security = 0x234,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPWB,
+		.name = "ispwb",
+		.sid = TEGRA194_SID_ISP,
+		.regs = {
+			.sid = {
+				.override = 0x238,
+				.security = 0x23c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_XUSB_HOSTR,
+		.name = "xusb_hostr",
+		.sid = TEGRA194_SID_XUSB_HOST,
+		.regs = {
+			.sid = {
+				.override = 0x250,
+				.security = 0x254,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_XUSB_HOSTW,
+		.name = "xusb_hostw",
+		.sid = TEGRA194_SID_XUSB_HOST,
+		.regs = {
+			.sid = {
+				.override = 0x258,
+				.security = 0x25c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_XUSB_DEVR,
+		.name = "xusb_devr",
+		.sid = TEGRA194_SID_XUSB_DEV,
+		.regs = {
+			.sid = {
+				.override = 0x260,
+				.security = 0x264,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_XUSB_DEVW,
+		.name = "xusb_devw",
+		.sid = TEGRA194_SID_XUSB_DEV,
+		.regs = {
+			.sid = {
+				.override = 0x268,
+				.security = 0x26c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCRA,
+		.name = "sdmmcra",
+		.sid = TEGRA194_SID_SDMMC1,
+		.regs = {
+			.sid = {
+				.override = 0x300,
+				.security = 0x304,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCR,
+		.name = "sdmmcr",
+		.sid = TEGRA194_SID_SDMMC3,
+		.regs = {
+			.sid = {
+				.override = 0x310,
+				.security = 0x314,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCRAB,
+		.name = "sdmmcrab",
+		.sid = TEGRA194_SID_SDMMC4,
+		.regs = {
+			.sid = {
+				.override = 0x318,
+				.security = 0x31c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCWA,
+		.name = "sdmmcwa",
+		.sid = TEGRA194_SID_SDMMC1,
+		.regs = {
+			.sid = {
+				.override = 0x320,
+				.security = 0x324,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCW,
+		.name = "sdmmcw",
+		.sid = TEGRA194_SID_SDMMC3,
+		.regs = {
+			.sid = {
+				.override = 0x330,
+				.security = 0x334,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SDMMCWAB,
+		.name = "sdmmcwab",
+		.sid = TEGRA194_SID_SDMMC4,
+		.regs = {
+			.sid = {
+				.override = 0x338,
+				.security = 0x33c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VICSRD,
+		.name = "vicsrd",
+		.sid = TEGRA194_SID_VIC,
+		.regs = {
+			.sid = {
+				.override = 0x360,
+				.security = 0x364,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VICSWR,
+		.name = "vicswr",
+		.sid = TEGRA194_SID_VIC,
+		.regs = {
+			.sid = {
+				.override = 0x368,
+				.security = 0x36c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VIW,
+		.name = "viw",
+		.sid = TEGRA194_SID_VI,
+		.regs = {
+			.sid = {
+				.override = 0x390,
+				.security = 0x394,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDECSRD,
+		.name = "nvdecsrd",
+		.sid = TEGRA194_SID_NVDEC,
+		.regs = {
+			.sid = {
+				.override = 0x3c0,
+				.security = 0x3c4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDECSWR,
+		.name = "nvdecswr",
+		.sid = TEGRA194_SID_NVDEC,
+		.regs = {
+			.sid = {
+				.override = 0x3c8,
+				.security = 0x3cc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_APER,
+		.name = "aper",
+		.sid = TEGRA194_SID_APE,
+		.regs = {
+			.sid = {
+				.override = 0x3c0,
+				.security = 0x3c4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_APEW,
+		.name = "apew",
+		.sid = TEGRA194_SID_APE,
+		.regs = {
+			.sid = {
+				.override = 0x3d0,
+				.security = 0x3d4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVJPGSRD,
+		.name = "nvjpgsrd",
+		.sid = TEGRA194_SID_NVJPG,
+		.regs = {
+			.sid = {
+				.override = 0x3f0,
+				.security = 0x3f4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVJPGSWR,
+		.name = "nvjpgswr",
+		.sid = TEGRA194_SID_NVJPG,
+		.regs = {
+			.sid = {
+				.override = 0x3f0,
+				.security = 0x3f4,
+			},
+		},
+	}, {
+		.name = "axiapr",
+		.id = TEGRA194_MEMORY_CLIENT_AXIAPR,
+		.sid = TEGRA194_SID_PASSTHROUGH,
+		.regs = {
+			.sid = {
+				.override = 0x410,
+				.security = 0x414,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AXIAPW,
+		.name = "axiapw",
+		.sid = TEGRA194_SID_PASSTHROUGH,
+		.regs = {
+			.sid = {
+				.override = 0x418,
+				.security = 0x41c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ETRR,
+		.name = "etrr",
+		.sid = TEGRA194_SID_ETR,
+		.regs = {
+			.sid = {
+				.override = 0x420,
+				.security = 0x424,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ETRW,
+		.name = "etrw",
+		.sid = TEGRA194_SID_ETR,
+		.regs = {
+			.sid = {
+				.override = 0x428,
+				.security = 0x42c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AXISR,
+		.name = "axisr",
+		.sid = TEGRA194_SID_PASSTHROUGH,
+		.regs = {
+			.sid = {
+				.override = 0x460,
+				.security = 0x464,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AXISW,
+		.name = "axisw",
+		.sid = TEGRA194_SID_PASSTHROUGH,
+		.regs = {
+			.sid = {
+				.override = 0x468,
+				.security = 0x46c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_EQOSR,
+		.name = "eqosr",
+		.sid = TEGRA194_SID_EQOS,
+		.regs = {
+			.sid = {
+				.override = 0x470,
+				.security = 0x474,
+			},
+		},
+	}, {
+		.name = "eqosw",
+		.id = TEGRA194_MEMORY_CLIENT_EQOSW,
+		.sid = TEGRA194_SID_EQOS,
+		.regs = {
+			.sid = {
+				.override = 0x478,
+				.security = 0x47c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_UFSHCR,
+		.name = "ufshcr",
+		.sid = TEGRA194_SID_UFSHC,
+		.regs = {
+			.sid = {
+				.override = 0x480,
+				.security = 0x484,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_UFSHCW,
+		.name = "ufshcw",
+		.sid = TEGRA194_SID_UFSHC,
+		.regs = {
+			.sid = {
+				.override = 0x488,
+				.security = 0x48c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDISPLAYR,
+		.name = "nvdisplayr",
+		.sid = TEGRA194_SID_NVDISPLAY,
+		.regs = {
+			.sid = {
+				.override = 0x490,
+				.security = 0x494,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_BPMPR,
+		.name = "bpmpr",
+		.sid = TEGRA194_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x498,
+				.security = 0x49c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_BPMPW,
+		.name = "bpmpw",
+		.sid = TEGRA194_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x4a0,
+				.security = 0x4a4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_BPMPDMAR,
+		.name = "bpmpdmar",
+		.sid = TEGRA194_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x4a8,
+				.security = 0x4ac,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_BPMPDMAW,
+		.name = "bpmpdmaw",
+		.sid = TEGRA194_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x4b0,
+				.security = 0x4b4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AONR,
+		.name = "aonr",
+		.sid = TEGRA194_SID_AON,
+		.regs = {
+			.sid = {
+				.override = 0x4b8,
+				.security = 0x4bc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AONW,
+		.name = "aonw",
+		.sid = TEGRA194_SID_AON,
+		.regs = {
+			.sid = {
+				.override = 0x4c0,
+				.security = 0x4c4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AONDMAR,
+		.name = "aondmar",
+		.sid = TEGRA194_SID_AON,
+		.regs = {
+			.sid = {
+				.override = 0x4c8,
+				.security = 0x4cc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_AONDMAW,
+		.name = "aondmaw",
+		.sid = TEGRA194_SID_AON,
+		.regs = {
+			.sid = {
+				.override = 0x4d0,
+				.security = 0x4d4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SCER,
+		.name = "scer",
+		.sid = TEGRA194_SID_SCE,
+		.regs = {
+			.sid = {
+				.override = 0x4d8,
+				.security = 0x4dc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SCEW,
+		.name = "scew",
+		.sid = TEGRA194_SID_SCE,
+		.regs = {
+			.sid = {
+				.override = 0x4e0,
+				.security = 0x4e4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SCEDMAR,
+		.name = "scedmar",
+		.sid = TEGRA194_SID_SCE,
+		.regs = {
+			.sid = {
+				.override = 0x4e8,
+				.security = 0x4ec,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_SCEDMAW,
+		.name = "scedmaw",
+		.sid = TEGRA194_SID_SCE,
+		.regs = {
+			.sid = {
+				.override = 0x4f0,
+				.security = 0x4f4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_APEDMAR,
+		.name = "apedmar",
+		.sid = TEGRA194_SID_APE,
+		.regs = {
+			.sid = {
+				.override = 0x4f8,
+				.security = 0x4fc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_APEDMAW,
+		.name = "apedmaw",
+		.sid = TEGRA194_SID_APE,
+		.regs = {
+			.sid = {
+				.override = 0x500,
+				.security = 0x504,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDISPLAYR1,
+		.name = "nvdisplayr1",
+		.sid = TEGRA194_SID_NVDISPLAY,
+		.regs = {
+			.sid = {
+				.override = 0x508,
+				.security = 0x50c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VICSRD1,
+		.name = "vicsrd1",
+		.sid = TEGRA194_SID_VIC,
+		.regs = {
+			.sid = {
+				.override = 0x510,
+				.security = 0x514,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDECSRD1,
+		.name = "nvdecsrd1",
+		.sid = TEGRA194_SID_NVDEC,
+		.regs = {
+			.sid = {
+				.override = 0x518,
+				.security = 0x51c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU0R,
+		.name = "miu0r",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x530,
+				.security = 0x534,
+			},
+		},
+	}, {
+		.name = "miu0w",
+		.id = TEGRA194_MEMORY_CLIENT_MIU0W,
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x538,
+				.security = 0x53c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU1R,
+		.name = "miu1r",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x540,
+				.security = 0x544,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU1W,
+		.name = "miu1w",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x548,
+				.security = 0x54c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU2R,
+		.name = "miu2r",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x570,
+				.security = 0x574,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU2W,
+		.name = "miu2w",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x578,
+				.security = 0x57c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU3R,
+		.name = "miu3r",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x580,
+				.security = 0x584,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU3W,
+		.name = "miu3w",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x588,
+				.security = 0x58c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU4R,
+		.name = "miu4r",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x590,
+				.security = 0x594,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU4W,
+		.name = "miu4w",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x598,
+				.security = 0x59c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DPMUR,
+		.name = "dpmur",
+		.sid = TEGRA194_SID_PASSTHROUGH,
+		.regs = {
+			.sid = {
+				.override = 0x598,
+				.security = 0x59c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VIFALR,
+		.name = "vifalr",
+		.sid = TEGRA194_SID_VI_FALCON,
+		.regs = {
+			.sid = {
+				.override = 0x5e0,
+				.security = 0x5e4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_VIFALW,
+		.name = "vifalw",
+		.sid = TEGRA194_SID_VI_FALCON,
+		.regs = {
+			.sid = {
+				.override = 0x5e8,
+				.security = 0x5ec,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0RDA,
+		.name = "dla0rda",
+		.sid = TEGRA194_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x5f0,
+				.security = 0x5f4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0FALRDB,
+		.name = "dla0falrdb",
+		.sid = TEGRA194_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x5f8,
+				.security = 0x5fc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0WRA,
+		.name = "dla0wra",
+		.sid = TEGRA194_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x600,
+				.security = 0x604,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0FALWRB,
+		.name = "dla0falwrb",
+		.sid = TEGRA194_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x608,
+				.security = 0x60c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1RDA,
+		.name = "dla1rda",
+		.sid = TEGRA194_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x610,
+				.security = 0x614,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1FALRDB,
+		.name = "dla1falrdb",
+		.sid = TEGRA194_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x618,
+				.security = 0x61c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1WRA,
+		.name = "dla1wra",
+		.sid = TEGRA194_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x620,
+				.security = 0x624,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1FALWRB,
+		.name = "dla1falwrb",
+		.sid = TEGRA194_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x628,
+				.security = 0x62c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDA,
+		.name = "pva0rda",
+		.sid = TEGRA194_SID_PVA0,
+		.regs = {
+			.sid = {
+				.override = 0x630,
+				.security = 0x634,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDB,
+		.name = "pva0rdb",
+		.sid = TEGRA194_SID_PVA0,
+		.regs = {
+			.sid = {
+				.override = 0x638,
+				.security = 0x63c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDC,
+		.name = "pva0rdc",
+		.sid = TEGRA194_SID_PVA0,
+		.regs = {
+			.sid = {
+				.override = 0x640,
+				.security = 0x644,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0WRA,
+		.name = "pva0wra",
+		.sid = TEGRA194_SID_PVA0,
+		.regs = {
+			.sid = {
+				.override = 0x648,
+				.security = 0x64c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0WRB,
+		.name = "pva0wrb",
+		.sid = TEGRA194_SID_PVA0,
+		.regs = {
+			.sid = {
+				.override = 0x650,
+				.security = 0x654,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0WRC,
+		.name = "pva0wrc",
+		.sid = TEGRA194_SID_PVA0,
+		.regs = {
+			.sid = {
+				.override = 0x658,
+				.security = 0x65c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDA,
+		.name = "pva1rda",
+		.sid = TEGRA194_SID_PVA1,
+		.regs = {
+			.sid = {
+				.override = 0x660,
+				.security = 0x664,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDB,
+		.name = "pva1rdb",
+		.sid = TEGRA194_SID_PVA1,
+		.regs = {
+			.sid = {
+				.override = 0x668,
+				.security = 0x66c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDC,
+		.name = "pva1rdc",
+		.sid = TEGRA194_SID_PVA1,
+		.regs = {
+			.sid = {
+				.override = 0x670,
+				.security = 0x674,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1WRA,
+		.name = "pva1wra",
+		.sid = TEGRA194_SID_PVA1,
+		.regs = {
+			.sid = {
+				.override = 0x678,
+				.security = 0x67c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1WRB,
+		.name = "pva1wrb",
+		.sid = TEGRA194_SID_PVA1,
+		.regs = {
+			.sid = {
+				.override = 0x680,
+				.security = 0x684,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1WRC,
+		.name = "pva1wrc",
+		.sid = TEGRA194_SID_PVA1,
+		.regs = {
+			.sid = {
+				.override = 0x688,
+				.security = 0x68c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_RCER,
+		.name = "rcer",
+		.sid = TEGRA194_SID_RCE,
+		.regs = {
+			.sid = {
+				.override = 0x690,
+				.security = 0x694,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_RCEW,
+		.name = "rcew",
+		.sid = TEGRA194_SID_RCE,
+		.regs = {
+			.sid = {
+				.override = 0x698,
+				.security = 0x69c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_RCEDMAR,
+		.name = "rcedmar",
+		.sid = TEGRA194_SID_RCE,
+		.regs = {
+			.sid = {
+				.override = 0x6a0,
+				.security = 0x6a4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_RCEDMAW,
+		.name = "rcedmaw",
+		.sid = TEGRA194_SID_RCE,
+		.regs = {
+			.sid = {
+				.override = 0x6a8,
+				.security = 0x6ac,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENC1SRD,
+		.name = "nvenc1srd",
+		.sid = TEGRA194_SID_NVENC1,
+		.regs = {
+			.sid = {
+				.override = 0x6b0,
+				.security = 0x6b4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENC1SWR,
+		.name = "nvenc1swr",
+		.sid = TEGRA194_SID_NVENC1,
+		.regs = {
+			.sid = {
+				.override = 0x6b8,
+				.security = 0x6bc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE0R,
+		.name = "pcie0r",
+		.sid = TEGRA194_SID_PCIE0,
+		.regs = {
+			.sid = {
+				.override = 0x6c0,
+				.security = 0x6c4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE0W,
+		.name = "pcie0w",
+		.sid = TEGRA194_SID_PCIE0,
+		.regs = {
+			.sid = {
+				.override = 0x6c8,
+				.security = 0x6cc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE1R,
+		.name = "pcie1r",
+		.sid = TEGRA194_SID_PCIE1,
+		.regs = {
+			.sid = {
+				.override = 0x6d0,
+				.security = 0x6d4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE1W,
+		.name = "pcie1w",
+		.sid = TEGRA194_SID_PCIE1,
+		.regs = {
+			.sid = {
+				.override = 0x6d8,
+				.security = 0x6dc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE2AR,
+		.name = "pcie2ar",
+		.sid = TEGRA194_SID_PCIE2,
+		.regs = {
+			.sid = {
+				.override = 0x6e0,
+				.security = 0x6e4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE2AW,
+		.name = "pcie2aw",
+		.sid = TEGRA194_SID_PCIE2,
+		.regs = {
+			.sid = {
+				.override = 0x6e8,
+				.security = 0x6ec,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE3R,
+		.name = "pcie3r",
+		.sid = TEGRA194_SID_PCIE3,
+		.regs = {
+			.sid = {
+				.override = 0x6f0,
+				.security = 0x6f4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE3W,
+		.name = "pcie3w",
+		.sid = TEGRA194_SID_PCIE3,
+		.regs = {
+			.sid = {
+				.override = 0x6f8,
+				.security = 0x6fc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE4R,
+		.name = "pcie4r",
+		.sid = TEGRA194_SID_PCIE4,
+		.regs = {
+			.sid = {
+				.override = 0x700,
+				.security = 0x704,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE4W,
+		.name = "pcie4w",
+		.sid = TEGRA194_SID_PCIE4,
+		.regs = {
+			.sid = {
+				.override = 0x708,
+				.security = 0x70c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE5R,
+		.name = "pcie5r",
+		.sid = TEGRA194_SID_PCIE5,
+		.regs = {
+			.sid = {
+				.override = 0x710,
+				.security = 0x714,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE5W,
+		.name = "pcie5w",
+		.sid = TEGRA194_SID_PCIE5,
+		.regs = {
+			.sid = {
+				.override = 0x718,
+				.security = 0x71c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPFALW,
+		.name = "ispfalw",
+		.sid = TEGRA194_SID_ISP_FALCON,
+		.regs = {
+			.sid = {
+				.override = 0x720,
+				.security = 0x724,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA0RDA1,
+		.name = "dla0rda1",
+		.sid = TEGRA194_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x748,
+				.security = 0x74c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_DLA1RDA1,
+		.name = "dla1rda1",
+		.sid = TEGRA194_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x750,
+				.security = 0x754,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDA1,
+		.name = "pva0rda1",
+		.sid = TEGRA194_SID_PVA0,
+		.regs = {
+			.sid = {
+				.override = 0x758,
+				.security = 0x75c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA0RDB1,
+		.name = "pva0rdb1",
+		.sid = TEGRA194_SID_PVA0,
+		.regs = {
+			.sid = {
+				.override = 0x760,
+				.security = 0x764,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDA1,
+		.name = "pva1rda1",
+		.sid = TEGRA194_SID_PVA1,
+		.regs = {
+			.sid = {
+				.override = 0x768,
+				.security = 0x76c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PVA1RDB1,
+		.name = "pva1rdb1",
+		.sid = TEGRA194_SID_PVA1,
+		.regs = {
+			.sid = {
+				.override = 0x770,
+				.security = 0x774,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE5R1,
+		.name = "pcie5r1",
+		.sid = TEGRA194_SID_PCIE5,
+		.regs = {
+			.sid = {
+				.override = 0x778,
+				.security = 0x77c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENCSRD1,
+		.name = "nvencsrd1",
+		.sid = TEGRA194_SID_NVENC,
+		.regs = {
+			.sid = {
+				.override = 0x780,
+				.security = 0x784,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVENC1SRD1,
+		.name = "nvenc1srd1",
+		.sid = TEGRA194_SID_NVENC1,
+		.regs = {
+			.sid = {
+				.override = 0x788,
+				.security = 0x78c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_ISPRA1,
+		.name = "ispra1",
+		.sid = TEGRA194_SID_ISP,
+		.regs = {
+			.sid = {
+				.override = 0x790,
+				.security = 0x794,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_PCIE0R1,
+		.name = "pcie0r1",
+		.sid = TEGRA194_SID_PCIE0,
+		.regs = {
+			.sid = {
+				.override = 0x798,
+				.security = 0x79c,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDEC1SRD,
+		.name = "nvdec1srd",
+		.sid = TEGRA194_SID_NVDEC1,
+		.regs = {
+			.sid = {
+				.override = 0x7c8,
+				.security = 0x7cc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDEC1SRD1,
+		.name = "nvdec1srd1",
+		.sid = TEGRA194_SID_NVDEC1,
+		.regs = {
+			.sid = {
+				.override = 0x7d0,
+				.security = 0x7d4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_NVDEC1SWR,
+		.name = "nvdec1swr",
+		.sid = TEGRA194_SID_NVDEC1,
+		.regs = {
+			.sid = {
+				.override = 0x7d8,
+				.security = 0x7dc,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU5R,
+		.name = "miu5r",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x7e0,
+				.security = 0x7e4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU5W,
+		.name = "miu5w",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x7e8,
+				.security = 0x7ec,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU6R,
+		.name = "miu6r",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x7f0,
+				.security = 0x7f4,
+			},
+		},
+	}, {
+		.id = TEGRA194_MEMORY_CLIENT_MIU6W,
+		.name = "miu6w",
+		.sid = TEGRA194_SID_MIU,
+		.regs = {
+			.sid = {
+				.override = 0x7f8,
+				.security = 0x7fc,
+			},
+		},
+	},
+};
+
+const struct tegra_mc_soc tegra194_mc_soc = {
+	.num_clients = ARRAY_SIZE(tegra194_mc_clients),
+	.clients = tegra194_mc_clients,
+	.num_address_bits = 40,
+	.ops = &tegra186_mc_ops,
+};
+#endif
-- 
2.31.1

