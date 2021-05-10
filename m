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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81D7C43460
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B858B61359
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhEJXSz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 19:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhEJXSx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 19:18:53 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F074C061760;
        Mon, 10 May 2021 16:17:48 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i9so19288642lfe.13;
        Mon, 10 May 2021 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0JGz9I0bXsTqRTuktP7wK1Haki3njJOFWPxNugzWJw4=;
        b=rzRvKsi/RYRQ2PA0V7XiUatSJMWiYhZSsQYtzRFOJo+HywvFIR/No0Tt15xIU2QF1k
         +FxsDe47g1P8pOxiU2Ykw1v3EOFzX1M7rs2ZR2uKEv3VoR3llrPMxWfzCaVvxP1iWcsw
         YhGlnRgZTK1pTpOC0zp+nzaBkhtQvgB4hPRPEZfinmRSCOkleVjI8fvCvOfZWtrOy6V1
         XR4m+ZbchdQm2gHEz23TmTZFx8u/WOwRs9Kf6IAx5gn4xsd8YKyFzCr6fp8FgWKfQSpx
         JXN93e1qgHC+GdkxFa55t9N59EYFDY1vWf8H27cjb+gaszGaIySdgfqdcaIRrp9dQNuU
         7Vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0JGz9I0bXsTqRTuktP7wK1Haki3njJOFWPxNugzWJw4=;
        b=JEjgRaXHsTfdc2SnEnGycF23YahJUQaOATuQZwYiuUpRDmJMugnVnarAP8LXBPNBy1
         e23W/yNz2bTxehAYSMnnDyjV9ZrdhpqWTSYfsQJw0hcTv5yevqjXVitg4H53kKstPm4y
         /tMtRELkCPu7zntGLTtZacP+edDcCP9jP3pICQ7LcdIGIDwrGCydaLWMf0FL8hKISbUE
         pH+yuEWUtmIxUYEL51v71zZV3FpzsGKYJoe03iJaB53KvULJCmzglsoLoU4jHOurbUvH
         7XzeVCP/XU4VM8BRGjK4HEfJuaSWw4Cj0ulC9RxT763cxgef/1olmTl2cSrlWJe/yHU4
         xttw==
X-Gm-Message-State: AOAM532g4gVyjqgJbYDuhkus3BTkk0zhhiHSXGDpTU1eiljclqkOFkj3
        NHxLR6pSvc2yv3caishVKiI=
X-Google-Smtp-Source: ABdhPJwjQ2lRT2oo6ibnYe9KjbGjElGXGNedNxC4RfYL3WZ+CH6P2F6PivjxZIxf4z5qN1mff8qpuQ==
X-Received: by 2002:a05:6512:20c5:: with SMTP id u5mr18421398lfr.198.1620688666718;
        Mon, 10 May 2021 16:17:46 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id k8sm2422254lfo.123.2021.05.10.16.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 16:17:46 -0700 (PDT)
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
Subject: [PATCH v7 5/8] clk: tegra: Don't allow zero clock rate for PLLs
Date:   Tue, 11 May 2021 02:17:34 +0300
Message-Id: <20210510231737.30313-6-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510231737.30313-1-digetx@gmail.com>
References: <20210510231737.30313-1-digetx@gmail.com>
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

