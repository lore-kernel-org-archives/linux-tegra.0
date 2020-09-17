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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573EAC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1641E21D7F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7BWZ1Dn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgIQKId (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgIQKI3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:29 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2AB9C061756
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:28 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e17so1394654wme.0
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mD53Yx+O1ZK3RaUnDozb4D2flLg9Q0zHUEzwcICI6A=;
        b=n7BWZ1DnO/LmGFW0QUKGCmot3Qtl0SKFlW5KcSVodPdfFbGKgCTmFxG5ZVqmlk/lTo
         z8y6U7LKcB4dbbg7WxUfzp+inaSoPaAQ9L5xIhGY6E5IEUKzZUkLsn/gQ2V4xncg7EKD
         Fzud7AexCh+Smc2z3CFbWs9fOmE5pP8oVHbuW34Y0KO22v9CZA8BAJiAEtKMNBp/T7+x
         YiQAkWOyYdTHfNAOfWxtYUD2jl6nGjIalTrcBlVSb2oJmuc/zkYcs9wAj8lq6F/c/1IM
         enoT+Ss2JULd8/p11aYmSvSiCGPuZj45lZlwSO3npZ0YP3/VEEVqFB3XLAabuuHl6rU/
         gbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mD53Yx+O1ZK3RaUnDozb4D2flLg9Q0zHUEzwcICI6A=;
        b=hc9VmCj64XR6vfyUitBoTf7sCc2lt+xO9iIoBKW9h+IfT/mZNnctEOQK2ufJUsKKdI
         DC4ohbuQ4gR6rIH6QUb3/0w8U9ohrgnlKQ/kwc6YgjxG7iN6UW7l5ZM0JBCyhSopiqwH
         jL4B0EvU0734oe31WhkCOjx2djHRLPcrZXDiR/85/L2ZnzB+0ehWJH3C+gYBx59aSwEr
         H+mEuDlZGWgoYrnZVXAATC9/vpF2l8vaN7ugt34JUVzL5PcsNdINo2isseDre50tQ8Zc
         GiJrdxuUpllxoql9ma7tlfDpYoauuvMw7TJx5tDXpZt2HRRLi3WY/ADidBAeucbs4bH3
         LTpA==
X-Gm-Message-State: AOAM53329a4tIkbnQrKfuDxOrLkoMuWapNH6yN00JAaO+Ee9/hLXiIRD
        AhROP7xuo0xigwisnIWzOus=
X-Google-Smtp-Source: ABdhPJy2i+oP2zSYg7uTpj2CtaVehUUt7SJu9rUpPlYujddunm4ps76/R0iGygi02ZoMu2ogSxLvHg==
X-Received: by 2002:a1c:6607:: with SMTP id a7mr9062430wmc.142.1600337307454;
        Thu, 17 Sep 2020 03:08:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u186sm9985236wmu.34.2020.09.17.03.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 11/14] soc/tegra: pmc: Reorder reset sources/levels definitions
Date:   Thu, 17 Sep 2020 12:07:49 +0200
Message-Id: <20200917100752.3516153-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Move the definitions of reset sources and levels into a more natural
location.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 78 ++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index d332e5d9abac..4071181a4a42 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -336,45 +336,6 @@ struct tegra_pmc_soc {
 	bool has_blink_output;
 };
 
-static const char * const tegra186_reset_sources[] = {
-	"SYS_RESET",
-	"AOWDT",
-	"MCCPLEXWDT",
-	"BPMPWDT",
-	"SCEWDT",
-	"SPEWDT",
-	"APEWDT",
-	"BCCPLEXWDT",
-	"SENSOR",
-	"AOTAG",
-	"VFSENSOR",
-	"SWREST",
-	"SC7",
-	"HSM",
-	"CORESIGHT"
-};
-
-static const char * const tegra186_reset_levels[] = {
-	"L0", "L1", "L2", "WARM"
-};
-
-static const char * const tegra30_reset_sources[] = {
-	"POWER_ON_RESET",
-	"WATCHDOG",
-	"SENSOR",
-	"SW_MAIN",
-	"LP0"
-};
-
-static const char * const tegra210_reset_sources[] = {
-	"POWER_ON_RESET",
-	"WATCHDOG",
-	"SENSOR",
-	"SW_MAIN",
-	"LP0",
-	"AOTAG"
-};
-
 /**
  * struct tegra_pmc - NVIDIA Tegra PMC
  * @dev: pointer to PMC device structure
@@ -2784,6 +2745,14 @@ static const u8 tegra30_cpu_powergates[] = {
 	TEGRA_POWERGATE_CPU3,
 };
 
+static const char * const tegra30_reset_sources[] = {
+	"POWER_ON_RESET",
+	"WATCHDOG",
+	"SENSOR",
+	"SW_MAIN",
+	"LP0"
+};
+
 static const struct tegra_pmc_soc tegra30_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra30_powergates),
 	.powergates = tegra30_powergates,
@@ -3061,6 +3030,15 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
 	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
 };
 
+static const char * const tegra210_reset_sources[] = {
+	"POWER_ON_RESET",
+	"WATCHDOG",
+	"SENSOR",
+	"SW_MAIN",
+	"LP0",
+	"AOTAG"
+};
+
 static const struct tegra_wake_event tegra210_wake_events[] = {
 	TEGRA_WAKE_IRQ("rtc", 16, 2),
 	TEGRA_WAKE_IRQ("pmu", 51, 86),
@@ -3193,6 +3171,28 @@ static void tegra186_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
 	iounmap(wake);
 }
 
+static const char * const tegra186_reset_sources[] = {
+	"SYS_RESET",
+	"AOWDT",
+	"MCCPLEXWDT",
+	"BPMPWDT",
+	"SCEWDT",
+	"SPEWDT",
+	"APEWDT",
+	"BCCPLEXWDT",
+	"SENSOR",
+	"AOTAG",
+	"VFSENSOR",
+	"SWREST",
+	"SC7",
+	"HSM",
+	"CORESIGHT"
+};
+
+static const char * const tegra186_reset_levels[] = {
+	"L0", "L1", "L2", "WARM"
+};
+
 static const struct tegra_wake_event tegra186_wake_events[] = {
 	TEGRA_WAKE_IRQ("pmu", 24, 209),
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA186_AON_GPIO(FF, 0)),
-- 
2.28.0

