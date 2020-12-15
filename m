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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9E2C2BB9A
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 21:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84C5B22CBB
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 21:15:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgLOVNt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 16:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbgLOVMk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 16:12:40 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D05C0617A7;
        Tue, 15 Dec 2020 13:12:00 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id w13so43047947lfd.5;
        Tue, 15 Dec 2020 13:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Q6Vn8saAAikVz5O2LxD+jWLM8gzOOMBKDxS+IXvefQ=;
        b=flOpKj7iAZl69CEigPSEoAZ3jRS/ckbT7dZx6kEnSvWhA0fvQ0mb7wsKZ+UGB6E4FA
         vXhqIXAT4nAiz8v6QbYXmOALKY9zM8dIQPIA3moAxmXRXG/Vk5acwG89Qtvm9vmSHO9X
         u11SX3CDVVUrFazdQvl2tj3KC8J1xHyUAg9H2UYda2iLdujsjObOB1hcuZsbfB6KvWfZ
         Kw8IVBcPbDU1rRDK8HytjhpBnPAzmL6VaTXviMIuhdl25h7IOK6PJlhEV+bVmWZzuqd8
         Ls+CHFV2saKXeg1GV0Haz8iY+KyDJU7GIjVu63jYLWB54Wmewd2KmWO21MBassObJrSh
         vBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Q6Vn8saAAikVz5O2LxD+jWLM8gzOOMBKDxS+IXvefQ=;
        b=nEWynzBqMxIxXEOOjevOcHppEPpkSyaWfzBQzBz2/ELQnh0k2d2+DomwTe6ilzTf4+
         V/c15JkV4v1efenthliKQZ5m2oqbYGntpbzuHxOJHV6hCtx27n5261PUAvyPUhJ6JCGZ
         Bjbsj7U/0H/O7dr0UQ1R7k8S1VXNaApB4lGwcD8YWEM+HAjx/IqYZYEZZSTbYmTYKxr3
         90qXKm+350ODQE2By1EYaROHwMLKYAE+CMsK619wxeL9zYmqhOx+mQvxkE81tsEWxCgi
         renDt62BXF/KcmuO8WK9rbTfgpCn724t3jcSRGhliYan8D6f7QOQgtDl2PQO+hfEwy/i
         6sOg==
X-Gm-Message-State: AOAM532et9ylTHWKzAfssmKqX89y9MKgk91dOZC26rqjGeccN/a7745y
        Sdb0PA904j/oEYR6mWBGhYvJ0Yc+l8Y=
X-Google-Smtp-Source: ABdhPJyvzQZDdH+Ms57Pboog4xX5H/H/C5yiASaL6i1Q9HVbKfIz4uatYeTg2MlVn5dK8SYTEHoviQ==
X-Received: by 2002:a2e:9410:: with SMTP id i16mr9070752ljh.183.1608066718852;
        Tue, 15 Dec 2020 13:11:58 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id k11sm2572079lji.95.2020.12.15.13.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 13:11:58 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] clk: tegra: Fix refcounting of gate clocks
Date:   Wed, 16 Dec 2020 00:11:49 +0300
Message-Id: <20201215211150.21214-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215211150.21214-1-digetx@gmail.com>
References: <20201215211150.21214-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The refcounting of the gate clocks has a bug causing the enable_refcnt
to underflow when unused clocks are disabled. This happens because clk
provider erroneously bumps the refcount if clock is enabled at a boot
time, which it shouldn't be doing, and it does this only for the gate
clocks, while peripheral clocks are using the same gate ops and the
peripheral clocks are missing the initial bump. Hence the refcount of
the peripheral clocks is 0 when unused clocks are disabled and then the
counter is decremented further by the gate ops, causing the integer
underflow.

Fix this problem by removing the erroneous bump and by implementing the
disable_unused() callback, which disables the unused gates properly.

The visible effect of the bug is such that the unused clocks are never
gated if a loaded kernel module grabs the unused clocks and starts to use
them. In practice this shouldn't cause any real problems for the drivers
and boards supported by the kernel today.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-periph-gate.c | 72 +++++++++++++++++++----------
 drivers/clk/tegra/clk-periph.c      | 11 +++++
 2 files changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
index 4b31beefc9fc..3c4259fec82e 100644
--- a/drivers/clk/tegra/clk-periph-gate.c
+++ b/drivers/clk/tegra/clk-periph-gate.c
@@ -48,18 +48,9 @@ static int clk_periph_is_enabled(struct clk_hw *hw)
 	return state;
 }
 
-static int clk_periph_enable(struct clk_hw *hw)
+static void clk_periph_enable_locked(struct clk_hw *hw)
 {
 	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
-	unsigned long flags = 0;
-
-	spin_lock_irqsave(&periph_ref_lock, flags);
-
-	gate->enable_refcnt[gate->clk_num]++;
-	if (gate->enable_refcnt[gate->clk_num] > 1) {
-		spin_unlock_irqrestore(&periph_ref_lock, flags);
-		return 0;
-	}
 
 	write_enb_set(periph_clk_to_bit(gate), gate);
 	udelay(2);
@@ -78,6 +69,32 @@ static int clk_periph_enable(struct clk_hw *hw)
 		udelay(1);
 		writel_relaxed(0, gate->clk_base + LVL2_CLK_GATE_OVRE);
 	}
