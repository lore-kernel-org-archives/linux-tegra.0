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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E29C43460
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA85D61183
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbhEPQOe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhEPQOc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:14:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF17C061756;
        Sun, 16 May 2021 09:13:17 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z13so5261892lft.1;
        Sun, 16 May 2021 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=arMp6iylUXfCkaypqM2uUoN0YfCC20Vaz0VcFoz6bXY=;
        b=SHrbMKdPyvXK0OjSe19GaNOS2lQG77+8iH7FNyi0gKJH59VpJycEAFMfscZEI7O5ws
         TKswitB4czT/xWxCh/264YL1/LS+8Ox+7xECa9j75p5OxkM25noEXSBrdT3HJOGWJL4K
         O6qQVJE9/jsSi/b2ZBeXe0P10tDLRv+uTgo4Ef63u2HeHjvz7gvXTxuCoZux2UaD4t9L
         WoICnKcd+I1O4WlryNb3XAWbHgsnth3Ly7mJg7VNA1l5KECufJF/loXk52efrxQS7vWj
         VXYYWcYIxnxVddJxf0dWUpUq7eLnqheycb6ZHaB7gaRN915/A01gsDSADIDoEjbG4GGz
         pdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=arMp6iylUXfCkaypqM2uUoN0YfCC20Vaz0VcFoz6bXY=;
        b=gREm9PlFZbMQ98Pv8wS4Zd4/OyoKcTNS01CejJ2XoYYdAnM2oHFJ49wNdpNSV7YmpU
         OyTU4jWWA5KBBKUCRw+u0Y1CMxATEGm+n4Wyx1np0MIB7+eZaenor0CiiQPGVM0RhyXd
         gBZiPYbKdu+NpJWEbTkxiW9Z/gTSvi9cGNi5RvxcA7azZEkNsdbKpyKCRhWB7emzGjwO
         BrV/rIssfWyVvszxTyDzk+i1GgThsbVno4JxQqs39rLOZzTGG1/hTTxpEC1HNORx3Gj3
         F/SMDS8s+8cVufEapWdEVP9CnIuuc3ZMioVbBX9TNS1MacZ8t9rqOYraYBpU558oBQko
         LYkg==
X-Gm-Message-State: AOAM5325KGhvz8AUh92q/JQlQxnTvXqDN6K4b8737HsGU1bswiA4Zg3l
        CpUTYT6vzgFwL6EfCyGsLxo=
X-Google-Smtp-Source: ABdhPJw1Q1jPuctHnpKZ5C/1G8kVUXkdbVRjBBINblvw53aLdIkK7K2yH1HM9OykO2/ayMUYYXcaTg==
X-Received: by 2002:a19:e219:: with SMTP id z25mr6031191lfg.86.1621181595598;
        Sun, 16 May 2021 09:13:15 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id d27sm1712547lfq.290.2021.05.16.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:13:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 3/4] memory: tegra124-emc: Fix compilation warnings on 64bit platforms
Date:   Sun, 16 May 2021 19:12:13 +0300
Message-Id: <20210516161214.4693-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516161214.4693-1-digetx@gmail.com>
References: <20210516161214.4693-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix compilation warning on 64bit platforms caused by implicit promotion
of 32bit signed integer to a 64bit unsigned value which happens after
enabling compile-testing of the driver.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 5699d909abc2..c9eb948cf4df 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -272,8 +272,8 @@
 #define EMC_PUTERM_ADJ				0x574
 
 #define DRAM_DEV_SEL_ALL			0
-#define DRAM_DEV_SEL_0				(2 << 30)
-#define DRAM_DEV_SEL_1				(1 << 30)
+#define DRAM_DEV_SEL_0				(2u << 30)
+#define DRAM_DEV_SEL_1				(1u << 30)
 
 #define EMC_CFG_POWER_FEATURES_MASK		\
 	(EMC_CFG_DYN_SREF | EMC_CFG_DRAM_ACPD | EMC_CFG_DRAM_CLKSTOP_SR | \
-- 
2.30.2

