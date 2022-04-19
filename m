Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31C7C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Apr 2022 14:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353412AbiDSOcE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Apr 2022 10:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353386AbiDSOb6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Apr 2022 10:31:58 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C855F38D91
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:12 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id y10so15905390ejw.8
        for <linux-tegra@vger.kernel.org>; Tue, 19 Apr 2022 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ynz+wXsaKci/uCPa0T2egAwOljY4OEI2Not830eyYso=;
        b=GlWac5GHq4bFI2oMKXg1MyPfzXSaMwipfkARfjnZ5YqX1HUSIyuw+Y4MTxwtW6Wo6y
         Lkuot2RbGwKK46iIxOBVUhx5fhUMVAKtxeAv4JRC+F2+VLuyBRGJGhUL+5OfjacMArPp
         kZiNr7sdyXvNbaVwS3ghptVeG6X4LJXm/64uwgH2S+GNSoBsq7vJLF/eUCAF26JRtNTP
         JXPHmcOy2X4E8UuGq0w9l1VogtqMBtEvDdjEvRcJ569QjhstCXoCTcstSUqCFyzTC682
         8cuopAxbp6V2apVkZliSdCoKkKL5Br9XG/SdZ6gReLbhl3tBVuEmHi6SmQ4n2mAXCVwZ
         B1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ynz+wXsaKci/uCPa0T2egAwOljY4OEI2Not830eyYso=;
        b=Y8kkCCukZS7IMsHccq9U5LQg1/Ve/ubeO+IsITiO//xVXuo5WRvYevCC+28Xz3ghUY
         ffk+RGN/uW53FdTAFGIhLcqe7WWTxJ64dO4EBDJRhj3weI8SDEqCNjQWUj0sNdfhTU8C
         RTRW3/i/e1hku1+CUGuQ8nKmWQUANU0G9Wnyxy93IFhaHuFt10VMg9LgHronUqYF/EYu
         kPy5RRrkbZGssO/xeM0CS7W2tk03A+E4SDSft4jhsLF3/7Pj+Ge3/iOxoNN095x7dgbI
         eG3NkS8v3a8gXbg7U86t4+Bg/Wl7ndy2G7YJLyCY/3wXM1ZEZtAywRFZaKUJZMhrLiKf
         lN1g==
X-Gm-Message-State: AOAM531K+ydmnkYxTNak4SLisHp2XBg36dfBtBQsEzjbVzQh6c28px7j
        ksn4Srqeae+uy0P6yR2Oi0zrHQ==
X-Google-Smtp-Source: ABdhPJyAwjk70JTjJB+moeKuDW1E4dkWfB+u4jhaJ0VsVEhrDbhVshcuFYPOkdMHO3UzR71ZTSm85w==
X-Received: by 2002:a17:906:d10c:b0:6cd:4aa2:cd62 with SMTP id b12-20020a170906d10c00b006cd4aa2cd62mr13605827ejz.229.1650378551397;
        Tue, 19 Apr 2022 07:29:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906b10a00b006e1004406easm5761884ejy.93.2022.04.19.07.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 07:29:10 -0700 (PDT)
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
Subject: [PATCH 4/7] memory: ti-emif-pm: simplify platform_get_resource()
Date:   Tue, 19 Apr 2022 16:28:56 +0200
Message-Id: <20220419142859.380566-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220419142859.380566-1-krzysztof.kozlowski@linaro.org>
References: <20220419142859.380566-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use devm_platform_get_and_ioremap_resource() instead of
platform_get_resource() and devm_ioremap_resource().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/ti-emif-pm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
index 179fec2da56d..31d6266f008c 100644
--- a/drivers/memory/ti-emif-pm.c
+++ b/drivers/memory/ti-emif-pm.c
@@ -290,9 +290,9 @@ static int ti_emif_probe(struct platform_device *pdev)
 
 	emif_data->pm_data.ti_emif_sram_config = (unsigned long)match->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	emif_data->pm_data.ti_emif_base_addr_virt = devm_ioremap_resource(dev,
-									  res);
+	emif_data->pm_data.ti_emif_base_addr_virt = devm_platform_get_and_ioremap_resource(pdev,
+											   0,
+											   &res);
 	if (IS_ERR(emif_data->pm_data.ti_emif_base_addr_virt)) {
 		ret = PTR_ERR(emif_data->pm_data.ti_emif_base_addr_virt);
 		return ret;
-- 
2.32.0

