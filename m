Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375B7C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E273423104
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbhALNvk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 08:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbhALNvk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 08:51:40 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABAAC061786
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 05:50:59 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id u21so2947443lja.0
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 05:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OOlG1giTazWfU4iSByRDK53U9tVlHin/rcRA4cBgI/U=;
        b=MY8gg0Zeq7avAK99WcTbOwAvsUas0bRumQIl8vPYHxZyKN04gihmII3WZBK10DWcHq
         0fVpS7/klleBHdc9voqTlbl06h+1RIF762MqGHzYs1oL9GwHOvRa2Lzla9DYgmHbB8Qi
         P2wbEioTLhbBZpd/ZFiuVgyRc/bTjlJoGFmKSFWmggYcj7xJw6KKYyC7s/biRmiXlYeq
         lxbMd7jLO+3AEJ8teNj1yz4A5CDjvEkWgFPrhMWw7LQiBvRuzrsZYsKtfuWqfC2JzOn5
         aswKFkJ2vguV73NHzL0Ozf+AWNRrLaMicPHlgl5pnXZ29BuL2URbJuZa3zFELubFIiLZ
         veOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OOlG1giTazWfU4iSByRDK53U9tVlHin/rcRA4cBgI/U=;
        b=VahsRfmHGRT+f7J9pZK9XItoQYmfIdhMsMn21TDtPZIczFNr67e1GfO5NOV0h3N+5H
         96JqlKcbPfLrOt333mbYdxVty/IH7dsCkwz32VGjokrnKc0DZ3iXK5EQpehcpkKPrQPA
         3TKaK2dM/SfzJdc1uet8GOgH894yIDNeue1jPZnGEW5Qx4IPwG+pEcOI+TPBsxqfLiWP
         czJW8IBQQneeZmFrXnmdrukn/H0zq2Gu33k+9qdGmbVmsl3lMtX7tx89kgRQtHUnWaqW
         Jkyvpf6kI2PUQfbUP4mYZc7Ezc3x5kybFUcFuayxPMuKGHmgvQYbPTYrXR2jxaT6givJ
         YJXw==
X-Gm-Message-State: AOAM533EPR0chclK6tjCUoYgGQ7Z5jCLwRasRcqDOczkNIUDysEqtToN
        V2JtRGz4DejQs3nefjhfRbkAGyJ6ySA=
X-Google-Smtp-Source: ABdhPJwoZhs4y/XCwGgr2EcHrGXsPFqb1lk+UzllfO6wR3/pAfmgU0bSv4XE1/sG1iL/SYWCShCcUA==
X-Received: by 2002:a2e:b544:: with SMTP id a4mr2086229ljn.371.1610459458341;
        Tue, 12 Jan 2021 05:50:58 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id d24sm400558lfc.225.2021.01.12.05.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 05:50:57 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1] ARM: tegra: Don't enable unused PLLs on resume from suspend
Date:   Tue, 12 Jan 2021 16:50:31 +0300
Message-Id: <20210112135031.3196-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

PLLC and PLLM are usually disabled on system suspend because all devices
which use these PLLs are either suspended or switched away to other clock
source. Don't enable unused PLLs on resume from suspend by keeping track
of the enable-state of the PLLs across suspend-resume.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra20.S | 38 ++++++++++--
 arch/arm/mach-tegra/sleep-tegra30.S | 94 +++++++++++++++++++++++------
 2 files changed, 108 insertions(+), 24 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra20.S b/arch/arm/mach-tegra/sleep-tegra20.S
index 0e00ba8cf646..a5a36cce142a 100644
--- a/arch/arm/mach-tegra/sleep-tegra20.S
+++ b/arch/arm/mach-tegra/sleep-tegra20.S
@@ -43,11 +43,34 @@
 #define APB_MISC_XM2CFGCPADCTRL2	0x8e4
 #define APB_MISC_XM2CFGDPADCTRL2	0x8e8
 
