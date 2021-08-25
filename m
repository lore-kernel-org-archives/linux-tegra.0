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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCC2C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 06:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CADA613AB
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Aug 2021 06:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238375AbhHYGif (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Aug 2021 02:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238342AbhHYGif (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Aug 2021 02:38:35 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A77C061757;
        Tue, 24 Aug 2021 23:37:49 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c10so23426631qko.11;
        Tue, 24 Aug 2021 23:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ti3ow6XOAA0EcZ2VnjUhaEC17DERoyJVWJqCxnbtLyA=;
        b=X7DlbPvwM5grdI6wcAvVj2zDdi6T64bIfwyYifhPAsNdIbqrvtj4KEnhuDP1tzk40v
         b648efOQfS9S0ketINqnjTmrfUkkdvEW/WfeiuHszgq0EYftdUtbq0speyk9vqgJHx4X
         qsqXrmLMWA1K6W8N+4RvkxhSJrkvsaBNu7sS/NU9SAVXlFtXJjHd5H6iVxTMUEyQCM6F
         cyVVkRE8ikDSw4ydiU7nAyW641m12o6biN6CMgaidiY58sqD681K5KuGbplkQ03ANy3F
         drGnNWAcIBeZTOeXevq5blZ6WKbaJBmsjI1grUnQLUvP+g8Kw7O1weLLXa1IOk+jVOZR
         4s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ti3ow6XOAA0EcZ2VnjUhaEC17DERoyJVWJqCxnbtLyA=;
        b=rQmayixJWavwbBS7MF+OjOAAW1SXgEJQ5sSbvZskCKL74sUKkulpmcrIiVDtOTwHHl
         sIf7g7NhNj133Wn+bKHFOT4M1rCCivqX17sLCCCcdSLF7xkiUbTSmLE7UykH2Dy/RjPG
         s2wJVz7+5yiXtm7noWXWa8SimRa4IJ/uHgErFa/fs2J6KP9mOQdihHBggam4rhTI/iPs
         Ni1FquuOkmFHNGbPVCgYjAAjEYVRup97q1MbaOz5rt7eyg8F8CHLJlS0ayShkw1pqNrR
         XgZ/KoYgZ0U3Rg/TKM4BNkf+uzx44bBCh/cj1wBAcfnCXs5H2Mski7vlSdMxjvWr86P1
         C97g==
X-Gm-Message-State: AOAM532Me7uMPc0Z2zMDn4tNM6bp/E+wYA01ffWlb+2n/UNsx/jYn61S
        TJjh6RaNOJgYaZT3NwC2gQ0=
X-Google-Smtp-Source: ABdhPJy3aeYc0Sx50Sp/d1V34TbrQqBhV7JUYqWBjq3GBmjHcR909H0/YPmsqiTWRMsVkZiIfXr8iw==
X-Received: by 2002:a05:620a:1495:: with SMTP id w21mr30134830qkj.443.1629873469175;
        Tue, 24 Aug 2021 23:37:49 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id s69sm12566556qka.102.2021.08.24.23.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 23:37:48 -0700 (PDT)
From:   CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Jing Yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] memory:tegra210-emc-core: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Tue, 24 Aug 2021 23:37:39 -0700
Message-Id: <20210825063739.70260-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Fix the following coccicheck warning:
./drivers/memory/tegra/tegra210-emc-core.c:1665:0-23:WARNING
tegra210_emc_debug_min_rate_fops should be defined
 with DEFINE_DEBUGFS_ATTRIBUTE
./drivers/memory/tegra/tegra210-emc-core.c:1726:0-23:WARNING
tegra210_emc_debug_temperature_fops should be defined
 with DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 drivers/memory/tegra/tegra210-emc-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index 06c0f17..3b8284c 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1692,7 +1692,7 @@ static int tegra210_emc_debug_max_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra210_emc_debug_max_rate_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(tegra210_emc_debug_max_rate_fops,
 			tegra210_emc_debug_max_rate_get,
 			tegra210_emc_debug_max_rate_set, "%llu\n");
 
@@ -1723,7 +1723,7 @@ static int tegra210_emc_debug_temperature_set(void *data, u64 temperature)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra210_emc_debug_temperature_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(tegra210_emc_debug_temperature_fops,
 			tegra210_emc_debug_temperature_get,
 			tegra210_emc_debug_temperature_set, "%llu\n");
 
-- 
1.8.3.1


