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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4940AC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 21:05:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20E6C619D7
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 21:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbhCWVFP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 17:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbhCWVFD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 17:05:03 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8EBC061763;
        Tue, 23 Mar 2021 14:05:03 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id o126so19220048lfa.0;
        Tue, 23 Mar 2021 14:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SuNFKmObS8OGYSr9I3W9TT8GQ+yDQLYI1n29xyxJHPg=;
        b=hm4go1b2vBdyKDIgjVYuQfO/yQK6V6TcJ4j1SA8iab4Mf9gd6i6n6hDRkyzCOs02AR
         Lp5YlmH86llULKuGzdch7GKrLtxtztZqMfRnCzD8sWRiudGVL2J2U1fZd+jmTLkA6OXX
         h0qW+7nlyuuRU46vd1/vwY8in5c34gCR5As0VH3uVXGVOD3F0sh9iMatkWBiy6dRjN+b
         dFhvTr+64Luxe5iZ8W9HyhYq6qNrvAnYkzXSRtErz2Qess4Y4INPyeAGVvfjQqcaxLaz
         49TcAHBwlrJ082Glkim/xGGMq6+Nruz+swSfRux21SSbAzuBhxNCBrAC0KiOc5p1hwYx
         gE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SuNFKmObS8OGYSr9I3W9TT8GQ+yDQLYI1n29xyxJHPg=;
        b=tpXej3qi3GHUGDHEUTo8mlf72K4zyNRsEwhMbXfYhGQNXuFH6BTOTcO+nUEpPk4Ww1
         drgRd8YBrLcBWLS7ngT5oW7FNUNf8WVVywTOTLGJamnDjT3OO55Blt5KBq26qn1eYZ0O
         wyd22r1a/16K0pSrok7m84X9FYtYGC1gOFKdAIGdKPxhiHLmqXaQXi6991S5emqZTMPX
         URCnGTPdiCOkvCY3WmCGubfBhVWvJjDQgOWlebwGBcnfmc/slAAUUZdNRCrsYC/Ue2Qv
         3DIu+tUi2aO0Kif2uE+zU3+orglqWEynANR+zINha6x1D/z5YPHsdzoqCVrKb4eM9fm8
         kgaw==
X-Gm-Message-State: AOAM5329QREgtnS8KOWtIHBZeQALHQoyOQ5AcBIGIfjVvBZu6Mt0t43w
        RoSKkQxFFLF+MGYnVuTKyFM=
X-Google-Smtp-Source: ABdhPJwD2jw5Nv9ynl9NjHzlZnAdJ0Q+4YgCoMHRQzpKMHv3GjMsJKhqoZ8BQQRWusy1hCq+X2bj1w==
X-Received: by 2002:ac2:46f5:: with SMTP id q21mr3398827lfo.531.1616533501789;
        Tue, 23 Mar 2021 14:05:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.gmail.com with ESMTPSA id b28sm18394lfo.219.2021.03.23.14.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:05:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/2] memory: tegra20: Protect debug code with a lock
Date:   Wed, 24 Mar 2021 00:04:46 +0300
Message-Id: <20210323210446.24867-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323210446.24867-1-digetx@gmail.com>
References: <20210323210446.24867-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Simultaneous accesses to MC_STAT h/w shouldn't be allowed since one
collection process stomps on another. There is no good reason for
polling stats in parallel in practice, nevertheless let's add a
protection lock, just for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 4659c0cea30d..2db68a913b7a 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -55,6 +56,8 @@
 /* we store collected statistics as a fixed point values */
 #define MC_FX_FRAC_SCALE			100
 
+static DEFINE_MUTEX(tegra20_mc_stat_lock);
+
 struct tegra20_mc_stat_gather {
 	unsigned int pri_filter;
 	unsigned int pri_event;
@@ -615,8 +618,12 @@ static int tegra20_mc_stats_show(struct seq_file *s, void *unused)
 	if (!stats)
 		return -ENOMEM;
 
+	mutex_lock(&tegra20_mc_stat_lock);
+
 	tegra20_mc_collect_stats(mc, stats);
 
+	mutex_unlock(&tegra20_mc_stat_lock);
+
 	seq_puts(s, "Memory client   Events   Timeout   High priority   Bandwidth ARB   RW change   Successive   Page miss\n");
 	seq_puts(s, "-----------------------------------------------------------------------------------------------------\n");
 
-- 
2.30.2