-.macro pll_enable, rd, r_car_base, pll_base
+#define PLLC_STORE_MASK			(1 << 0)
+#define PLLM_STORE_MASK			(1 << 1)
+#define PLLP_STORE_MASK			(1 << 2)
+
+.macro test_pll_state, rd, test_mask
+	ldr	\rd, tegra_pll_state
+	tst	\rd, #\test_mask
+.endm
+
+.macro store_pll_state, rd, tmp, r_car_base, pll_base, pll_mask
+	ldr	\rd, [\r_car_base, #\pll_base]
+	tst	\rd, #(1 << 30)
+	ldr	\rd, tegra_pll_state
+	biceq	\rd, \rd, #\pll_mask
+	orrne	\rd, \rd, #\pll_mask
+	adr	\tmp, tegra_pll_state
+	str	\rd, [\tmp]
+.endm
+
+.macro pll_enable, rd, r_car_base, pll_base, test_mask
+	test_pll_state \rd, \test_mask
+	beq	1f
+
 	ldr	\rd, [\r_car_base, #\pll_base]
 	tst	\rd, #(1 << 30)
 	orreq	\rd, \rd, #(1 << 30)
 	streq	\rd, [\r_car_base, #\pll_base]
+1:
 .endm
 
 .macro emc_device_mask, rd, base
@@ -177,9 +200,9 @@ ENTRY(tegra20_lp1_reset)
 	str	r1, [r0, #CLK_RESET_CCLK_DIVIDER]
 	str	r1, [r0, #CLK_RESET_SCLK_DIVIDER]
 
-	pll_enable r1, r0, CLK_RESET_PLLM_BASE
-	pll_enable r1, r0, CLK_RESET_PLLP_BASE
-	pll_enable r1, r0, CLK_RESET_PLLC_BASE
+	pll_enable r1, r0, CLK_RESET_PLLM_BASE, PLLM_STORE_MASK
+	pll_enable r1, r0, CLK_RESET_PLLP_BASE, PLLP_STORE_MASK
+	pll_enable r1, r0, CLK_RESET_PLLC_BASE, PLLC_STORE_MASK
 
 	adr	r2, tegra20_sdram_pad_address
 	adr	r4, tegra20_sdram_pad_save
@@ -270,6 +293,10 @@ tegra20_switch_cpu_to_clk32k:
 	add	r1, r1, #2
 	wait_until r1, r7, r9
 
+	store_pll_state r0, r1, r5, CLK_RESET_PLLC_BASE, PLLC_STORE_MASK
+	store_pll_state r0, r1, r5, CLK_RESET_PLLM_BASE, PLLM_STORE_MASK
+	store_pll_state r0, r1, r5, CLK_RESET_PLLP_BASE, PLLP_STORE_MASK
+
 	/* disable PLLM, PLLP and PLLC */
 	ldr	r0, [r5, #CLK_RESET_PLLM_BASE]
 	bic	r0, r0, #(1 << 30)
@@ -396,6 +423,9 @@ tegra20_sdram_pad_save:
 	.long	0
 	.endr
 
+tegra_pll_state:
+	.word	0x0
+
 	.ltorg
 /* dummy symbol for end of IRAM */
 	.align L1_CACHE_SHIFT
diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 2667bcdb5dc6..0cc40b6b2ba3 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -71,6 +71,13 @@
 
 #define TEGRA30_POWER_HOTPLUG_SHUTDOWN	(1 << 27) /* Hotplug shutdown */
 
+#define PLLA_STORE_MASK			(1 << 0)
+#define PLLC_STORE_MASK			(1 << 1)
+#define PLLM_STORE_MASK			(1 << 2)
+#define PLLP_STORE_MASK			(1 << 3)
+#define PLLX_STORE_MASK			(1 << 4)
+#define PLLM_PMC_STORE_MASK		(1 << 5)
+
 .macro emc_device_mask, rd, base
 	ldr	\rd, [\base, #EMC_ADR_CFG]
 	tst	\rd, #0x1
@@ -87,7 +94,43 @@
 	bne	1001b
 .endm
 
-.macro pll_enable, rd, r_car_base, pll_base, pll_misc
+.macro test_pll_state, rd, test_mask
+	ldr	\rd, tegra_pll_state
+	tst	\rd, #\test_mask
+.endm
+
+.macro store_pll_state, rd, tmp, r_car_base, pll_base, pll_mask
+	ldr	\rd, [\r_car_base, #\pll_base]
+	tst	\rd, #(1 << 30)
+	ldr	\rd, tegra_pll_state
+	biceq	\rd, \rd, #\pll_mask
+	orrne	\rd, \rd, #\pll_mask
+	adr	\tmp, tegra_pll_state
+	str	\rd, [\tmp]
+.endm
+
+.macro store_pllm_pmc_state, rd, tmp, pmc_base
+	ldr	\rd, [\pmc_base, #PMC_PLLP_WB0_OVERRIDE]
+	tst	\rd, #(1 << 12)
+	ldr	\rd, tegra_pll_state
+	biceq	\rd, \rd, #PLLM_PMC_STORE_MASK
+	orrne	\rd, \rd, #PLLM_PMC_STORE_MASK
+	adr	\tmp, tegra_pll_state
+	str	\rd, [\tmp]
+.endm
+
+.macro pllm_pmc_enable, rd, pmc_base
+	test_pll_state \rd, PLLM_PMC_STORE_MASK
+
+	ldrne	\rd, [\pmc_base, #PMC_PLLP_WB0_OVERRIDE]
+	orrne	\rd, \rd, #(1 << 12)
+	strne	\rd, [\pmc_base, #PMC_PLLP_WB0_OVERRIDE]
+.endm
+
+.macro pll_enable, rd, r_car_base, pll_base, pll_misc, test_mask
+	test_pll_state \rd, \test_mask
+	beq	1f
+
 	ldr	\rd, [\r_car_base, #\pll_base]
 	tst	\rd, #(1 << 30)
 	orreq	\rd, \rd, #(1 << 30)
@@ -102,13 +145,17 @@
 	orr	\rd, \rd, #(1 << 18)
 	str	\rd, [\r_car_base, #\pll_misc]
 	.endif
+1:
 .endm
 
-.macro pll_locked, rd, r_car_base, pll_base
+.macro pll_locked, rd, r_car_base, pll_base, test_mask
+	test_pll_state \rd, \test_mask
+	beq	2f
 1:
 	ldr	\rd, [\r_car_base, #\pll_base]
 	tst	\rd, #(1 << 27)
 	beq	1b
+2:
 .endm
 
 .macro pll_iddq_exit, rd, car, iddq, iddq_bit
@@ -342,34 +389,30 @@ ENTRY(tegra30_lp1_reset)
 
 	/* enable PLLM via PMC */
 	mov32	r2, TEGRA_PMC_BASE
-	ldr	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
-	orr	r1, r1, #(1 << 12)
-	str	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
+	pllm_pmc_enable r1, r2
 
-	pll_enable r1, r0, CLK_RESET_PLLM_BASE, 0
-	pll_enable r1, r0, CLK_RESET_PLLC_BASE, 0
-	pll_enable r1, r0, CLK_RESET_PLLX_BASE, 0
+	pll_enable r1, r0, CLK_RESET_PLLM_BASE, 0, PLLM_STORE_MASK
+	pll_enable r1, r0, CLK_RESET_PLLC_BASE, 0, PLLC_STORE_MASK
+	pll_enable r1, r0, CLK_RESET_PLLX_BASE, 0, PLLX_STORE_MASK
 
 	b	_pll_m_c_x_done
 
 _no_pll_iddq_exit:
 	/* enable PLLM via PMC */
 	mov32	r2, TEGRA_PMC_BASE
-	ldr	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
-	orr	r1, r1, #(1 << 12)
-	str	r1, [r2, #PMC_PLLP_WB0_OVERRIDE]
+	pllm_pmc_enable r1, r2
 
-	pll_enable r1, r0, CLK_RESET_PLLM_BASE, CLK_RESET_PLLM_MISC
-	pll_enable r1, r0, CLK_RESET_PLLC_BASE, CLK_RESET_PLLC_MISC
+	pll_enable r1, r0, CLK_RESET_PLLM_BASE, CLK_RESET_PLLM_MISC, PLLM_STORE_MASK
+	pll_enable r1, r0, CLK_RESET_PLLC_BASE, CLK_RESET_PLLC_MISC, PLLC_STORE_MASK
 
 _pll_m_c_x_done:
-	pll_enable r1, r0, CLK_RESET_PLLP_BASE, CLK_RESET_PLLP_MISC
-	pll_enable r1, r0, CLK_RESET_PLLA_BASE, CLK_RESET_PLLA_MISC
+	pll_enable r1, r0, CLK_RESET_PLLP_BASE, CLK_RESET_PLLP_MISC, PLLP_STORE_MASK
+	pll_enable r1, r0, CLK_RESET_PLLA_BASE, CLK_RESET_PLLA_MISC, PLLA_STORE_MASK
 
-	pll_locked r1, r0, CLK_RESET_PLLM_BASE
-	pll_locked r1, r0, CLK_RESET_PLLP_BASE
-	pll_locked r1, r0, CLK_RESET_PLLA_BASE
-	pll_locked r1, r0, CLK_RESET_PLLC_BASE
+	pll_locked r1, r0, CLK_RESET_PLLM_BASE, PLLM_STORE_MASK
+	pll_locked r1, r0, CLK_RESET_PLLP_BASE, PLLP_STORE_MASK
+	pll_locked r1, r0, CLK_RESET_PLLA_BASE, PLLA_STORE_MASK
+	pll_locked r1, r0, CLK_RESET_PLLC_BASE, PLLC_STORE_MASK
 
 	/*
 	 * CPUFreq driver could select other PLL for CPU. PLLX will be
@@ -380,7 +423,7 @@ _pll_m_c_x_done:
 	cmp	r1, #TEGRA30
 	beq	1f
 
-	pll_locked r1, r0, CLK_RESET_PLLX_BASE
+	pll_locked r1, r0, CLK_RESET_PLLX_BASE, PLLX_STORE_MASK
 
 	ldr	r1, [r0, #CLK_RESET_PLLP_BASE]
 	bic	r1, r1, #(1<<31)	@ disable PllP bypass
@@ -593,6 +636,9 @@ tegra_sdram_pad_save:
 	.long	0
 	.endr
 
+tegra_pll_state:
+	.word	0x0
+
 /*
  * tegra30_tear_down_core
  *
@@ -641,6 +687,14 @@ tegra30_switch_cpu_to_clk32k:
 	add	r1, r1, #2
 	wait_until r1, r7, r9
 
+	/* store enable-state of PLLs */
+	store_pll_state r0, r1, r5, CLK_RESET_PLLA_BASE, PLLA_STORE_MASK
+	store_pll_state r0, r1, r5, CLK_RESET_PLLC_BASE, PLLC_STORE_MASK
+	store_pll_state r0, r1, r5, CLK_RESET_PLLM_BASE, PLLM_STORE_MASK
+	store_pll_state r0, r1, r5, CLK_RESET_PLLP_BASE, PLLP_STORE_MASK
+	store_pll_state r0, r1, r5, CLK_RESET_PLLX_BASE, PLLX_STORE_MASK
+	store_pllm_pmc_state r0, r1, r4
+
 	/* disable PLLM via PMC in LP1 */
 	ldr	r0, [r4, #PMC_PLLP_WB0_OVERRIDE]
 	bic	r0, r0, #(1 << 12)
-- 
2.29.2

