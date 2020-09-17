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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6C0C43461
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75DF62087D
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 10:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnoEaymz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgIQKId (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgIQKIc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 06:08:32 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BC6C06174A
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:31 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e17so1394771wme.0
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 03:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4vsTqHDRezfzd8SF1y8hAmLtXdBEdab2904l3pZe9lw=;
        b=bnoEaymzFihtmsp+uKBU0Z3FhsHQEoFMUiV6DwaJB9YZu1BYNv8Og77NXMY2w/gd1L
         zbkYagF+6Cc7ZFz4IrOv7uH6joZO5fECK7zx4NCssjbaREmYfa3jTCIK8hgsOCdZzFHa
         KdgJjzrRvOMhaiFm6qNXp0EZ0TRmZtNDHNT+u5P53SoGV5lUZPv8rNw6P643BCK6Xqah
         xZuQE6s0ct+Eh0tKIotdgdKgV4t+GPZUCh8oLsloN7yVAoL5mFUh6Dq8zqtbEN4f4nzt
         mGiNPqGoTQ8A/TjPlTi1AwwDBZxScZwl/r+ourU/MVUvIeXX5iSfItTR31u4Lfgurbtn
         omcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vsTqHDRezfzd8SF1y8hAmLtXdBEdab2904l3pZe9lw=;
        b=GoXKloF7zpRsMBHXeQA/fGlce42+sjZwK51Lv6b/IM0dZZIv65dCXOpJ/Ht+LC5JpQ
         S3w5o2VAbUPgDOPkPXFly+uqepfJDHVMnNtKiCCn5au7fjb1bUq090MD66tPIhMBYsK1
         8RgQg80SW7ZBSgoFtQk0jevP6qF9U9gAw3+ieCvrLHPCa4kyxfXGzJBIu++nbEpLfePO
         a8WkilAjsHInwY/SbxJEZZkqAuyWiPCw6gCDjbGCf0QRnbu4+7HNzzASClDQYDAoecam
         wb2JhWIWabazJpgcIqOuoT8kEkQ0DbramVcXHMnZAm5QGPDjS+C/k7HT2GAHnhChqA3G
         qKmA==
X-Gm-Message-State: AOAM533PEjOAMony32BDP4kDEd7qCodHSiQfaZhCeaCNewg5eWW1KKLQ
        mj6XMjjbRr3fU4OX8lT/BP4=
X-Google-Smtp-Source: ABdhPJyYJyqb8oOcqVpklD5SRqFrZG/iWKXym1Vl1fBtJG2U2u9AqM9X/ta3TiKssGcK34kTIB24SQ==
X-Received: by 2002:a1c:6487:: with SMTP id y129mr9673845wmb.90.1600337310097;
        Thu, 17 Sep 2020 03:08:30 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id t22sm12342777wmt.1.2020.09.17.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:08:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 12/14] soc/tegra: pmc: Add Tegra234 support
Date:   Thu, 17 Sep 2020 12:07:50 +0200
Message-Id: <20200917100752.3516153-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917100752.3516153-1-thierry.reding@gmail.com>
References: <20200917100752.3516153-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The PMC block is largely similar to that found on earlier chips, but
not completely compatible. Allow binding to the instantiation found on
Tegra234.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 67 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 4071181a4a42..622496df6282 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3362,6 +3362,73 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.has_blink_output = false,
 };
 
+static const struct tegra_pmc_regs tegra234_pmc_regs = {
+	.scratch0 = 0x2000,
+	.dpd_req = 0,
+	.dpd_status = 0,
+	.dpd2_req = 0,
+	.dpd2_status = 0,
+	.rst_status = 0x70,
+	.rst_source_shift = 0x2,
+	.rst_source_mask = 0xfc,
+	.rst_level_shift = 0x0,
+	.rst_level_mask = 0x3,
+};
+
+static const char * const tegra234_reset_sources[] = {
+	"SYS_RESET_N",
+	"AOWDT",
+	"BCCPLEXWDT",
+	"BPMPWDT",
+	"SCEWDT",
+	"SPEWDT",
+	"APEWDT",
+	"LCCPLEXWDT",
+	"SENSOR",
+	"AOTAG",
+	"VFSENSOR",
+	"MAINSWRST",
+	"SC7",
+	"HSM",
+	"CSITE",
+	"RCEWDT",
+	"PVA0WDT",
+	"PVA1WDT",
+	"L1A_ASYNC",
+	"BPMPBOOT",
+	"FUSECRC",
+};
+
+static const struct tegra_pmc_soc tegra234_pmc_soc = {
+	.num_powergates = 0,
+	.powergates = NULL,
+	.num_cpu_powergates = 0,
+	.cpu_powergates = NULL,
+	.has_tsense_reset = false,
+	.has_gpu_clamps = false,
+	.needs_mbist_war = false,
+	.has_impl_33v_pwr = true,
+	.maybe_tz_only = false,
+	.num_io_pads = 0,
+	.io_pads = NULL,
+	.num_pin_descs = 0,
+	.pin_descs = NULL,
+	.regs = &tegra234_pmc_regs,
+	.init = NULL,
+	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.irq_set_wake = tegra186_pmc_irq_set_wake,
+	.irq_set_type = tegra186_pmc_irq_set_type,
+	.reset_sources = tegra194_reset_sources,
+	.num_reset_sources = ARRAY_SIZE(tegra194_reset_sources),
+	.reset_levels = tegra186_reset_levels,
+	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
+	.num_wake_events = 0,
+	.wake_events = NULL,
+	.pmc_clks_data = NULL,
+	.num_pmc_clks = 0,
+	.has_blink_output = false,
+};
+
 static const struct of_device_id tegra_pmc_match[] = {
 	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra194_pmc_soc },
 	{ .compatible = "nvidia,tegra186-pmc", .data = &tegra186_pmc_soc },
-- 
2.28.0

