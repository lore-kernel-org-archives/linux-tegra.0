Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED47C433DF
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:22:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D20423117
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:22:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAfb3QXn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgHFQVo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 12:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgHFQTs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 12:19:48 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC5DC002163;
        Thu,  6 Aug 2020 09:04:24 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id i26so32215315edv.4;
        Thu, 06 Aug 2020 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wvtR8z/Ani5mL9lIVRm1/m2dHqQzOTsxvy15+fulIQ4=;
        b=hAfb3QXnetMzCCM6f0K5d7xWLZ6od+HWfvETq9oP8nHvptxq3CDGNLE4MnlTbhwyF9
         ZN8V6Iv7hVqo7e/MCYY56K/4B0S1y60LQSCeA22qnLbWJXOA2DVY8SR/jnkbwPSQ4h2n
         04nHcT9UsgxDQbukf/yuBS/Vjbcrav/jl/MpoXsVaSdNSLm4cNbaYYn61tWtCnSZdVV8
         1c2lJVeDgBKdQePAHclpWJm/L19thSYwOLepxoSQV9dRct/WDl/BojHn1I4HcJ3x9HAl
         Wc6wgfzZE3r2Zxyn6t0lsrasl4heCRVc+Q0E7qk1TMrgSOwC0gJAYyAJEd9oyzY3+gu+
         qZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wvtR8z/Ani5mL9lIVRm1/m2dHqQzOTsxvy15+fulIQ4=;
        b=TZbM6hqOlUijjRRyGEnxyM7sWGv4dhe+zCQ5FeAuM6/qu1MJ5UpaZLXScfYTkiiuEU
         Yu7baGrbV0EAS4LPs/ia4s+W8M3F5zHIvcPJeL/e0xogU87OWWfRRBUirpAfruKb73uB
         hoomHNqLBt+9hnwWBASF1PRKT0OWHgiWOGLimCJatKzTVjJPNDahGcM4ka47/1X3P3tE
         H9F8sMgslJbVpts3NBQLrLY77sC3yWfN3UyCX1lUT1UGKwcvmKjVll7cPT19KQEREbRY
         jGlDbX1UzGUUH2gF/XkS2x6oRRpVzB6vPQ3Udg649f4YrFr90Cfv1F/wrPZNWoJ/7xmK
         Ag2Q==
X-Gm-Message-State: AOAM533T1BnscrHVfWe1usJOYvi5n6/v1atn+4deP0GoyPXUSGng9I9p
        QG4RClff1Fm8lYYZPHQxf2k=
X-Google-Smtp-Source: ABdhPJzIJ39IJgxEOhLOrwxk39vBOFHtszT0/siZj26nK2C1VupKiiAtm8wZXygdL+ZjCs7khoW4aw==
X-Received: by 2002:aa7:db51:: with SMTP id n17mr3829923edt.222.1596729863006;
        Thu, 06 Aug 2020 09:04:23 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id dc23sm3438405edb.50.2020.08.06.09.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 09:04:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] usb: gadget: tegra-xudc: Properly align parameters
Date:   Thu,  6 Aug 2020 18:04:16 +0200
Message-Id: <20200806160417.3937056-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806160417.3937056-1-thierry.reding@gmail.com>
References: <20200806160417.3937056-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Align parameters on subsequent lines with the parameters on the first
line for consistency.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index ec43081f15bd..838863ede1df 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3692,8 +3692,7 @@ static int tegra_xudc_powerdomain_init(struct tegra_xudc *xudc)
 	struct device *dev = xudc->dev;
 	int err;
 
-	xudc->genpd_dev_device = dev_pm_domain_attach_by_name(dev,
-								"dev");
+	xudc->genpd_dev_device = dev_pm_domain_attach_by_name(dev, "dev");
 	if (IS_ERR(xudc->genpd_dev_device)) {
 		err = PTR_ERR(xudc->genpd_dev_device);
 		dev_err(dev, "failed to get device power domain: %d\n", err);
@@ -3708,16 +3707,16 @@ static int tegra_xudc_powerdomain_init(struct tegra_xudc *xudc)
 	}
 
 	xudc->genpd_dl_device = device_link_add(dev, xudc->genpd_dev_device,
-					       DL_FLAG_PM_RUNTIME |
-					       DL_FLAG_STATELESS);
+						DL_FLAG_PM_RUNTIME |
+						DL_FLAG_STATELESS);
 	if (!xudc->genpd_dl_device) {
 		dev_err(dev, "failed to add USB device link\n");
 		return -ENODEV;
 	}
 
 	xudc->genpd_dl_ss = device_link_add(dev, xudc->genpd_dev_ss,
-					     DL_FLAG_PM_RUNTIME |
-					     DL_FLAG_STATELESS);
+					    DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_STATELESS);
 	if (!xudc->genpd_dl_ss) {
 		dev_err(dev, "failed to add SuperSpeed device link\n");
 		return -ENODEV;
@@ -3772,16 +3771,15 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	xudc->clks = devm_kcalloc(&pdev->dev, xudc->soc->num_clks,
-				      sizeof(*xudc->clks), GFP_KERNEL);
+	xudc->clks = devm_kcalloc(&pdev->dev, xudc->soc->num_clks, sizeof(*xudc->clks),
+				  GFP_KERNEL);
 	if (!xudc->clks)
 		return -ENOMEM;
 
 	for (i = 0; i < xudc->soc->num_clks; i++)
 		xudc->clks[i].id = xudc->soc->clock_names[i];
 
-	err = devm_clk_bulk_get(&pdev->dev, xudc->soc->num_clks,
-				      xudc->clks);
+	err = devm_clk_bulk_get(&pdev->dev, xudc->soc->num_clks, xudc->clks);
 	if (err) {
 		dev_err(xudc->dev, "failed to request clocks: %d\n", err);
 		return err;
-- 
2.27.0

