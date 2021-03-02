Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D937EC433E6
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D30B6023B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377470AbhCCDbG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350101AbhCBLyB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:54:01 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A1DC0617AA;
        Tue,  2 Mar 2021 03:51:46 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id k9so10901744lfo.12;
        Tue, 02 Mar 2021 03:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aptp5NmMT0c2/gtpHM3jND6fOADz+c+cCW4tHwby9/0=;
        b=CX7XQ3GoFscwZMGxuAprdkK2a4Ju5XArGZ24+JTaHoSZbDUMIX3tylUM85HR+lIYwy
         7EZLUdpKL34vby84vZXUo4i7EGGsd/Iq66dzQZNVvqPW3FTYpJFpRe3mrz+DKuSLzirC
         bEO+uBMbnnDiWPe42HL2721BLautywGKFN/DIqogn1BrjQmKG5VLYUXmEB7KKhkOhTeN
         Lp9n6BksMGi27Vei5UegQzsmt/OFS1A0gdbrarFEYhTm8jgAY5vTXf9Q6NpkeOlfs6RA
         umCVj6yOSH4emp6nwUDu4zrEJGXWWZXH1+I+AaBNY6JpYIHxTnRXj05wadUrjWLaAgnw
         ZgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aptp5NmMT0c2/gtpHM3jND6fOADz+c+cCW4tHwby9/0=;
        b=ZsMZHFr3yQhmPzdbxzHEJZvEWh7DB5CVF7bDmRaYllKxl852GX8pntlp+hm9nth9tH
         PzLdjOhLLlncflCAQC7UYbaOGvd0bGW94FSvhrSCuEcOl/4KhUhgb8efDdwxq4ocdKoC
         kPDsQJcBlWMcl7kKYaBzKl7HBRtsRUi5IxysC0i+FQQ1+y9ZjCe+CbTUgHvTuWcZ2Gum
         kqnFtSsMXEMS33GRoglMWfrXdArx2RhrNU+TCKC8MiE3UskK+4T6KlThzfXN9ED3uErk
         J2mvkzjGWKNtvchRPNuvpRHmLaQ1Op46sM6Y7p2Bq+Oe4ijtfwWjAa090V7gm6fFQasi
         pgJA==
X-Gm-Message-State: AOAM53101k1kGkzj5Qbb65R2M0qZxwIg+Jxf0dw+TO8Rf/TaTJVMqb7q
        jj4Isoo9PdZs3tG8i7VvwIk=
X-Google-Smtp-Source: ABdhPJwUa/fs69l5VobYIqUc2szq+QvQXNGsM9mxk1A52i95jEswLEFCVUXMJqqtPYq9V8LLFOrgFA==
X-Received: by 2002:a19:c3c3:: with SMTP id t186mr11924940lff.596.1614685904824;
        Tue, 02 Mar 2021 03:51:44 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id f4sm2720151lja.69.2021.03.02.03.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:51:44 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] clk: tegra: Don't allow zero clock rate for PLLs
Date:   Tue,  2 Mar 2021 14:51:17 +0300
Message-Id: <20210302115117.9375-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302115117.9375-1-digetx@gmail.com>
References: <20210302115117.9375-1-digetx@gmail.com>
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

