Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE8EB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Jun 2023 13:07:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjF3NH4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Jun 2023 09:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbjF3NHz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Jun 2023 09:07:55 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29CD35B0;
        Fri, 30 Jun 2023 06:07:53 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso22967525e9.0;
        Fri, 30 Jun 2023 06:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688130472; x=1690722472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xzl3+jTL6C0kGnIPlN/x9+QiqT/1hwIAKox8W+NdYCs=;
        b=LZ7UtkcOH1znq7tb1qjYGXepM3YrlocEENIucCxfPJSc1dUBTM35cd85KN53qyzi7u
         0IVkUSRYPSoTpGkY6tccFylCJSP5a2+CSFpMNXHzR9XfcqSBRM/zR5Iy6OPkE6y87O6A
         tWSk6Z4qhOL5Tn+c77IEMAXWUYoqvhsRTded0ACNY9tEOMw/ARPFqPGOJgWH9Swev6Oe
         eEKcOedDGlbaIiilgPQZUzR8Qv6jyYquCVpAUgScORon1pnSkMvR2EUD70Xblr7Vn99O
         VWvdcSJnGVtXcr3LkQT/ZPOJDql1/OadBfQNq/74d393DkGlEGZZEpxSO7onYqYZLUZd
         V0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688130472; x=1690722472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xzl3+jTL6C0kGnIPlN/x9+QiqT/1hwIAKox8W+NdYCs=;
        b=I2JB2lFwgv84aU/kJkhCgnj8QNqyU0yQ0kj6/ISkGGLQuDY5F8i512SKkXGvqzcH5j
         CJ0uBaEzH00FcGYcuuqBPdEm7SOWfOk4XRqEKlq0rS5aOZJNDaoZrloq2DJ/z7qCjvwo
         Ue7LB712X1rLq2KyPquYutw6y76QTvDegzopa/jU34LqwMSo+5nDOYPlF1FSHfXOdPrK
         60exhMUvzRutc4EZYrdEo67RnX97CuWsb1ysxyxiv0o0EC5iEnaUgnbyigQWa2lHEc6A
         Q9N9k8LaDtld9nuOjRQDP/xAx3GMLjCRDUgaGFA7fUSbSgMoLgm8IZq8zYmPhpJBG37/
         kR9w==
X-Gm-Message-State: AC+VfDyObYYqXWoMGVroNytIuTQYcibBQmYmvi9VF5M79o4jRP2Qtw8y
        rfDaKMJQjTwUBl1BI++/Puk=
X-Google-Smtp-Source: ACHHUZ5A+y/dozE/QyDUV6BQnLTm5asf6ABe+WnOmV3Ko4scQ3w0qClnajWzf1VQ7dM1Sf5uole5ZA==
X-Received: by 2002:a1c:7914:0:b0:3fa:984d:7e94 with SMTP id l20-20020a1c7914000000b003fa984d7e94mr2511802wme.18.1688130471990;
        Fri, 30 Jun 2023 06:07:51 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w10-20020adfcd0a000000b003141f96ed36sm2037085wrm.0.2023.06.30.06.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 06:07:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] clk: tegra: Avoid calling an uninitialized function
Date:   Fri, 30 Jun 2023 15:07:48 +0200
Message-ID: <20230630130748.840729-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit 493ffb046cf5 ("clk: tegra: super: Switch to determine_rate")
replaced clk_super_round_rate() by clk_super_determine_rate(), but
didn't update one callsite that was explicitly calling the old
tegra_clk_super_ops.round_rate() function, which was now NULL. This
resulted in a crash on Tegra30 systems during early boot.

Switch this callsite over to the clk_super_determine_rate() equivalent
to avoid the crash.

Fixes: 493ffb046cf5 ("clk: tegra: super: Switch to determine_rate")
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-super-cclk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra/clk-tegra-super-cclk.c
index 68d7bcd5fc8a..3b22a4d0dffc 100644
--- a/drivers/clk/tegra/clk-tegra-super-cclk.c
+++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
@@ -86,9 +86,18 @@ static int cclk_super_determine_rate(struct clk_hw *hw,
 	if (rate <= pllp_rate) {
 		if (super->flags & TEGRA20_SUPER_CLK)
 			rate = pllp_rate;
-		else
-			rate = tegra_clk_super_ops.round_rate(hw, rate,
-							      &pllp_rate);
+		else {
+			struct clk_rate_request parent = {
+				.rate = req->rate,
+				.best_parent_rate = pllp_rate,
+			};
+
+			clk_hw_get_rate_range(hw, &parent.min_rate,
+					      &parent.max_rate);
+			tegra_clk_super_ops.determine_rate(hw, &parent);
+			pllp_rate = parent.best_parent_rate;
+			rate = parent.rate;
+		}
 
 		req->best_parent_rate = pllp_rate;
 		req->best_parent_hw = pllp_hw;
-- 
2.41.0

