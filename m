Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AE4C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Apr 2022 14:29:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353379AbiDSOcD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Apr 2022 10:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353373AbiDSOb5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Apr 2022 10:31:57 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B718638BC8
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:11 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id g13so5586567ejb.4
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9ycsKLgtbrDvPBZQp/V5BOPcgPxcbdE+L/fSZOvoL1k=;
        b=mWcZfCB9WwT4sr/dCQ2dVSMQVrpi4j9AimPSecRSrzqvvjRTU563LgPuYfkU2X9yft
         hlsSwlKSs6VX85oXN5CqAvuueaVEeZhLiWDWRTeSyDTwQhA3fOoUd+5NwMFBz8xlIo8z
         46RKukuYuQ5uSAFP/1X7aMxIYLdc+4oIImo0oSFqHxhlpV5RI/AMAqWMXM3cO1HdtYh1
         69ZNh37WQt3Z/Bm90OQcVMH/DTknE7Bc3xiTRG8dHwuTxi2+fToBsMw7o4y+xpEGNYO0
         xdMPWXNjGKbcHIlxTWY1ElZnPH1jiSZPHnYN25Fhl3b21iwnvqHyHsEWpsb6SFsqfiCW
         SoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ycsKLgtbrDvPBZQp/V5BOPcgPxcbdE+L/fSZOvoL1k=;
        b=4mCW9e1RiJR61tHZfWAzc5GJ8lkCWxUaP+lNj2U/rN98kgKz79O5jFDHhVUuFurGiC
         TKm9mR79OGrmuXi/KewtfUox2fFFBAc0Hnh93VBue5P4YshNpdwIPSLGNPt1Yl3T33eA
         zMf+37JND7zGTCrp8nfmFNSCDmFfohTFT4LwUjVt7KYXrOgQ0+mf2oytwvpnIpwINj39
         M0X8tDnkTuQToHza2PPF5UZaCkI4FAgiHvt4EjpaJUwlGQ00jXG055IGj9pTr2Elcl87
         +FT3+xUyZcr3omVVvmcrlk4siZCBVWWhDYnb1BzGWYs1yyK1TtvYAnkJy3BHdsg/E5zE
         b58Q==
X-Gm-Message-State: AOAM531AsNlR4D/sdKWOjgeJqjlxo8qsqr3dQ1EpRXoNikqiZZuXZ21z
        iZj17xg7PGDCXEOtTHdU2qYALQ==
X-Google-Smtp-Source: ABdhPJxtgiL8brvjHKi1NQt223Se/3569MkYsfsTAdEFzWH0xdJ13oU15IQOKY5xU3fQRfK57x2OFQ==
X-Received: by 2002:a17:906:c10e:b0:6ef:8d09:bffd with SMTP id do14-20020a170906c10e00b006ef8d09bffdmr11125816ejc.135.1650378550281;
        Tue, 19 Apr 2022 07:29:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906b10a00b006e1004406easm5761884ejy.93.2022.04.19.07.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 07:29:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Markus Mayer <mmayer@broadcom.com>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/7] memory: ti-emif: simplify platform_get_resource()
Date:   Tue, 19 Apr 2022 16:28:55 +0200
Message-Id: <20220419142859.380566-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419142859.380566-1-krzysztof.kozlowski@linaro.org>
References: <20220419142859.380566-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use devm_platform_ioremap_resource() instead of platform_get_resource()
and devm_ioremap_resource().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/ti-aemif.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index 51d20c2ccb75..f81e7df8798a 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -328,7 +328,6 @@ static int aemif_probe(struct platform_device *pdev)
 {
 	int i;
 	int ret = -ENODEV;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *child_np;
@@ -362,8 +361,7 @@ static int aemif_probe(struct platform_device *pdev)
 	else if (pdata)
 		aemif->cs_offset = pdata->cs_offset;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	aemif->base = devm_ioremap_resource(dev, res);
+	aemif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(aemif->base)) {
 		ret = PTR_ERR(aemif->base);
 		goto error;
-- 
2.32.0

