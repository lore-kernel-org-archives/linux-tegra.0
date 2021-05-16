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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34A9C433ED
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6CB261185
	for <linux-tegra@archiver.kernel.org>; Sun, 16 May 2021 16:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbhEPQcV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 12:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbhEPQcT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 12:32:19 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7819EC061573;
        Sun, 16 May 2021 09:31:03 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 131so4345978ljj.3;
        Sun, 16 May 2021 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TF0y5PK4jSr2yBkqO08CTECh4xjTFU4xmlboErGSAg=;
        b=hKAX7wsXne2WeLIYqFyUzBJK7MIJs2Drhrfy1tKfqvjKtZbCDzue/UjUxn3DJoaUnq
         OiUArDeeYViIzlK+Ouqpq0PYyk4RO57vL9/GophjOK3cIL59Wo9HrfeDxCOjVzjEXDuG
         drmguL/4zAGk/3X8uP9sji25cz+ITSL4n0n78tTURSiSjhdUytT0zmPPr0lCNFkVX/g8
         Bz1s/MI/nfjJNRgAnb32OdIHR1NLdh//bfiTbf4WYS8wTqsPn8kMuiQ9f6yiJRaDMPZc
         Q2U4aPXvp1tb4ROAAvGjBy+bvzzLfy+AS3KQKGvZVqCB5zUzGU4m5423QDKdvhMv7qwd
         Q4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TF0y5PK4jSr2yBkqO08CTECh4xjTFU4xmlboErGSAg=;
        b=gl/+Ttl7JUQU0n4r345Ry2n6R117W13TEPVPt2eoNNczsuH2ovTuAFhDbK6UBAtqYm
         WqfT+lJQtYGcy+t5xDSDgo36ysxugfX+nLMBzChUS/orCjKgBNRngRgID+Ad7uYj1A9H
         zz4W42MCKIBm0+Yg7suFOvbvFX5fPr6DrD4k6j9GzKOpjoF0XZv1pOpzB+YIDNprJVYn
         mgjtJYaanXoiOwl59ao6Guh2H0rmGR72+4NWJFBoTQzEi8S/k0IN9+OP7201C1+wqLJ1
         yHna0FCWQVSE/CODiPf6nK2bR7G0wknR4zp9Vjk1ygm1BLAkALL1rRNqYOGk5o7R/p4e
         GDZg==
X-Gm-Message-State: AOAM530TLrn33xWGs4Or2Xr9jzBVYm/jRGmUroVcTGeOrk7mzS+lvN22
        lvwCtnvhBbF0jfYHI96iFYo=
X-Google-Smtp-Source: ABdhPJwIto4jBdNZQt2CeQW77E9NVTLlwxVYRHrORrilsFv10k2TYgnBXCQWE/gHDzj7PtgEflzPCQ==
X-Received: by 2002:a05:651c:285:: with SMTP id b5mr31881741ljo.348.1621182662027;
        Sun, 16 May 2021 09:31:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id m2sm1704548lfo.23.2021.05.16.09.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 09:31:01 -0700 (PDT)
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
Subject: [PATCH v8 4/9] clk: tegra: Halve SCLK rate on Tegra20
Date:   Sun, 16 May 2021 19:30:36 +0300
Message-Id: <20210516163041.12818-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516163041.12818-1-digetx@gmail.com>
References: <20210516163041.12818-1-digetx@gmail.com>
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

