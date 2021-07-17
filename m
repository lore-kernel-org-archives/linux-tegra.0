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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F940C636CA
	for <linux-tegra@archiver.kernel.org>; Sat, 17 Jul 2021 11:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13523613D4
	for <linux-tegra@archiver.kernel.org>; Sat, 17 Jul 2021 11:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbhGQLdf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 17 Jul 2021 07:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbhGQLdf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 17 Jul 2021 07:33:35 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FD5C06175F;
        Sat, 17 Jul 2021 04:30:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bn5so17424171ljb.10;
        Sat, 17 Jul 2021 04:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gujm9tCb3Srfie3BRwmOcbAhEwZV58rTnt52/CyJI8k=;
        b=U082m5MT/JGMZi9esWGhGI4GbucZmzQpZpZZ8xaZRZEvtBkbXp0C3o3peyYcEcv29d
         LyNEid9ZVXF8WFtm9f9c4dAFUm4BHbwHloPU8v+zNQkeH5scpj3JYshMH1qIDojFJUzZ
         k4sLCKN2W+W22Qo3xphw8TG/2IOG+PaVfcmAg4EDHC6+5QzzfUltgeCYODL/mvaR913F
         bbnEpEPWS6ufh4acB/2owdqR3j/yTYh5riHgGVeauYnvV+x1Tk4dHO+63GBhhorYaNtU
         BuNxNEej8Z0j07kADrJulc70MQANCaQed53n1h1+Xxl8J08FZW0WX7Y+cZTEQIXrmhVy
         Tw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gujm9tCb3Srfie3BRwmOcbAhEwZV58rTnt52/CyJI8k=;
        b=at+/1ZSZRUJBD76TZl2ZOZnoHWdWe45rGUmhXc8TJQhCQTxfQxBpv0Nrza0yzBx8WE
         eucOj36rEKVGMRzAWR3gYPD47leKGeP8g7PRJLd/HSbpeQnMpmzfeTlviUw9xHaUWQAS
         RJFRD2XNiV/9RTfETt5QDiK+rxCkbpCmYAl99YcnMolColGBupk6s6U8uotrMXcQeepK
         fvEajAG5Pxm2lfn12jPao0x+9I+WAE88NeFLVEU3yExoZBGFtEkj2HXtCmFznk8XZwXv
         8hZFz0JyngioS3P09oDQpCHKqYzopydEKaRo1QnZU06Bp3F9N7wl3S1cp4L30/4A9tov
         SD3A==
X-Gm-Message-State: AOAM530J12mLLu3zGCxqER1OhV2ElJq1yfShnT3bRJLak3at/tRXtq+k
        XmtUrR0o7rV/UtcZNdv1J74=
X-Google-Smtp-Source: ABdhPJypxDT26vovNWBWoo8r9FZx1mF3tO/ar2uWe2+ywLdyBBejJBL3e+l2Ey4tJVIwdjwWznytEg==
X-Received: by 2002:a05:651c:997:: with SMTP id b23mr11111696ljq.219.1626521437202;
        Sat, 17 Jul 2021 04:30:37 -0700 (PDT)
Received: from localhost.localdomain (46-138-17-250.dynamic.spd-mgts.ru. [46.138.17.250])
        by smtp.gmail.com with ESMTPSA id n21sm825640ljq.33.2021.07.17.04.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 04:30:36 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: tegra: Implement disable_unused() of tegra_clk_sdmmc_mux_ops
Date:   Sat, 17 Jul 2021 14:27:42 +0300
Message-Id: <20210717112742.7196-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Implement disable_unused() callback of tegra_clk_sdmmc_mux_ops to fix
imbalanced disabling of the unused MMC clock on Tegra210 Jetson Nano.

Fixes: c592c8a28f58 ("clk: tegra: Fix refcounting of gate clocks")
Reported-by: Jon Hunter <jonathanh@nvidia.com> # T210 Nano
Tested-by: Jon Hunter <jonathanh@nvidia.com> # T210 Nano
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-sdmmc-mux.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/tegra/clk-sdmmc-mux.c b/drivers/clk/tegra/clk-sdmmc-mux.c
index 316912d3b1a4..4f2c3309eea4 100644
--- a/drivers/clk/tegra/clk-sdmmc-mux.c
+++ b/drivers/clk/tegra/clk-sdmmc-mux.c
@@ -194,6 +194,15 @@ static void clk_sdmmc_mux_disable(struct clk_hw *hw)
 	gate_ops->disable(gate_hw);
 }
 
+static void clk_sdmmc_mux_disable_unused(struct clk_hw *hw)
+{
+	struct tegra_sdmmc_mux *sdmmc_mux = to_clk_sdmmc_mux(hw);
+	const struct clk_ops *gate_ops = sdmmc_mux->gate_ops;
+	struct clk_hw *gate_hw = &sdmmc_mux->gate.hw;
+
+	gate_ops->disable_unused(gate_hw);
+}
+
 static void clk_sdmmc_mux_restore_context(struct clk_hw *hw)
 {
 	struct clk_hw *parent = clk_hw_get_parent(hw);
@@ -218,6 +227,7 @@ static const struct clk_ops tegra_clk_sdmmc_mux_ops = {
 	.is_enabled = clk_sdmmc_mux_is_enabled,
 	.enable = clk_sdmmc_mux_enable,
 	.disable = clk_sdmmc_mux_disable,
+	.disable_unused = clk_sdmmc_mux_disable_unused,
 	.restore_context = clk_sdmmc_mux_restore_context,
 };
 
-- 
2.32.0

