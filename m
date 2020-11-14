Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E05C56202
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 05:12:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C28402224B
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 05:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lzqavm43"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgKNFMY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 14 Nov 2020 00:12:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgKNFMY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 14 Nov 2020 00:12:24 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02477C0613D1;
        Fri, 13 Nov 2020 21:12:22 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id u21so11940091iol.12;
        Fri, 13 Nov 2020 21:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=gtE7v8R23ONG3wyW0qkppRKJYqB5/6b5dCRXeLgbCZU=;
        b=Lzqavm43iC9RJtZzb4LbBKg9FFozqATEIkv4A0u7XK0RzhCQsXofj2PCDw4aXbLwkU
         PsrLZWzfxFLWAsBeVLy1cOllziZ6H/jvoYWN4K1+zBMKAZ4EKiQQUZ3kmhg9UIMhOON+
         0EVYp7QT5l36Qt7ltH+k+m7IvR9WlkW5b8ptTdzZiHCdlJNleuuCf8BIDip0jaKsn23x
         oaMeeBM93FP+p7y7cGE4W9O6/GcH7IMwrmBIMNDP9Ka/cnGHEb12Kod3viB4VKW89q1s
         pdxXpMniTL4kQ3lK8zs1vtKmzsucJnKoPixK8nECrej7gC1W82Xrdnwn2hlmce+J1mhD
         B5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=gtE7v8R23ONG3wyW0qkppRKJYqB5/6b5dCRXeLgbCZU=;
        b=DJe0R7dWAcNXgfi5ZXknoPBtzckgyb7uMhDLJahdfXcZboKVfLZUjbCfUAW4PFidwK
         5tKVg/uje1tNi2s8rDzH19i81Ej8LcdmNcP6+tCnj+VRCO5V1+wYwanBuew3mGWgryqi
         KCKkTorFIjBeNhAcdMdHfkprru/5yFFxqpBR9ZluWAnKkGQZV4yB6ytK8KWDd5loXwui
         OI0xmW+udQMgsRpymN40b8H6nNTMOwqlS4YLcWrYx+kqBT1esSaClMA4Lqti0awzSMcS
         eBMZrOG7Aa8GsjU2Wmsec1h48/4hlb0/B8ZydKKtb4SX6iHgEv34+sZKY5JJWOAAhc6h
         wv1Q==
X-Gm-Message-State: AOAM531kBdVWoV2y2fXsCt9LqL51/gFhHP/nmYwoPgwlJDYWWSGqLoqT
        kLYJkiodRoxjMFTU75qipb4=
X-Google-Smtp-Source: ABdhPJxft6JBkR7yyX//1QmlXFa4W0czs2P8kJoxizaUe4TJZsZLBAWCY8WUIwOBITt/7uXrMQbFyw==
X-Received: by 2002:a05:6638:508:: with SMTP id i8mr4558952jar.5.1605330742310;
        Fri, 13 Nov 2020 21:12:22 -0800 (PST)
Received: from fedora-project ([195.181.168.216])
        by smtp.gmail.com with ESMTPSA id y6sm3450684iob.48.2020.11.13.21.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 21:12:21 -0800 (PST)
Date:   Sat, 14 Nov 2020 00:12:19 -0500
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     krzk@kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] memory: tegra20-emc: remove redundant error message
Message-ID: <20201114051219.GA4746@fedora-project>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is no need for dev_err() since irq already prints an error. 
Eliminate unnecessary curly braces for single statement block.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 5e10aa97809f..181a360d7d6b 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -959,10 +959,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	int irq, err;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "please update your device tree\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
 	if (!emc)
-- 
2.28.0

