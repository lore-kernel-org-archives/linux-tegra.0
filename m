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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F76DC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69F8965022
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbhCLQhy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbhCLQh3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 11:37:29 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A968EC061574;
        Fri, 12 Mar 2021 08:37:28 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id v2so33693807lft.9;
        Fri, 12 Mar 2021 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aptp5NmMT0c2/gtpHM3jND6fOADz+c+cCW4tHwby9/0=;
        b=g/TNcYwOjlXmacxZywPdTsttNR0PlJHHkI1P0Q+RY/OOOtQXp5aq/C3MFJJMhtMLjM
         fBvg9jiJZCTSHz30q+2XZqtf82iOB6rJX1fHIPFUpSypGLscui6OOY2xMG4byjlI3ws0
         yFOityqXIvnGl7vEPHBeIIbcNLY5aSeRO2anZF/6WOYexKrq1HV+/WpNYy3vLEsZB0We
         tiYM8wIoCtgFAU98W++ne9pW+hkHC63t7LrH4zNETUpqm3HkJu6oNsABcI9sMuw49ZMO
         ojV2e0XU8Vh7TF1qYp29TDRKh+vkwH8KXlowyfZxnnhULPFfW9cb1hDwUHaV09rn73Du
         xFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aptp5NmMT0c2/gtpHM3jND6fOADz+c+cCW4tHwby9/0=;
        b=EfICZUGW3LAVRVdU9MDy4VGwo+3aHsSGKdBbuNs4vSE5rPs+3JoF67N+VOmmRCDwDV
         Kzcu3kkTuBEo7BoWM0a5seIW0MRkDz7UkEYHAUk4589005m5bdfP3MvtlFZjkBeMo0gw
         gppD+7q3EEo2QPDp4L1fFGhGGzNXBoxH5c7x9xr+dTCyBPFGKFdpF4EARWh/XWT8Sc6u
         mGU0xhA6nHtYTvLd9kx1h7ChE1S2/LSKM1OnoGWntAWuyOpIiExfwdQ/HYYlu/kyIjUQ
         p5shfhUoH0bETyQhBXPOcDGr4qnEJrbioy9EBBOi4XsKkUHCFPjXoMKQpl/EHskXrTpY
         cGrg==
X-Gm-Message-State: AOAM532p1TiNxvSW6ZyxLswc+vBfOKf9vtHzsJaGVPnhQsdat8c7sPk1
        p2bNdBM/+lDhQWaaQL1CzZfQy5BuXS4=
X-Google-Smtp-Source: ABdhPJw/Nc4+d67KC0Iu4Pjvk50Pnx+nXPgLwUBGe6aoLqOJIoYrq9LvQyQ1JYOS9JsShI2CulkdqA==
X-Received: by 2002:a19:3f58:: with SMTP id m85mr32255lfa.617.1615567047212;
        Fri, 12 Mar 2021 08:37:27 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id l21sm1771703lfg.300.2021.03.12.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:37:26 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 6/7] clk: tegra: Don't allow zero clock rate for PLLs
Date:   Fri, 12 Mar 2021 19:36:31 +0300
Message-Id: <20210312163632.8861-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312163632.8861-1-digetx@gmail.com>
References: <20210312163632.8861-1-digetx@gmail.com>
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
2.29.2

