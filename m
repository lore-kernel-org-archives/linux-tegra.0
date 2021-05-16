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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59FFC43460
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA557610A7
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhEPQOc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbhEPQOb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:14:31 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A18C061573;
        Sun, 16 May 2021 09:13:16 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i9so5184556lfe.13;
        Sun, 16 May 2021 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GyIAF+FPDoF3L0c8SxBikD76UBKYvvu1WBUmyZdYlws=;
        b=WBl2yEfMSQThCqNud/mIohapS0zMHwzANvKRlwxhUrkbOVGW5YhkZn+uCihYiFm2rJ
         Q9F/7FL8opvZJDZ8bfohX97xbQ+w+V7RQAVuM21RxydM8grAL5bObgHCtAcB4VsTG1Ya
         AqbYBen+9komB/N+U35TKzQcm4b17xT/K548Z2uYx/nCL5LxrR7LABlqcRPdFxvDhH1j
         xVO96NTObjV+Q1aXUqphMOivFkqYLGQl6+ndr91e4/3YdxHB5HzmGhBPeXuuUymjrKhN
         p3k6xZsXE4F8qbiM7Fn80r8SfXparAJaNUamLu9OkdRMfO8e2QovyDA3ETRDlNs3JSlu
         n0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GyIAF+FPDoF3L0c8SxBikD76UBKYvvu1WBUmyZdYlws=;
        b=WqPaOhVaig0XzdJyd0uh6HeS0vohANcM4wxWOrcZq0XffsIdxn5pVk6J6OYrbgVBKO
         08jKBeJTQ1woAwGEejhaLqMRa+TRz9V9HawvFAkxGS6tlCAP3AMYLZJZllyQQA3JIf90
         9bELbtNkqFzys5Eavs3gX1EcK83KNDzvUbYFuDf+XXafKRi2fw2nGXO4egqtaG8RzZGS
         Hmx7nPGFotnFYYrKjVOXZNGwefJ2UzFPAzqlxsx5WoPIdDHXyhudjRH3fBkWgUp16/rr
         bIYoO79rRgbG89C2JuxaDCM1584W9gfVxo+1dbzRlzGkBeFHVBtBxKWIeXqE8oO28Qrl
         /QUQ==
X-Gm-Message-State: AOAM532pGZhvwE8pITN8DwZLSFcGPQZCV0iWFqXurDGE6Us6ewgWugYn
        YQMAo1zzQV0OkqJ+06G5vgs=
X-Google-Smtp-Source: ABdhPJwNZvIRuJXVV92dkn68uJKSQZdFM89uDdMJbZQcTsZsoku91rDyIc2S07znIPuf27DyM6S5Hw==
X-Received: by 2002:a05:6512:10d4:: with SMTP id k20mr37567115lfg.210.1621181594881;
        Sun, 16 May 2021 09:13:14 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id d27sm1712547lfq.290.2021.05.16.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:13:14 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 2/4] clk: tegra: Add stubs needed for compile-testing
Date:   Sun, 16 May 2021 19:12:12 +0300
Message-Id: <20210516161214.4693-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516161214.4693-1-digetx@gmail.com>
References: <20210516161214.4693-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add stubs needed for compile-testing of Tegra memory drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/clk/tegra.h | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index f7ff722a03dd..d540b2879c26 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -144,17 +144,37 @@ typedef long (tegra20_clk_emc_round_cb)(unsigned long rate,
 					unsigned long min_rate,
 					unsigned long max_rate,
 					void *arg);
+typedef int (tegra124_emc_prepare_timing_change_cb)(struct tegra_emc *emc,
+						    unsigned long rate);
+typedef void (tegra124_emc_complete_timing_change_cb)(struct tegra_emc *emc,
+						      unsigned long rate);
 
+#ifdef CONFIG_ARCH_TEGRA
 void tegra20_clk_set_emc_round_callback(tegra20_clk_emc_round_cb *round_cb,
 					void *cb_arg);
 int tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same);
 
-typedef int (tegra124_emc_prepare_timing_change_cb)(struct tegra_emc *emc,
-						    unsigned long rate);
-typedef void (tegra124_emc_complete_timing_change_cb)(struct tegra_emc *emc,
-						      unsigned long rate);
 void tegra124_clk_set_emc_callbacks(tegra124_emc_prepare_timing_change_cb *prep_cb,
 				    tegra124_emc_complete_timing_change_cb *complete_cb);
+#else
+static inline void
+tegra20_clk_set_emc_round_callback(tegra20_clk_emc_round_cb *round_cb,
+				   void *cb_arg)
+{
+}
+
+static inline int
+tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same)
+{
+	return 0;
+}
+
+static inline void
+tegra124_clk_set_emc_callbacks(tegra124_emc_prepare_timing_change_cb *prep_cb,
+			       tegra124_emc_complete_timing_change_cb *complete_cb)
+{
+}
+#endif
 
 struct tegra210_clk_emc_config {
 	unsigned long rate;
-- 
2.30.2

