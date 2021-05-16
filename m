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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3432BC43600
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FDA061074
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbhEPQcX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbhEPQcW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:32:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB08C06175F;
        Sun, 16 May 2021 09:31:06 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z13so5298308lft.1;
        Sun, 16 May 2021 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kLux2CA/2iQlCgHQcfT6NQ1bYSYGcuxH7VsnDlgrBi8=;
        b=O/TY4LJFEJMHQ4gdaApt/1z2WeY3uq3DtseBorLciHD7H7ZHgs5D8DltZFIOkQpEmH
         MDGTAK+BSO0K8V8okqN4j5tqhQhhGKbxOVLG/jEyez4f5IrSI7P+dnLmN8fCPFG9nxg/
         WHE3pi5h03xzJLR3j9UyVBrANupWG0leIdwBqEKPX13booxgsSxBXephnQN7AKGMxUzw
         OiTf0x9XWDGcIRXcORPE3NNuGH1EamNo01A4b7dY8sZwT0WQNfIXFCkS7cisNzMc0SBV
         2o+PHnXykBi7B6QvHedcvAi45gZC6jr2rgqIPAVP9w2foIKFKO0LRLWup6FHnG9VBM03
         cSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kLux2CA/2iQlCgHQcfT6NQ1bYSYGcuxH7VsnDlgrBi8=;
        b=c+eMEUaFYZRKxhNrk3LXofo5orPP0fOt7MdmNqt69faiN64plRtmST75rjE3gxQ5qt
         j+o9AuGUWfhZ1v487C9mzuod+2ubU+z7WrTa8lJTG8KSXuhiLeIaaIRgt6+WjATgtJa9
         1DFJyDKLJJSzywPKMP/kC0NCUEDElMpkZH0s7AB6GsqFIiXqADF/fWmjXzRmp8KMnA1K
         vKvjsJ1j9CC7kjWU9k66W6dlD+ihJgpmVEk/FMsdUCTMIuXZpXHuXBpjCd+CnBx23/8U
         W1zLb5PUtSFJsZdJPhULw2U0w4sO5mF0DJtKrrhxz93VvjiqTeBiUIcMA9TT2ZLwX7q3
         5hzA==
X-Gm-Message-State: AOAM532RBlDJl/abtdWdyI3lx7zTCIsmb4IlU2WCArvQ13aKZd55cyUn
        lfJpJQ17UZ7PY2odX2uNPjc=
X-Google-Smtp-Source: ABdhPJwkQhjnLhUW9pglxLXb+1KSoLhRcQkXbV5W4zlG4VTk22n7EomwtxOHgBNccPKis64CECmf3g==
X-Received: by 2002:ac2:57c1:: with SMTP id k1mr39924223lfo.453.1621182664653;
        Sun, 16 May 2021 09:31:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id m2sm1704548lfo.23.2021.05.16.09.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:31:04 -0700 (PDT)
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
Subject: [PATCH v8 8/9] clk: tegra: Don't deassert reset on enabling clocks
Date:   Sun, 16 May 2021 19:30:40 +0300
Message-Id: <20210516163041.12818-9-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516163041.12818-1-digetx@gmail.com>
References: <20210516163041.12818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra clock driver contains legacy code which deasserts hardware reset
when peripheral clocks are enabled. This behaviour comes from a pre-CCF
era of the Tegra drivers. This is unacceptable for modern kernel drivers
which use generic CCF and reset-control APIs because it breaks assumptions
of the drivers about clk/reset sequences and about reset-propagation
delays. Hence remove the awkward legacy behaviour from the clk driver.

In particular PMC driver assumes that hardware blocks remains in reset
while power domain is turning on, but the clk driver deasserts the reset
before power clamp is removed, hence breaking the driver's assumption.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-periph-gate.c | 8 --------
 drivers/clk/tegra/clk-tegra30.c     | 2 +-
 drivers/clk/tegra/clk.h             | 4 ----
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
index dc3f92678407..2091fc9b0ca9 100644
--- a/drivers/clk/tegra/clk-periph-gate.c
+++ b/drivers/clk/tegra/clk-periph-gate.c
@@ -55,14 +55,6 @@ static void clk_periph_enable_locked(struct clk_hw *hw)
 	write_enb_set(periph_clk_to_bit(gate), gate);
 	udelay(2);
 
