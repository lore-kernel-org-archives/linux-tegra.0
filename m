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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DE2C4332D
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 080882310A
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 12:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387429AbhALM3I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 07:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733015AbhALM3C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 07:29:02 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22AFCC0617A2;
        Tue, 12 Jan 2021 04:28:07 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id u11so2574685ljo.13;
        Tue, 12 Jan 2021 04:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YbCt8c63GUP1agI5360KeRAoipT3c5n0ARCG8OrWiQk=;
        b=QnSTV10xoLR77XEf35wtSKgHWWSMCvdrA0hFlTIm44ElqOZ6+0Nw7BgbD9fI7rt7CS
         AaOz9gniOn3BZNIAEX/ZD4NfKb/ziFgah1xx/Y+w40VQcH7mfJEf0oTuq+HH4itbTFs4
         SUdWFrDmgvqlI4qomJHKG7ZSaGZ2wC304LQGniz3k38SEUBIJTA0Y7WIMObgyiECWoID
         sBIt3K1R6pwTB5ExueCXM9h97tQJaSGHgvHuqeW5DVRkQFo9PIuqEiy24Lg4A7F72765
         5cJNA4jaTr/PH5XyutTqLUU7pFJ8uMhkfA/j8TzAbD2hv/2Jloc3n9hXSPXA09IXnG0+
         4m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YbCt8c63GUP1agI5360KeRAoipT3c5n0ARCG8OrWiQk=;
        b=uDVQTkCZYdwV4f4H6Mj58Uykj+4JAnI0DZRx/eEEXC/2S6zKFc5kJTfRFAo/MJxbva
         i1EC+moAJtQ020mvvpQGxA8azOJVHURu6q1ReiZXYj6YekdItF+RpOz1t7KSSMQEsrmQ
         oa1EKxNbvUBRCCej6uE2ax5m6d3JErdKDKXM8seF5JuIMcLmZZOEq9pKhQPpRj5YTpiG
         OxINjwH0I9VQkjK42Z6NQbCEZW8p4JfPOqOQ+QO0UePOmnZokoYZyXsUUPP1+nHVueoX
         JNCiHNRVtusln6CJniYmnSW6xLYv+vL0u7rZc2sx1G4GqKdi1jLqp+r5u1YH34j0uEKH
         589w==
X-Gm-Message-State: AOAM532AsnF0wmJB8wq0uviwbVtn46UlHfqTHY/Lv1XrbGVd0FeKnLct
        /VhgvWWV6rligQON5NgT59I=
X-Google-Smtp-Source: ABdhPJwMGMulFvAYCGLlKW57sgXThvxKU99ua58iVysmvcFCZuwwy08K+m5ODc4hWtYKrm4KMD+ANQ==
X-Received: by 2002:a2e:301a:: with SMTP id w26mr1932677ljw.235.1610454485703;
        Tue, 12 Jan 2021 04:28:05 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id c3sm330136ljk.88.2021.01.12.04.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:28:05 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] clk: tegra: Halve SCLK rate on Tegra20
Date:   Tue, 12 Jan 2021 15:27:23 +0300
Message-Id: <20210112122724.1712-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112122724.1712-1-digetx@gmail.com>
References: <20210112122724.1712-1-digetx@gmail.com>
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
2.29.2

