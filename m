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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FC5C4363E
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A78E611CA
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbhEPQcW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbhEPQcU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:32:20 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB0BC06174A;
        Sun, 16 May 2021 09:31:04 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id j6so2590772lfr.11;
        Sun, 16 May 2021 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0JGz9I0bXsTqRTuktP7wK1Haki3njJOFWPxNugzWJw4=;
        b=E1sESKs8TGyYHhrpvNRp1VP+8t6lJwEwL5FiP02BwlRsZg7xBUjTa7FN4lg7JWPxyd
         hX1mcZadWKXjHlIe/B/C43U9lnOvTsiz+jlxMcZorI+5fPnCbqlTYtmh7sFyXoogvkSW
         eJH6+YyC0irkZp8H1cVhKoPXnuwqFK3r8jfbttFNVsQf+h0hzkob2BU3ByiBgIuyfQZa
         q7M3wuvBx8JUHC+03CnyuqDQjatNRUvooXZCCvLeimIxSGsUCvjI5BWnPNeRJiefWxYD
         OogFMeeBWZ24Wqqbj52MNBIAv2wHijohZRwYVDm7WEEYCfePUgF3jyxPbHv4ziF3hfpo
         2GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0JGz9I0bXsTqRTuktP7wK1Haki3njJOFWPxNugzWJw4=;
        b=WxZgxmB+8B6CqQYc8qAR+85xKHYCv/8zOgpSAOfyiN445M/2a34bNqhQr2SyaRnk+W
         zBUgltL9+oL8FeW26yK2i0MHVPmhJtXUGUoxlN2WXWGtREdOY15kqUxihPPsZbLGmiqI
         VHyzrhsghschkwgp3DCXlPQmlEoAklSWi7hH1hP/ovC2Pv/VdvswNxml2CqUsMjUzd0w
         uLo1IKO3rnxSIORUu5HYtMitz/9ZcZ8+/1aca4NI9iLAnubxua9GQcAXPp0LnuWuuKae
         70ae5/ba+1ToT7imuUiV5LG4kPyYRrhYpqOtkGoVSz4ieDOf3iTg/T/CDcN/W9zSDekf
         LAJg==
X-Gm-Message-State: AOAM533LzC3ASzGKNUsCDEb09/PoNRADAnljE0yfJtzsjWbqzamIfiAr
        exQQ4gYgG8aqV25Bq2TzqqY=
X-Google-Smtp-Source: ABdhPJzkxtSrePdapQmN0NWpY7GGcPEsKT8zuOCU/1dKNrSz7DOtTIQYMz8PTqNVAWuwEDrDlxWcow==
X-Received: by 2002:ac2:52ae:: with SMTP id r14mr41748527lfm.144.1621182662672;
        Sun, 16 May 2021 09:31:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id m2sm1704548lfo.23.2021.05.16.09.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:31:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v8 5/9] clk: tegra: Don't allow zero clock rate for PLLs
Date:   Sun, 16 May 2021 19:30:37 +0300
Message-Id: <20210516163041.12818-6-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516163041.12818-1-digetx@gmail.com>
References: <20210516163041.12818-1-digetx@gmail.com>
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
index 823a567f2adc..eaa079c177c3 100644
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