+}
+
+static void clk_periph_disable_locked(struct clk_hw *hw)
+{
+	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
+
+	/*
+	 * If peripheral is in the APB bus then read the APB bus to
+	 * flush the write operation in apb bus. This will avoid the
+	 * peripheral access after disabling clock
+	 */
+	if (gate->flags & TEGRA_PERIPH_ON_APB)
+		tegra_read_chipid();
+
+	write_enb_clr(periph_clk_to_bit(gate), gate);
+}
+
+static int clk_periph_enable(struct clk_hw *hw)
+{
+	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(&periph_ref_lock, flags);
+
+	if (!gate->enable_refcnt[gate->clk_num]++)
+		clk_periph_enable_locked(hw);
 
 	spin_unlock_irqrestore(&periph_ref_lock, flags);
 
@@ -91,21 +108,28 @@ static void clk_periph_disable(struct clk_hw *hw)
 
 	spin_lock_irqsave(&periph_ref_lock, flags);
 
-	gate->enable_refcnt[gate->clk_num]--;
-	if (gate->enable_refcnt[gate->clk_num] > 0) {
-		spin_unlock_irqrestore(&periph_ref_lock, flags);
-		return;
-	}
+	WARN_ON(!gate->enable_refcnt[gate->clk_num]);
+
+	if (gate->enable_refcnt[gate->clk_num]-- == 1)
+		clk_periph_disable_locked(hw);
+
+	spin_unlock_irqrestore(&periph_ref_lock, flags);
+}
+
+static void clk_periph_disable_unused(struct clk_hw *hw)
+{
+	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
+	unsigned long flags = 0;
+
+	spin_lock_irqsave(&periph_ref_lock, flags);
 
 	/*
-	 * If peripheral is in the APB bus then read the APB bus to
-	 * flush the write operation in apb bus. This will avoid the
-	 * peripheral access after disabling clock
+	 * Some clocks are duplicated and some of them are marked as critical,
+	 * like fuse and fuse_burn for example, thus the enable_refcnt will
+	 * be non-zero here id the "unused" duplicate is disabled by CCF.
 	 */
-	if (gate->flags & TEGRA_PERIPH_ON_APB)
-		tegra_read_chipid();
-
-	write_enb_clr(periph_clk_to_bit(gate), gate);
+	if (!gate->enable_refcnt[gate->clk_num])
+		clk_periph_disable_locked(hw);
 
 	spin_unlock_irqrestore(&periph_ref_lock, flags);
 }
@@ -114,6 +138,7 @@ const struct clk_ops tegra_clk_periph_gate_ops = {
 	.is_enabled = clk_periph_is_enabled,
 	.enable = clk_periph_enable,
 	.disable = clk_periph_disable,
+	.disable_unused = clk_periph_disable_unused,
 };
 
 struct clk *tegra_clk_register_periph_gate(const char *name,
@@ -148,9 +173,6 @@ struct clk *tegra_clk_register_periph_gate(const char *name,
 	gate->enable_refcnt = enable_refcnt;
 	gate->regs = pregs;
 
-	if (read_enb(gate) & periph_clk_to_bit(gate))
-		enable_refcnt[clk_num]++;
-
 	/* Data in .init is copied by clk_register(), so stack variable OK */
 	gate->hw.init = &init;
 
diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 67620c7ecd9e..79ca3aa072b7 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -100,6 +100,15 @@ static void clk_periph_disable(struct clk_hw *hw)
 	gate_ops->disable(gate_hw);
 }
 
+static void clk_periph_disable_unused(struct clk_hw *hw)
+{
+	struct tegra_clk_periph *periph = to_clk_periph(hw);
+	const struct clk_ops *gate_ops = periph->gate_ops;
+	struct clk_hw *gate_hw = &periph->gate.hw;
+
+	gate_ops->disable_unused(gate_hw);
+}
+
 static void clk_periph_restore_context(struct clk_hw *hw)
 {
 	struct tegra_clk_periph *periph = to_clk_periph(hw);
@@ -126,6 +135,7 @@ const struct clk_ops tegra_clk_periph_ops = {
 	.is_enabled = clk_periph_is_enabled,
 	.enable = clk_periph_enable,
 	.disable = clk_periph_disable,
+	.disable_unused = clk_periph_disable_unused,
 	.restore_context = clk_periph_restore_context,
 };
 
@@ -135,6 +145,7 @@ static const struct clk_ops tegra_clk_periph_nodiv_ops = {
 	.is_enabled = clk_periph_is_enabled,
 	.enable = clk_periph_enable,
 	.disable = clk_periph_disable,
+	.disable_unused = clk_periph_disable_unused,
 	.restore_context = clk_periph_restore_context,
 };
 
-- 
2.29.2

