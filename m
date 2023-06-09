Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37811C7EE29
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 14:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbjFIOmf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 10:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236150AbjFIOme (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 10:42:34 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF74269A
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 07:42:33 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51458e3af68so3207248a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686321751; x=1688913751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtzcCW3xD18TXr/1ERdT9p7u3+NtMz6vgFJptk63/SY=;
        b=mgpa9S8tGZJFf5NJK3D6MNV4zdAmS2JgiiH92mUkQWYrqVooOU6u6ZL8oQa9QDFPon
         baGWTNc1oouB78me/vH2hjnMmeAhFWsbQ+GpFeeozWMWXJeIpXpqnpwuRy8xL0WZRkoQ
         JWCD+ZSNBLwDXV+dgX2lKtxUuaETB6m6hG5zoMNS8Ie2Y9bL4J2KmYcd5KSwBFcbmTSM
         N7jHqmsmS0kC31KCgPEzgcO4yy4dkACWjeZ9Fka/15/trH4qA4rVxH/wPrI7VQ59xE0n
         sE4eNC+0KUIkBuRfmhxsjrEwgqw+gYaHy7i0PV5s47GiSZLpqddZq3dL2fRJTxUrgXFF
         w92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686321751; x=1688913751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtzcCW3xD18TXr/1ERdT9p7u3+NtMz6vgFJptk63/SY=;
        b=WLsLYG98fcJC4gQpE9l8EzcWNgrOQr64rsXoc4Gpedp4kax97FGI3HqVs6lh5Sd3Jf
         xCXfyWKpy7jVcyoczfxbIs4mKO24Wox4i6AQVzJ7rZQ82wChczwuAtnwxxqT7ZY70Qji
         8j+AIy8oukH6mTsnqYOivb50hwM3vjJOELwehGLaBtJPWnxYYKV3LHARk7bD+gMUNbWo
         4Z988yR1rAr3+eSnRc3PcdYQLgDsPhHSPod/S0mRSouaSdzD8LnMSz61Ok+bI1cjjEFM
         gC0NqdSAG3SuqEKGxqdXarTLjHS0ez5vuKxAmA+i7PGpq99c/1dblnkJTpXN54DIxRys
         CDtA==
X-Gm-Message-State: AC+VfDx1OTr/0YFezrW7EY91BiD4hcjF6cgA6f4tGdwaIHONRfHSzUMy
        Wr507RCsaugCHcO09xIXuMI=
X-Google-Smtp-Source: ACHHUZ5h36wlks6GZSDF2PV335ofhl3q/qD8csh/iNLpA25DV4kl5qhTNIgyaTZ8xMrkio5FquDUQw==
X-Received: by 2002:a05:6402:1a52:b0:516:af22:bccc with SMTP id bf18-20020a0564021a5200b00516af22bcccmr1307814edb.21.1686321751442;
        Fri, 09 Jun 2023 07:42:31 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n24-20020a05640206d800b005169f9365c3sm1840788edy.20.2023.06.09.07.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:42:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] soc/tegra: pmc: Use devm_clk_notifier_register()
Date:   Fri,  9 Jun 2023 16:42:25 +0200
Message-Id: <20230609144225.3898934-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609144225.3898934-1-thierry.reding@gmail.com>
References: <20230609144225.3898934-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Move to the device-managed version of clk_notifier_register() to remove
the need for manual cleanup. This fixes a potential issue where the
clock notifier would stick around after the driver fails to probe at a
later point.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 438c30c5d473..162f52456f65 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2992,7 +2992,8 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	 */
 	if (pmc->clk) {
 		pmc->clk_nb.notifier_call = tegra_pmc_clk_notify_cb;
-		err = clk_notifier_register(pmc->clk, &pmc->clk_nb);
+		err = devm_clk_notifier_register(&pdev->dev, pmc->clk,
+						 &pmc->clk_nb);
 		if (err) {
 			dev_err(&pdev->dev,
 				"failed to register clk notifier\n");
@@ -3052,7 +3053,6 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 cleanup_sysfs:
 	device_remove_file(&pdev->dev, &dev_attr_reset_reason);
 	device_remove_file(&pdev->dev, &dev_attr_reset_level);
-	clk_notifier_unregister(pmc->clk, &pmc->clk_nb);
 
 	return err;
 }
-- 
2.40.1

