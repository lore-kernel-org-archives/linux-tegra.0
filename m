Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8194C4708F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B30DA6195E
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 16:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhFBQdt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 12:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhFBQds (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 12:33:48 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C7DC061574
        for <linux-tegra@vger.kernel.org>; Wed,  2 Jun 2021 09:31:48 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a11so4062221ejf.3
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 09:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xzoX1en182dWNH9Dh4NGdmjOBavoLhwx78B3jKvx1a0=;
        b=aP0o9Jtevq/ULX3WH+5b8XuVENypXjkb9TVtXkVUXKOSq6L7CzFW8vxfO+CJWvOt+t
         /h9Xamx0nPLvZlVIfp9jm6OgS/Anzj1FwsrHZ1mklfbL1gsbMBcLNt3MLbDEtPpRa+zS
         IxUPhA/xGv4Y+mTql1KuIorQDdTVWQouFVg62beX+8tqdi/ccmqKfATFYKAoaseiVWrm
         t7Q/jXYHxNX9VC2DOgy/+cD1sHhoZalM+bdWXD2BaGtvlYoN/a6ioJV0YX+P9RmhjJKF
         6APqxm8OaHR4DezuVbLeBWAUg7oim6EUfhNNv9MAMNhJ1UXs1glckLQ+vc6t1rBARoUh
         g1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xzoX1en182dWNH9Dh4NGdmjOBavoLhwx78B3jKvx1a0=;
        b=D02csVCWHnom/4Ti7eDWCwe1phHcJbgP0UMPNwKtprXwBlMDE+6J+qaEdLTuUVS6Ly
         BJPXoTB0CZyWg3Rf3N3lL6gx6XtAe7gwCUrssqGL/z4pIZJMJwkX6XMd2bYrXbN4i+2n
         aK95IdSz+JOIWUYgHODEGH+Cf8+MP1Gd7DJ5zv9axRdGcG+Gzx7sy79phlK9vnHnfD7A
         2pvTSopmbSdLl1xyYFChp4ar246Oz3Vr5B9vBPhqRh8SCcQP/7l8YndqRYO6dFAImHYt
         8vyDVO5PkFHPM/+kcAiv/2BTyNIk9WTW4hPu05FnZaFiqZghHzWeK5gmGYmiFpVNHuI8
         sXIw==
X-Gm-Message-State: AOAM533fxjwvuRCl5ijwK6uqJShGaeoIdYuETvqK/dmNrAZto0/SkxX2
        mwFtmHQ9TA5YgwzoxDEsYEU=
X-Google-Smtp-Source: ABdhPJwIRjxaEE8KtB6nZLiiVpqw1tYU3Oem8GZrMhJeOESCX10zoJYGjaIpB8VQk2DNibOP37cmfg==
X-Received: by 2002:a17:906:e44:: with SMTP id q4mr12624843eji.120.1622651507576;
        Wed, 02 Jun 2021 09:31:47 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d24sm232534edr.95.2021.06.02.09.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:31:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 08/12] memory: tegra: Make IRQ support opitonal
Date:   Wed,  2 Jun 2021 18:32:58 +0200
Message-Id: <20210602163302.120041-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602163302.120041-1-thierry.reding@gmail.com>
References: <20210602163302.120041-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Make IRQ support optional to help unify the Tegra186 memory controller
driver with this one.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- new patch

 drivers/memory/tegra/mc.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index e6c928633b12..68c6797f2707 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -750,20 +750,22 @@ static int tegra_mc_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	mc->irq = platform_get_irq(pdev, 0);
-	if (mc->irq < 0)
-		return mc->irq;
+	if (mc->soc->ops && mc->soc->ops->handle_irq) {
+		mc->irq = platform_get_irq(pdev, 0);
+		if (mc->irq < 0)
+			return mc->irq;
 
-	WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
+		WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
-	mc_writel(mc, mc->soc->intmask, MC_INTMASK);
+		mc_writel(mc, mc->soc->intmask, MC_INTMASK);
 
-	err = devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq, 0,
-			       dev_name(&pdev->dev), mc);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
-			err);
-		return err;
+		err = devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq, 0,
+				       dev_name(&pdev->dev), mc);
+		if (err < 0) {
+			dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
+				err);
+			return err;
+		}
 	}
 
 	err = tegra_mc_reset_setup(mc);
-- 
2.31.1

