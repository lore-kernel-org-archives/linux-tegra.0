Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC7FC433C1
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A816561A2B
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhCYQku (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhCYQkt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:40:49 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020ECC06174A;
        Thu, 25 Mar 2021 09:40:49 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id c8so2928590wrq.11;
        Thu, 25 Mar 2021 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BIOzYjpuWV2ikVARWL5rnMXlYplC4fVIyiluPMIE1oE=;
        b=T+5lmaYU0760xN0cgcjj5c8+SDzlH7A/atUQUf4fLVOx2WE54T7z8ZItEJZl86LVVR
         o0FPEerykYnJ0HBljGhYcwKI4YJepfTiet/oep+mOhuOJOvgJyonZP+cHnoTSfmLfYWV
         lRPTLweJBT7lz99SB3JACg4kCo0ZbWBiI2jLX8C6u9fzHoCJy4GGRANnNF+O3SvYEXDB
         UYAzmpR8wcGZc4F+05TL3vSTLf+98outM3Z9NS+G69NKHOAEx158eCryef57QwYZiKpz
         5/PU5edUocmXm1scX0khV7VMSg2OVn7VZPp69hyzYYEEZAF5mdyx36Lx04en2FUyCY5r
         U6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BIOzYjpuWV2ikVARWL5rnMXlYplC4fVIyiluPMIE1oE=;
        b=K+Z/31YAA5ls/sasobFPBq7Hh4F3hbhTlBTIDovMt54ebsMPjBePti1xycS9GjrKYW
         BXnE1S6iuh5uOMyNoV254EpSbWdjjjl8BcoQD1KWt8JEcWgqxpNmjZnknJQXTtOIH0Dz
         slh066BwveNLJykjyRWaqnmpnG9A1GM1AdSuJNHFc8u3Jxw7fg36IIr1qWccRnw/Nc8s
         1zWGmBegzRSAmHnazHbxJv3eLu3rjd2PeIO3RsTvxEUjzIL2UZ6g238WOkcsk+Zn/cF8
         o8R6Ql83JbP4+vHfl76R9QC4wngz3B/HCQWVQPoHPS17EMTibdPD/fVSevHgzgZEfu2V
         SKug==
X-Gm-Message-State: AOAM533gTf/iP0YI+6gWXTGu6HvL/UjO0J1twSGCjmNKjCFkyfNuxXRu
        +R8atmB2EJrgrP8gZG0T61g=
X-Google-Smtp-Source: ABdhPJyZAKo+sD+iopvWd3BFRQ8xlnIOc5+qTBvaeiQHoQwgOF2llYd0lTLSDaZWT58a8VW8MaFZOw==
X-Received: by 2002:adf:9261:: with SMTP id 88mr9676623wrj.270.1616690447651;
        Thu, 25 Mar 2021 09:40:47 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j16sm11847179wmi.2.2021.03.25.09.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:40:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v8 01/13] clk: tegra: Add PLLE HW power sequencer control
Date:   Thu, 25 Mar 2021 17:40:45 +0100
Message-Id: <20210325164057.793954-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

PLLE has a hardware power sequencer logic which is a state machine
that can power on/off PLLE without any software intervention. The
sequencer has two inputs, one from XUSB UPHY PLL and the other from
SATA UPHY PLL. PLLE provides reference clock to XUSB and SATA UPHY
PLLs. When both of the downstream PLLs are powered-off, PLLE hardware
power sequencer will automatically power off PLLE for power saving.

XUSB and SATA UPHY PLLs also have their own hardware power sequencer
logic. XUSB UPHY PLL is shared between XUSB SuperSpeed ports and PCIE
controllers. The XUSB UPHY PLL hardware power sequencer has inputs
from XUSB and PCIE. When all of the XUSB SuperSpeed ports and PCIE
controllers are in low power state, XUSB UPHY PLL hardware power
sequencer automatically power off PLL and flags idle to PLLE hardware
power sequencer. Similar applies to SATA UPHY PLL.

PLLE hardware power sequencer has to be enabled after both downstream
sequencers are enabled.

This commit adds two helper functions:
1. tegra210_plle_hw_sequence_start() for XUSB PADCTL driver to enable
   PLLE hardware sequencer at proper time.

2. tegra210_plle_hw_sequence_is_enabled() for XUSB PADCTL driver to
   check whether PLLE hardware sequencer has been enabled or not.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 53 +++++++++++++++++++++++++++++++-
 include/linux/clk/tegra.h        |  4 ++-
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 68cbb98af567..b9099012dc7b 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2012-2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2012-2020 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/io.h>
@@ -403,6 +403,14 @@ static unsigned long tegra210_input_freq[] = {
 #define PLLRE_BASE_DEFAULT_MASK		0x1c000000
 #define PLLRE_MISC0_WRITE_MASK		0x67ffffff
 
+/* PLLE */
+#define PLLE_MISC_IDDQ_SW_CTRL		(1 << 14)
+#define PLLE_AUX_USE_LOCKDET		(1 << 3)
+#define PLLE_AUX_SS_SEQ_INCLUDE		(1 << 31)
+#define PLLE_AUX_ENABLE_SWCTL		(1 << 4)
+#define PLLE_AUX_SS_SWCTL		(1 << 6)
+#define PLLE_AUX_SEQ_ENABLE		(1 << 24)
+
 /* PLLX */
 #define PLLX_USE_DYN_RAMP		1
 #define PLLX_BASE_LOCK			(1 << 27)
@@ -489,6 +497,49 @@ static unsigned long tegra210_input_freq[] = {
 #define PLLU_MISC0_WRITE_MASK		0xbfffffff
 #define PLLU_MISC1_WRITE_MASK		0x00000007
 
+bool tegra210_plle_hw_sequence_is_enabled(void)
+{
+	u32 value;
+
+	value = readl_relaxed(clk_base + PLLE_AUX);
+	if (value & PLLE_AUX_SEQ_ENABLE)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(tegra210_plle_hw_sequence_is_enabled);
+
+int tegra210_plle_hw_sequence_start(void)
+{
+	u32 value;
+
+	if (tegra210_plle_hw_sequence_is_enabled())
+		return 0;
+
+	/* skip if PLLE is not enabled yet */
+	value = readl_relaxed(clk_base + PLLE_MISC0);
+	if (!(value & PLLE_MISC_LOCK))
+		return -EIO;
+
+	value &= ~PLLE_MISC_IDDQ_SW_CTRL;
+	writel_relaxed(value, clk_base + PLLE_MISC0);
+
+	value = readl_relaxed(clk_base + PLLE_AUX);
+	value |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
+	value &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
+	writel_relaxed(value, clk_base + PLLE_AUX);
+
+	fence_udelay(1, clk_base);
+
+	value |= PLLE_AUX_SEQ_ENABLE;
+	writel_relaxed(value, clk_base + PLLE_AUX);
+
+	fence_udelay(1, clk_base);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra210_plle_hw_sequence_start);
+
 void tegra210_xusb_pll_hw_control_enable(void)
 {
 	u32 val;
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index eb016fc9cc0b..f7ff722a03dd 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2012-2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #ifndef __LINUX_CLK_TEGRA_H_
@@ -123,6 +123,8 @@ static inline void tegra_cpu_clock_resume(void)
 }
 #endif
 
+extern int tegra210_plle_hw_sequence_start(void);
+extern bool tegra210_plle_hw_sequence_is_enabled(void);
 extern void tegra210_xusb_pll_hw_control_enable(void);
 extern void tegra210_xusb_pll_hw_sequence_start(void);
 extern void tegra210_sata_pll_hw_control_enable(void);
-- 
2.30.2

