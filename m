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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1CEC4151A
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFD7A64E6B
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442171AbhCCDbp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1578250AbhCBNQR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 08:16:17 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910FAC06178C;
        Tue,  2 Mar 2021 05:15:18 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id u4so23856946ljh.6;
        Tue, 02 Mar 2021 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9r1DFAaPtb29HC2sU6gbzgJhxX04EpEmGmNyScrTRWg=;
        b=PESF8tDUDk6Uz0FlXB9u8W4+2b2xyjPCCVflvcPHroKxon0Hf10BTl6qKtTqsW1wbp
         BsWsgjRbjrLbixpfJSdObEfyrVG4rwxYvleDu3gsGkUHEvlrQzfuUOQCE0RBcNMpT1sE
         pW5KXYtwisbRJOvlbz75/0umbgNJ6y+AY7zFI72oNFCuC7Vl9UvchqYxtNER3hwnjg4Q
         KJDjIclGGbXTwGSNhFjmFJztX5dxyeGA1+9Rx2yrLucwnbP/BxLzndCrKMp85jrk+Qd7
         ADq1Q5qOFAcqrVX539R4Og0orJwiinDOWTT28iUsWR/25obrx+r0+sV6A/cW6p/q7dXR
         ZURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9r1DFAaPtb29HC2sU6gbzgJhxX04EpEmGmNyScrTRWg=;
        b=aCtdLllvGt8tjs7iDJAEvirEXVcp8uALs0a7UXuooAjzCLEe7QD8lNKrXlsqmv0mFN
         y07PIiozj1ibr7kO4hQhUY7dT0SbYbZ1sNiMPjLU0KEyNP0QiqN0S/B9219nQXULHV2F
         pq1Xn3df7ai8zw4uPSMWuY/XstfhOuYr9c+9cIJyY7r0fgrznl+ctSoSbp0+1g6v9t5Y
         Ys88MEeEqtEIsCCFzQVNCluDozScPHN9cGD0xKvizy3BsH2QZclsb1nxHQ3M+KbOE9kD
         OCkRTknid8+KgzynW6FS0gQdMO6utzjdvXiwqvQTqDcOEKr+5N+p+bhYcoU8z0Wb+X8z
         GCZg==
X-Gm-Message-State: AOAM530ejmCBq/Ch0zb+Ylj8hM/WSwmr6UZTOgD8mt55CI/cL3WFotNa
        Eqhy4eWxqcOVcGvn9KrUPqM=
X-Google-Smtp-Source: ABdhPJzRPfagcDRUtiuLO17bXWYhG7ON9ldHSkMJi2dTVgAKGwqZLgthGDdYpJKBH5gxTIZofHmu/g==
X-Received: by 2002:a2e:b008:: with SMTP id y8mr3207751ljk.233.1614690917063;
        Tue, 02 Mar 2021 05:15:17 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id i5sm1033370ljn.100.2021.03.02.05.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 05:15:16 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/tegra: dc: Don't set PLL clock to 0Hz
Date:   Tue,  2 Mar 2021 16:15:06 +0300
Message-Id: <20210302131506.11790-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

RGB output doesn't allow to change parent clock rate of the display and
PCLK rate is set to 0Hz in this case. The tegra_dc_commit_state() shall
not set the display clock to 0Hz since this change propagates to the
parent clock. The DISP clock is defined as a NODIV clock by the tegra-clk
driver and all NODIV clocks use the CLK_SET_RATE_PARENT flag.

This bug stayed unnoticed because by default PLLP is used as the parent
clock for the display controller and PLLP silently skips the erroneous 0Hz
rate changes because it always has active child clocks that don't permit
rate changes. The PLLP isn't acceptable for some devices that we want to
upstream (like Samsung Galaxy Tab and ASUS TF700T) due to a display panel
clock rate requirements that can't be fulfilled by using PLLP and then the
bug pops up in this case since parent clock is set to 0Hz, killing the
display output.

Don't touch DC clock if pclk=0 in order to fix the problem.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 1399e4032701..4ecda4cdf345 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1723,6 +1723,11 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
 			dev_err(dc->dev,
 				"failed to set clock rate to %lu Hz\n",
 				state->pclk);
+
+		err = clk_set_rate(dc->clk, state->pclk);
+		if (err < 0)
+			dev_err(dc->dev, "failed to set clock %pC to %lu Hz: %d\n",
+				dc->clk, state->pclk, err);
 	}
 
 	DRM_DEBUG_KMS("rate: %lu, div: %u\n", clk_get_rate(dc->clk),
@@ -1733,11 +1738,6 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
 		value = SHIFT_CLK_DIVIDER(state->div) | PIXEL_CLK_DIVIDER_PCD1;
 		tegra_dc_writel(dc, value, DC_DISP_DISP_CLOCK_CONTROL);
 	}
-
-	err = clk_set_rate(dc->clk, state->pclk);
-	if (err < 0)
-		dev_err(dc->dev, "failed to set clock %pC to %lu Hz: %d\n",
-			dc->clk, state->pclk, err);
 }
 
 static void tegra_dc_stop(struct tegra_dc *dc)
-- 
2.29.2

