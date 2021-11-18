Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACCAC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0375E61391
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243908AbhKRHoU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 02:44:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243810AbhKRHoM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 02:44:12 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A81C061764;
        Wed, 17 Nov 2021 23:41:13 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id m24so4497156pls.10;
        Wed, 17 Nov 2021 23:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cumN0MHhp/gNl7eiIb43Myz/VE/1A4Arj32bsVlFt3k=;
        b=RCWqFij3nGrcR78WVxxI/Ygk35c1Tus0wDC+efFGB+M/xU31DIXOjJGxz0jjm4y3xR
         DZ/DM2eKbpt6WShft9fT8pjfTjYoJwDWFQcheY32CPbhK5nb51TccBfvBfJiyM8O1ziv
         0nXQhrJzzSu2qPStvN049aHQ8HXFZhTMD1yOaJiRz4d5TtnQEQObhXW052oF7dJ5QQwk
         llksUjwkojKG/hnPqukvWtTwNSxMx2biAsucilH+H7O/nEfBVfGgeIxs+58DoE+tlGME
         euNpsnT8bHlo3hhvUQ1ViSU2nTa2b2pa8eSTwR+vQbDugUfaOlCIKrlc98vBMA0IPHCB
         LlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cumN0MHhp/gNl7eiIb43Myz/VE/1A4Arj32bsVlFt3k=;
        b=3AV+r25WQAQcMloSWPQub152xfVPuulprXdC8rymX27A+zV62atjPRmF47L8VAYzb2
         AZu6oJFJw90NLUC60jclwR98ukIo9rXO0dZUJo8GL/knrDw5fDNy+FmcGLdL1AAUU1ID
         96Ywk5YMFuKvtBdDNTej3cvEn3b1IUKENQZsBlMnkLVoMFyIdNexi+S/a/VLADM+It5k
         gyM9NQRgRbOb0UeuTPXpUD0GmAYzl1Ivn3bpLtM328LarbqRSReL7Tk6ERxkSr3n1Mc6
         bSlb3HmNDyndL9C4fsqpSpQDNz01EXvgEmscAgAhV7fmim7f/1Dz6WnVs7/I7Qp5amFI
         FFBw==
X-Gm-Message-State: AOAM530aeQNvSq8eohR9a75AnM+8AcreQBFlWSjU5RlrZq11eM++IDAq
        kptodXWSpGIdCFPTXhcWFISosWv9XBo=
X-Google-Smtp-Source: ABdhPJykGJ1M0Wufnub9TreQKMkzCLGjv8nqGSqC6ecHvV7QmMKJW1iviquzQPJaKxBJ3mRr027oQw==
X-Received: by 2002:a17:90a:be10:: with SMTP id a16mr7943634pjs.133.1637221272875;
        Wed, 17 Nov 2021 23:41:12 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id k14sm2020991pff.6.2021.11.17.23.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 23:41:12 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To:     pdeschrijver@nvidia.com
Cc:     jonathanh@nvidia.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        mturquette@baylibre.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        thierry.reding@gmail.com, zealci@zte.com.cn, cgel.zte@gmail.com,
        deng.changcheng@zte.com.cn
Subject: [PATCH v2] clk: tegra: Use div64_ul instead of do_div
Date:   Thu, 18 Nov 2021 07:41:01 +0000
Message-Id: <20211118074101.165168-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117014714.159005-1-deng.changcheng@zte.com.cn>
References: <20211117014714.159005-1-deng.changcheng@zte.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Changcheng Deng <deng.changcheng@zte.com.cn>

do_div() does a 64-by-32 division. Here the divisor is an unsigned long
which on some platforms is 64 bit wide. So use div64_ul instead of do_div
to avoid a possible truncation.

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
+	divider_ux1 = div64_ul(divider_ux1, rate);
 
 	if (flags & TEGRA_DIVIDER_INT)
 		divider_ux1 *= mul;
-- 
2.25.1

