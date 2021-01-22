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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BA6C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE9A023B08
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 20:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbhAVUjA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 15:39:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730239AbhAVU26 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 15:28:58 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AFEC061A2B;
        Fri, 22 Jan 2021 12:25:14 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id o17so9311990lfg.4;
        Fri, 22 Jan 2021 12:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rlJEgLfBA0bjZws+X1e4HabyZzD5ZXADHa7a+C/JIG0=;
        b=SW2uc4HWxr6q3eIcOVGumXrd2oCUur8aPgjwnalOELtfpzGBrL82ybygEStoCzOfyP
         7V4rMtHFUUy2Ff5pm+DGt1KtQcTVieTn/2w6EeVZHkVXsCvhrGlpymZxwWe3Ztr7cjf7
         H3kSO0qlxH/BQ262TH1ZfHmatyAjmxK405JIwKImYinEIAUXlLGRK9YN0TUnlhPspdG+
         L5/IrUzWj+IvhKwrXC1xdtPAV4aI5FLfzQnq4+3823RKIbQM9ByesTPsfc9/hK/y4rTM
         wBUwe3v+7Uqdqn40nMAlAsMYY0CVL83eTCVcYw/sI1q2vQnz5b5q+yJSd3mr4V2ttppz
         KfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rlJEgLfBA0bjZws+X1e4HabyZzD5ZXADHa7a+C/JIG0=;
        b=EqQUO79pgorND48aS4zYCl5JEYDQP0AJ6R3NzXft6p/r/lkNayg5PCTn/uLmLK3PUc
         HyiRNgx2G7HMfbLpn9vwchzGcSmc8CvTY50+urxEerx7h2vBSBQaqR35W5I24p2A/Zol
         c3HFP975BAZ3S2oiOLJG8W1vqSQWhUdCo9AhOwXJm6tPHyWGbT7lZs4qkCuP1jZhtmC1
         ikJkX+1z9JXqSCxT021hh1cuNLmFw61xzUeRdiFoq+9Qg3+td7s5gBiKnvfjRL8cq27u
         kNDZ6CmZxmAYnxCNwz2ANqrd5BvCvnhpGyI0iUvBIKH8VimWRpk35pbkkF8rx9tjQXc4
         CfDA==
X-Gm-Message-State: AOAM533gj2x7RU7G2gkTbEay37+PkcbaZtErjg7hj2uzAz5uD2TP3P3o
        waBEgNarUsi4hUAPzzDf9zA=
X-Google-Smtp-Source: ABdhPJwmPe5AhTIw82JbIuYiIsslrg8fPVOm7E9/JIpYJJZ9wIDMi2kmcktjSsngu8RAoNFGj4kYww==
X-Received: by 2002:a05:6512:1310:: with SMTP id x16mr963501lfu.19.1611347113214;
        Fri, 22 Jan 2021 12:25:13 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id q5sm996921lfr.172.2021.01.22.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:25:12 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] ARM: tegra: acer-a500: Reduce thermal throttling hysteresis to 0.2C
Date:   Fri, 22 Jan 2021 23:24:51 +0300
Message-Id: <20210122202457.13326-8-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122202457.13326-1-digetx@gmail.com>
References: <20210122202457.13326-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 2C hysteresis is a bit too high, although CPU never gets hot on A500.
Nevertheless, let's reduce thermal throttling hysteresis to 0.2C, which is
a much more reasonable value.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 719da992fdaf..0d228e2dd158 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1055,7 +1055,7 @@ trips {
 				trip0: cpu-alert0 {
 					/* start throttling at 50C */
 					temperature = <50000>;
-					hysteresis = <3000>;
+					hysteresis = <200>;
 					type = "passive";
 				};
 
-- 
2.29.2

