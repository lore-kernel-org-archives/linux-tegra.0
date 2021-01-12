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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F56EC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 284D523109
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732921AbhALM2s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 07:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732181AbhALM2q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 07:28:46 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8097CC061795;
        Tue, 12 Jan 2021 04:28:05 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id o10so3027119lfl.13;
        Tue, 12 Jan 2021 04:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Q6Vn8saAAikVz5O2LxD+jWLM8gzOOMBKDxS+IXvefQ=;
        b=dJaQ2/7lsePzv6oGkEe+5FTFOGX/rhta1mVpzwzbdEjQE6RMs2aOrnTwUXqkJvJ0h1
         icDmEnyI2N1Mh/ggw59PJmuiEKEJ3tanHOmTxfO7UIdPcRjClIzWB49ppNzdpGytqEi9
         RWXnhBHbj1G1fDUvxdaHubcrTipBUfWhe/LfSUkQEWdn55x3WDiHOCMHdV+Ae+lA03MU
         SizZ64W8XWZc3O7/eyHpeyZqc5kLLVk4JQZdMWDMRiOVIuJbgi+6kCw9kLTs6f2rAhoq
         XIOHW/JBgA/2gznZrswqU/f/PtYUcDo4Y3gDSeCRFbL16pnJnhlveNU9+SaU/SsjMYpC
         dSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Q6Vn8saAAikVz5O2LxD+jWLM8gzOOMBKDxS+IXvefQ=;
        b=Mu42hgBYY/RLe2j209GfQ4zx/Z5CyWirYXBfVTQwCdNGTIA6qgR4rGWW+b+YeHOZt8
         t782B4grTbGzbDZS9Gt2KHu5OQrYYX6unv6BpRjUC6G/fAnEN1iVbgwTAM9LhC4H6i+w
         /dOZcbV/lgFS9QhKrEtmcRJ7xbmI26P062EM0qP4qe+oXrxQ0YV36ZXSooEP4uMZnG1m
         Zn2ULAjuWtW/3ezD2dfDaBMzPCo0Ah4ycLrRnWgMMICdiCgwqLqScORbTfDl7aTHmKP0
         xgPYdvZYVdk6geukXSHKoZeVDvbJS8i9fq/9BNXIMAlUiUl9qMoQCW6k5Wwy4SdNrhp6
         C2gw==
X-Gm-Message-State: AOAM530U14olzIKfWQ14jqf1g+yTXfy6TPkkPQOJ7AeRTiY5Be3sJGsb
        dx+qBN0ABTDzbWQGrdx3Ym8=
X-Google-Smtp-Source: ABdhPJwV0lNdGMT0PqrYy8xuYAjW6rWF6zKUZSONkV7eOdUgVnNlySPHD3T9Q/ildTSqmlmhXcGsvw==
X-Received: by 2002:a19:84d1:: with SMTP id g200mr2140294lfd.659.1610454484042;
        Tue, 12 Jan 2021 04:28:04 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c3sm330136ljk.88.2021.01.12.04.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:28:03 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] clk: tegra: Fix refcounting of gate clocks
Date:   Tue, 12 Jan 2021 15:27:21 +0300
Message-Id: <20210112122724.1712-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112122724.1712-1-digetx@gmail.com>
References: <20210112122724.1712-1-digetx@gmail.com>
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

