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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2469C43617
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9A6561359
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 23:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbhEJXSy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 19:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhEJXSx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 19:18:53 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A99C061574;
        Mon, 10 May 2021 16:17:47 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id c15so8312312ljr.7;
        Mon, 10 May 2021 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TF0y5PK4jSr2yBkqO08CTECh4xjTFU4xmlboErGSAg=;
        b=UvnLDxZnOj75XPEANvZNPZOF4deWpFjnvvidhS1TrEuXpKe11Eubz65NH4fBBNk9zh
         vctrkjqN+qOWSSJI1WKvzpuVltDpcR6CIzStf+Rk88yNvsMk8SOSShtzqJYKl3EcRVtt
         lpgZ5NDiJH6VFur8llJORDZ9aW2EIxzCFp3wzCbtIzgNjKYu8+L7rKHuEXDGHRE0Q4cE
         eUVbRMvkz7hYNDPwWkEX1OCN2JqqIVpXrS03IUr9RzdRpx9pERp4mpuMFNMuU+jQCF6C
         ba/GmvMaD/uUujygnQyMfQ4dcvecEdE8N38NrohuRECeCNcGGRb7XDtNYuo0l0Mi9lv9
         rN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TF0y5PK4jSr2yBkqO08CTECh4xjTFU4xmlboErGSAg=;
        b=qwXpFTmJmmGtpM41rTx/jw94zZi1XnjttQrrE/gvnonRExfJ3gX2ZjzSLMIe0gVncY
         Mo1BTHQNMSP4iD2O5l/3Kc++Qcq1F4JmYnS/DUwMGRKz6G06HL9nCHWWHwwDcJ5piCsA
         T+15ngmwjV3OBa9VsrHfLO0F85s7tfMMWZ+EJtU9LxHNV2LfLikFBb6E7IzMQTwI/CDP
         8LqGHS5nBUSS44hfXyQQLh29OZU5CQwivX6g4mA+tlF/R++GfuHTo0ovR/ldYWr07i3o
         RFUrnSBwdw3kXlykVcz603Z3Z5D43j4iDvW0DSEgm82hVSDaCQwT1YOeaXKIGWYCAkRx
         kcaw==
X-Gm-Message-State: AOAM533oZ5hLc259g097Ig+p8H0udJnVt2+Rg65eCzv9SvnM0kTa27yz
        DhGoELtHboAoyqTHq29QGf5FP6cB6io=
X-Google-Smtp-Source: ABdhPJxvvFernfCCr3P5x1twYvmSZCcjHiWlonirzf4IXMMuSYk4ZRtCcjb/fTErVPr7Dvxtu/AbnQ==
X-Received: by 2002:a2e:9e46:: with SMTP id g6mr21699436ljk.55.1620688666078;
        Mon, 10 May 2021 16:17:46 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id k8sm2422254lfo.123.2021.05.10.16.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 16:17:45 -0700 (PDT)
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
Subject: [PATCH v7 4/8] clk: tegra: Halve SCLK rate on Tegra20
Date:   Tue, 11 May 2021 02:17:33 +0300
Message-Id: <20210510231737.30313-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510231737.30313-1-digetx@gmail.com>
References: <20210510231737.30313-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Higher SCLK rates on Tegra20 require high core voltage. The higher
clock rate may have a positive performance effect only for AHB DMA
transfers and AVP CPU, but both aren't used by upstream kernel at all.
Halve SCLK rate on Tegra20 in order to remove the high core voltage
requirement.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 3efc651b42e3..3664593a5ba4 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1021,9 +1021,9 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_PLL_P_OUT3, TEGRA20_CLK_CLK_MAX, 72000000, 1 },
 	{ TEGRA20_CLK_PLL_P_OUT4, TEGRA20_CLK_CLK_MAX, 24000000, 1 },
 	{ TEGRA20_CLK_PLL_C, TEGRA20_CLK_CLK_MAX, 600000000, 0 },
-	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
-	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 240000000, 0 },
-	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 240000000, 0 },
+	{ TEGRA20_CLK_PLL_C_OUT1, TEGRA20_CLK_CLK_MAX, 120000000, 0 },
+	{ TEGRA20_CLK_SCLK, TEGRA20_CLK_PLL_C_OUT1, 120000000, 0 },
+	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 120000000, 0 },
 	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 0 },
 	{ TEGRA20_CLK_CSITE, TEGRA20_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA20_CLK_CCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
-- 
2.30.2

