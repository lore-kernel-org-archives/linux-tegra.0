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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE667C433F7
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE69161972
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbhCTP2e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhCTP2P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Mar 2021 11:28:15 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB54C061574;
        Sat, 20 Mar 2021 08:28:14 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g8so7459233lfv.12;
        Sat, 20 Mar 2021 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVatthKifS/0drZo94nSguqAF/BwAr5rR9av6MBvQSU=;
        b=Ig+X/DUtUzHi5i6IlVFOg26+VpDNt3gmr2r7LMWQOtfDV4e9J9s0Kc9dow9XSk+GoB
         4Hr78XknE6VlsDfLSeCZYC8Ta0ZHSRDnrqEwgDjF988UVwXBK/37fKqe5VFV8HMbiWTg
         XmKbI8xTVxu+5szJq2g4LZCbq6Qk/ky7aeW/7sEZwOkqtF+fmjwoZdxyHDCnw6QCDhob
         Ay5m9Q/TpPy+LSB+f6cSeGkyLBLUeWljW0sgy2nvymhoEbW+Hdfn14s1eNrBuWjsyaqk
         ZtnJOQ83Y8pMgveB7tYnYcm6QlsWFsIUgl9SGnBywVYFLXxvvqgH3MSRDg4tIFFmDIw6
         f/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVatthKifS/0drZo94nSguqAF/BwAr5rR9av6MBvQSU=;
        b=tnDByClbZ2a8nwjFsYZQvJ/bNIOUKL2rVitapVH0yCGF7G9lf79mF2Jw9li68d3XsY
         N5ImXjNHjgRz/BelZfn9l9jb2xKStmZY7Vha6QlyAooKFEbuditu8ZIH1wjRhoRENHdh
         KJwzETYki/sehvi3I0CMdkbudNvh2/uSOhxLeqIGad0FlNj2MupWz+osm51qzB/4e4Ln
         3vUVb7X6mqzlnnHzkXjkPsYcAtsWx8RrRXux0Lf4hQFl3zipboRxUSL1XxiMisz1HmfS
         V2lLBCV/+kCdTUVda4YcPBSiMpNSqipl/bwCsU+TItRRs4fYlr6Z7zlkfrbAAXzyGhIc
         K4aQ==
X-Gm-Message-State: AOAM533WKcsl02s8IBaQvCz09IlmiqShaN18AXAqvXIGTcaSczUyVLBT
        kRAErl3zeP51dP0JCmxxzdQ=
X-Google-Smtp-Source: ABdhPJxwW9u3yC98oF4RkakhvT8AcfaPxPV9iCCQ/GvzOXYOd/6o1mG8iw/P+g28nePKesjzb5mX2Q==
X-Received: by 2002:a19:7905:: with SMTP id u5mr3796029lfc.648.1616254093429;
        Sat, 20 Mar 2021 08:28:13 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id t17sm957024lft.224.2021.03.20.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 08:28:13 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 6/7] clk: tegra: Don't allow zero clock rate for PLLs
Date:   Sat, 20 Mar 2021 18:26:47 +0300
Message-Id: <20210320152648.8389-7-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320152648.8389-1-digetx@gmail.com>
References: <20210320152648.8389-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Zero clock rate doesn't make sense for PLLs and tegra-clk driver enters
into infinite loop on trying to calculate PLL parameters for zero rate.
Make code to error out if requested rate is zero.

Originally this trouble was found by Robert Yang while he was trying to
bring up upstream kernel on Samsung Galaxy Tab, which happened due to a
bug in Tegra DRM driver that erroneously sets PLL rate to zero. This
issues came over again recently during of kernel bring up on ASUS TF700T.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-pll.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index d709ecb7d8d7..af7d4941042e 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -558,6 +558,9 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
 	u32 p_div = 0;
 	int ret;
 
+	if (!rate)
+		return -EINVAL;
+
 	switch (parent_rate) {
 	case 12000000:
 	case 26000000:
-- 
2.30.2

