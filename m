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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5C7C4338F
	for <linux-tegra@archiver.kernel.org>; Sat, 21 Aug 2021 03:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 173C061184
	for <linux-tegra@archiver.kernel.org>; Sat, 21 Aug 2021 03:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhHUDxN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Aug 2021 23:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhHUDxM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Aug 2021 23:53:12 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6EBC061575;
        Fri, 20 Aug 2021 20:52:33 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id l3so9131491qtk.10;
        Fri, 20 Aug 2021 20:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sR4E5Sm8LLwOyw9xtSMIJM649G2H66OSbDzhGqNUrlw=;
        b=nUxGpcWXP0ZRhbiJYoEE4Gs7Sw2fMWrVjFC8tZUsBb5Z4zqToWn8FPieO3UwRGgQPq
         twEVVvP3yx9u2tJ0gHiIsqjeio9LGtM/2bMwLrG/094joM2NbLFdrA7h8Uqp6yo/YLuR
         jfDyL3EFKqsF1Qv6QQP2IR1/ad5aY51J4nSNx3N3iaNysSYstec5d9Yuc5BTi6uWob2z
         tiYSs9aphg0qF6n+jvWYDnyWIf5oINNVv6j86J1heZTZjjAFxY14XdPweeGZdEl7jCcj
         0h0ZAoqpvpJO/dtsZnEbtnEI6fmTABAvmjM4cuuZ8yhgWWcqSL5WyU1GrzMIn0xZDg0x
         1q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sR4E5Sm8LLwOyw9xtSMIJM649G2H66OSbDzhGqNUrlw=;
        b=GpFfcPV8WQZbqegiyCCLX1V191Y52WCF1ccWFNWrn5U6HkHojtM8rmJkDAlFv7kG+M
         gVXNHdzwRx6yiMwbyzsKBgBVQXGH8qLAXAPXlLQXO/0+vvYsgqTrCVh9a1VxhI4c+6Xl
         63bNMw/PaV0B7XawYR8AV4o3ckCKTZPTUU0GrrgolERn9CI2fY9y0YW01gw+d9aPzqpx
         P4nJ4p9V8WvlVdRr8GFbo6o/dMOnvcGzKWBAilSx9WPv6PgFjXy09l30fed1MDiu2+vV
         AV/89465ngg6kRJ0YjjgyzQ5HqmXkZNJo1Z6VbeaeMXGWqDUQ0OC0La69qkFgBCLX/s1
         gGEA==
X-Gm-Message-State: AOAM533bUNcMEtNaLarzMpeGeB/9GIr5erXu7yhUVD0rBo9UONrvp5Ov
        w4oRN8AnGULVkDTPOt24AWU=
X-Google-Smtp-Source: ABdhPJzujUUuwY3in9lxJJAkZV17XKQLf3iKAYUf+FzBBnu0I2O0DK7Tx9Wgs6hDsyJ/EU99nI+05Q==
X-Received: by 2002:ac8:59c5:: with SMTP id f5mr20284178qtf.50.1629517952794;
        Fri, 20 Aug 2021 20:52:32 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id 19sm3843616qkf.127.2021.08.20.20.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 20:52:32 -0700 (PDT)
From:   CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <jing.yangyang@zte.com.cn>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        jing yangyang <jing.yangyang@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] memory:tegra30-emc: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Fri, 20 Aug 2021 20:52:23 -0700
Message-Id: <20210821035223.28282-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: jing yangyang <jing.yangyang@zte.com.cn>

Fix the following coccicheck warning:
./drivers/memory/tegra/tegra30-emc.c:1322:0-23:WARNING:
tegra_emc_debug_max_rate_fops should be defined
with DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 drivers/memory/tegra/tegra30-emc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 7e21a85..80f98d7 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1289,7 +1289,7 @@ static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
 			tegra_emc_debug_min_rate_get,
 			tegra_emc_debug_min_rate_set, "%llu\n");
 
@@ -1319,7 +1319,7 @@ static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
 			tegra_emc_debug_max_rate_get,
 			tegra_emc_debug_max_rate_set, "%llu\n");
 
-- 
1.8.3.1


