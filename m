Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7420C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 01:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCE3661C12
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 01:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbhKQBu1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Nov 2021 20:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbhKQBu1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Nov 2021 20:50:27 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDDCC061570;
        Tue, 16 Nov 2021 17:47:29 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 200so793120pga.1;
        Tue, 16 Nov 2021 17:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=if2RwCOZ5smDQtEO21rQyYHG3FnGNFlXl1YSkgXSrl0=;
        b=BzibDV3MVPaDSWBxfZxBOkMmAOkVTSz4TU6dNCtfuFVaJTpD/IWpQaoDw8vHQuKawo
         bP5lk8MqQopY4vVZ992Rc6BM9YXNn8GRTIcHmzCfqYpMLRbRS4775t/GbuffQdGvt/JL
         oePCr32SZshrH7P2QYDxFP0/p98wCgLlbHI2rzpTTDNSXX9bfJTue7oXaKabXncIQZP0
         5X4C6W3IIinC5v97Zgg/WIpXT32ZhMJTuWAwKTaFRtkuYvxKfeinPdvRGCIwc72qSa9F
         Dp3KGYCs9YdCuq1z43d0VJ7V7Py4KTAGVBPTRnz2sn32pwHOS/lTbL3gnujdJByUkJEw
         7DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=if2RwCOZ5smDQtEO21rQyYHG3FnGNFlXl1YSkgXSrl0=;
        b=W5MQX4IdxWFcXSwFtneZUwP9NtkPKMnX98VbGXw2AdaC3u3+rEuP0iSmdYIZ7EoPeM
         +LpZmnDrcSNOP+YeP3XI056np80nIow8r84VHbU9auh7swW4EBPEb/8sakxHSTty+pZm
         cSmDOJO+PQIuttpEeDaqRg8x182Ro7HyzleP23Q4uoewCkkP93moDkT2EurLh4KjPItg
         x7Nd6GZBgNZsZwXlTWuJEAV9T1dDZlSaJnXaQ2oAD7CsMvrH4YRlmjcs6OXQBj0LXTaI
         wBcoQXqzhFf5jnEZ+1EtJsqexRvBjrPXIyTFk1E5hq7oU5zgRC/uqMwHGCINHuwsgcmM
         6mXg==
X-Gm-Message-State: AOAM533xp/U4Buv5rF3C8WcbdzXZFNHas91KeAm+3+26aQTIZFpDPOaR
        UoKfbKLBrGkzy9SCA3ongCc=
X-Google-Smtp-Source: ABdhPJypiPAgLKChaj11L2apk6DvhMEeK4z9uPiGQmEnbv5A8t7UdrQRrVz8S23VTxRC02OvMIB54A==
X-Received: by 2002:a63:1cd:: with SMTP id 196mr2569091pgb.417.1637113649219;
        Tue, 16 Nov 2021 17:47:29 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id k19sm20913307pff.20.2021.11.16.17.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 17:47:28 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To:     pdeschrijver@nvidia.com
Cc:     pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Changcheng Deng <deng.changcheng@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] clk: tegra: Use div64_ul instead of do_div
Date:   Wed, 17 Nov 2021 01:47:14 +0000
Message-Id: <20211117014714.159005-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Changcheng Deng <deng.changcheng@zte.com.cn>

do_div() does a 64-by-32 division. If the divisor is unsigned long, using
div64_ul can avoid truncation to 32-bit.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/clk/tegra/clk-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-utils.c b/drivers/clk/tegra/clk-utils.c
index 1a5daae4e501..12658add9dd7 100644
--- a/drivers/clk/tegra/clk-utils.c
+++ b/drivers/clk/tegra/clk-utils.c
@@ -26,7 +26,7 @@ int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
 	if (flags & TEGRA_DIVIDER_ROUND_UP)
 		divider_ux1 += rate - 1;
 
-	do_div(divider_ux1, rate);
+	div64_ul(divider_ux1, rate);
 
 	if (flags & TEGRA_DIVIDER_INT)
 		divider_ux1 *= mul;
-- 
2.25.1