-	if (!(gate->flags & TEGRA_PERIPH_NO_RESET) &&
-	    !(gate->flags & TEGRA_PERIPH_MANUAL_RESET)) {
-		if (read_rst(gate) & periph_clk_to_bit(gate)) {
-			udelay(5); /* reset propogation delay */
-			write_rst_clr(periph_clk_to_bit(gate), gate);
-		}
-	}
-
 	if (gate->flags & TEGRA_PERIPH_WAR_1005168) {
 		writel_relaxed(0, gate->clk_base + LVL2_CLK_GATE_OVRE);
 		writel_relaxed(BIT(22), gate->clk_base + LVL2_CLK_GATE_OVRE);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 5b6bd138be84..64121bc66d85 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1006,7 +1006,7 @@ static struct tegra_periph_init_data tegra_periph_clk_list[] = {
 	TEGRA_INIT_DATA_MUX("dam0", mux_pllacp_clkm, CLK_SOURCE_DAM0, 108, 0, TEGRA30_CLK_DAM0),
 	TEGRA_INIT_DATA_MUX("dam1", mux_pllacp_clkm, CLK_SOURCE_DAM1, 109, 0, TEGRA30_CLK_DAM1),
 	TEGRA_INIT_DATA_MUX("dam2", mux_pllacp_clkm, CLK_SOURCE_DAM2, 110, 0, TEGRA30_CLK_DAM2),
-	TEGRA_INIT_DATA_INT("3d2", mux_pllmcpa, CLK_SOURCE_3D2, 98, TEGRA_PERIPH_MANUAL_RESET, TEGRA30_CLK_GR3D2),
+	TEGRA_INIT_DATA_INT("3d2", mux_pllmcpa, CLK_SOURCE_3D2, 98, 0, TEGRA30_CLK_GR3D2),
 	TEGRA_INIT_DATA_INT("se", mux_pllpcm_clkm, CLK_SOURCE_SE, 127, 0, TEGRA30_CLK_SE),
 	TEGRA_INIT_DATA_MUX8("hdmi", mux_pllpmdacd2_clkm, CLK_SOURCE_HDMI, 51, 0, TEGRA30_CLK_HDMI),
 	TEGRA_INIT_DATA("pwm", NULL, NULL, pwm_parents, CLK_SOURCE_PWM, 28, 2, 0, 0, 8, 1, 0, 17, TEGRA_PERIPH_ON_APB, TEGRA30_CLK_PWM),
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index c3e36b5dcc75..0c3ba0ccce1a 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -553,9 +553,6 @@ struct tegra_clk_periph_regs {
  * Flags:
  * TEGRA_PERIPH_NO_RESET - This flag indicates that reset is not allowed
  *     for this module.
- * TEGRA_PERIPH_MANUAL_RESET - This flag indicates not to reset module
- *     after clock enable and driver for the module is responsible for
- *     doing reset.
  * TEGRA_PERIPH_ON_APB - If peripheral is in the APB bus then read the
  *     bus to flush the write operation in apb bus. This flag indicates
  *     that this peripheral is in apb bus.
@@ -577,7 +574,6 @@ struct tegra_clk_periph_gate {
 #define TEGRA_CLK_PERIPH_GATE_MAGIC 0x17760309
 
 #define TEGRA_PERIPH_NO_RESET BIT(0)
-#define TEGRA_PERIPH_MANUAL_RESET BIT(1)
 #define TEGRA_PERIPH_ON_APB BIT(2)
 #define TEGRA_PERIPH_WAR_1005168 BIT(3)
 #define TEGRA_PERIPH_NO_DIV BIT(4)
-- 
2.30.2

