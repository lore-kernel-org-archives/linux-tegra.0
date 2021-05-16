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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5369C4361A
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89D3361177
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbhEPQcW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbhEPQcU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:32:20 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF765C061756;
        Sun, 16 May 2021 09:31:04 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w4so4321741ljw.9;
        Sun, 16 May 2021 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1RqC6a+NZMuHcUfGq6LxuBL+QnW+oPmIqETkbY0cfZw=;
        b=eJgFxWANPyZ28kO3ZDxEInp4DxExvrjr9xbbEv2SB481W0ndSezPksTmbZCs2B41I9
         nUDbM6DBEsnerQS758pONq0HEH9pmzRFFh92o+Z3CbUY4RZI1+b+LTUgXEDZgvxk323C
         CSYKP33I2PMOf1/yM7tFbGuj9qQkFO0qcwngTPZkpOnYYox3530Rxvcp85LoQ8p6jTS+
         S/73bvdnqZyr+4hiPvc5LzC6xvhvYJXGxm+8DG/lHdhme6UZuWen2TAiom54NC7EoRe6
         3sylaIvuijxz/KrVeR7lhK7Xbrhf72KiTXX65VtSTSdvgMBzEWeo5dYwuNJiNI8DUn1/
         4nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1RqC6a+NZMuHcUfGq6LxuBL+QnW+oPmIqETkbY0cfZw=;
        b=UDogRy5Z06+FquNyh1sUSEcz2H4DL6i8ax4GqcSYS/TjpKF/aCSv9VBE+xWeYG07PL
         RrBJw+xM+LPX0FvBevQXtWAIIwRvinEDvWWWfKLpBA30G6JIsH6QsbitJWbjOph5cf7h
         hMwCvyVR4YR41Eze4ymJP0x/OVFUV1SGtx9zvz3XDgjojoznh+0hA1eaBOIsKjNI+DfU
         nGiRVJwgD8omUjDAEa84oSGZsS0hpzLcb/Ix53X0uzyRQtdlqww3vOmI0a9R0S/bpVmm
         lvpyapzno9NqZ632b6Wxp5LhzMQiIZi+Rc2mcB2KCV/wgAALNB9F/UGBMisyIjukjFQ7
         /IFg==
X-Gm-Message-State: AOAM5327IkSwpTyVKteXK1HVJRTdMTT2SF7LNX+ZKwVb40D18kVWrSAD
        uQo5PT61T2vVirhoXRhvuFY=
X-Google-Smtp-Source: ABdhPJzlmUMG4qGBtOldAsBml+5bry1JrKAKGxYoPq3S53eQEGzqeDwi2Xty3FISDVu5oNZjgYdMPA==
X-Received: by 2002:a2e:b5b0:: with SMTP id f16mr46031988ljn.52.1621182663383;
        Sun, 16 May 2021 09:31:03 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id m2sm1704548lfo.23.2021.05.16.09.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:31:03 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v8 6/9] clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
Date:   Sun, 16 May 2021 19:30:38 +0300
Message-Id: <20210516163041.12818-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516163041.12818-1-digetx@gmail.com>
References: <20210516163041.12818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Check whether thermal DIV2 throttle is active in order to report
the CPU frequency properly. This very useful for userspace tools
like cpufreq-info which show actual frequency asserted from hardware.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra-super-cclk.c | 16 ++++++++++++++--
 drivers/clk/tegra/clk-tegra30.c          |  2 +-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra/clk-tegra-super-cclk.c
index a03119c30456..68d7bcd5fc8a 100644
--- a/drivers/clk/tegra/clk-tegra-super-cclk.c
+++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
@@ -25,6 +25,8 @@
 
 #define SUPER_CDIV_ENB		BIT(31)
 
+#define TSENSOR_SLOWDOWN	BIT(23)
+
 static struct tegra_clk_super_mux *cclk_super;
 static bool cclk_on_pllx;
 
@@ -47,10 +49,20 @@ static int cclk_super_set_rate(struct clk_hw *hw, unsigned long rate,
 static unsigned long cclk_super_recalc_rate(struct clk_hw *hw,
 					    unsigned long parent_rate)
 {
+	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
+	u32 val = readl_relaxed(super->reg);
+	unsigned int div2;
+
+	/* check whether thermal throttling is active */
+	if (val & TSENSOR_SLOWDOWN)
+		div2 = 1;
+	else
+		div2 = 0;
+
 	if (cclk_super_get_parent(hw) == PLLX_INDEX)
-		return parent_rate;
+		return parent_rate >> div2;
 
-	return tegra_clk_super_ops.recalc_rate(hw, parent_rate);
+	return tegra_clk_super_ops.recalc_rate(hw, parent_rate) >> div2;
 }
 
 static int cclk_super_determine_rate(struct clk_hw *hw,
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index a33688b2359e..5b6bd138be84 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -930,7 +930,7 @@ static void __init tegra30_super_clk_init(void)
 	/* CCLKG */
 	clk = tegra_clk_register_super_cclk("cclk_g", cclk_g_parents,
 				  ARRAY_SIZE(cclk_g_parents),
-				  CLK_SET_RATE_PARENT,
+				  CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
 				  clk_base + CCLKG_BURST_POLICY,
 				  0, NULL);
 	clks[TEGRA30_CLK_CCLK_G] = clk;
-- 
2.30.2

