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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4649C43470
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9471661601
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhEJXS4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 19:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhEJXSy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 19:18:54 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDD5C061574;
        Mon, 10 May 2021 16:17:48 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id c15so8312352ljr.7;
        Mon, 10 May 2021 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SNSJ4ltRZBGOKyLdYr1aZnAojr1HJgzV+2zSgbmIE8g=;
        b=hjwAZoA1vig0NnQOePkP2AsXPLSPZVjVqRyVtDOLbRXXuUr4lm0CeVNK5aQhEuqJK3
         wl6A2eDYiH0BiIQLVfrZqwGhcM4I4c9lYHnkk2bfSNhI1XcUBJbaplaRkpPU68VPF5FZ
         lXJ7PdqSw5D5cou9rIPwIoncCaZ+5ypxwtTxuHoTjKY4p1SMKv+miLXxr2CZ55ibZxX2
         CtbpOAFWlyBj4ajKWBlFSyRmkNOINCtX5hSvmVhDQ/H/mNH3KNfTx5A0Ml5IP7RC79Xm
         0+iNTL/93bi7bPGbRNcY477kC6sc2qHFqPUC4Usx/nTN1B8RwKZpwKWoAI6D4MqW6abk
         PZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SNSJ4ltRZBGOKyLdYr1aZnAojr1HJgzV+2zSgbmIE8g=;
        b=n+an6StTlkKmizAhWXdFDVYWZQzZYsAu1CDzR97mvegi2Tawh+hlp6XQyhGbPkSuco
         alquNYzcDTUyLYw+ELRQCX+ag0dpCZCKl+gozYmJocC/OTa3XLsyjJnk+SAjxdPIxDnk
         tj2BPXclCpB/m8sJFi+WIXO+SKYYCt6WNZYV237d0aFsYK+XakLMSF7EN9wJNeqEy5vJ
         ny9KoTIr00ozhAjYVThLgPPyPj+qUhNwQzZpkZgi9a+6V24y9/bJoCy52kdcNcMFnHdp
         M5iFeRN5Cxt55fgKsEd23aXoszMBlHqaPqnW9tFC5fnZFzHoCyxv/G+xuVHmTlZvDwvk
         9dTw==
X-Gm-Message-State: AOAM532isYYkhZHUogs2TrxX8h8bUanMC9UEIESkwTIuC/IFM2iiiSLu
        eyxvtN2c9Yu96ibS6PCvms4=
X-Google-Smtp-Source: ABdhPJwPrpAuvtEI1bm7uqSmnY9Xn6Sc71p94sltgBiC1Cp3xiZstoeWAJ6ZpDOf6DqgiTcllpOzqA==
X-Received: by 2002:a2e:92c6:: with SMTP id k6mr22715352ljh.94.1620688667407;
        Mon, 10 May 2021 16:17:47 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id k8sm2422254lfo.123.2021.05.10.16.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 16:17:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 6/8] clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
Date:   Tue, 11 May 2021 02:17:35 +0300
Message-Id: <20210510231737.30313-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510231737.30313-1-digetx@gmail.com>
References: <20210510231737.30313-1-digetx@gmail.com>
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
index a03119c30456..f75822b71d0e 100644
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
+		div2 = 2;
+	else
+		div2 = 1;
+
 	if (cclk_super_get_parent(hw) == PLLX_INDEX)
-		return parent_rate;
+		return parent_rate / div2;
 
-	return tegra_clk_super_ops.recalc_rate(hw, parent_rate);
+	return tegra_clk_super_ops.recalc_rate(hw, parent_rate) / div2;
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

