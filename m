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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF772C3526C
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 09:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ECA5233FB
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 09:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgLQJqL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 04:46:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbgLQJqJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 04:46:09 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12270C061282;
        Thu, 17 Dec 2020 01:44:52 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 23so55726009lfg.10;
        Thu, 17 Dec 2020 01:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/s4t43r0ZZzvJjdsYSRYc856yAM0pnhvAjXcUu6QCA=;
        b=dRENPnv+ikaVpieNnDU20D7qfSOhPYY+wbnBSMz1+Jc2XW0ELkR52BRzs5TZwiGoRP
         f+PIbNmLFaIhLBwTQI+kM/uxPS2RIqVaHArU7p5fj22et2dK80Abgs2kthZk382hlvBD
         Of87MSIvISm17S894HqhCluKHy/fyg7BGjddw0IVCAUf+C5ODERg9CDlQPysANoMfLfe
         ciick7b85GvxJkU0zj8Aklu+xb6N/ePIFKS8HbBM8btUbgMOvj3d92Wyqe/QNxHOjK2t
         jS6Eh26U89/uXPNmoDyA8pWNjN4545+At+Qdt5jw75awASfVRYjRnBpvKofQR5tenAOc
         PrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/s4t43r0ZZzvJjdsYSRYc856yAM0pnhvAjXcUu6QCA=;
        b=qKBDXB5y8Xs56povMk4DrZovN6cnSNkv4PWo2igTdWh5iqe3Eltwxy9z6zTZIbXVhk
         uQszFStn9/q2O0LKLshrHyyCy8WZ6MIqxF5PPW5Ove/nssRZ1oCtprYSSqs2/uNl39T8
         ji6DoGuRZaYA+rp6hf2a6vOpX5jIF5VXN4se9k+HHBOaV6wxugVxwMje4boEQywhurIO
         TMRV6y+9gPIRbgqe0o9iCzKiepJkg9aM/UCbQQH8ETJhLm01e2aRmHJStSVcSLFNc9F/
         vEfyIFV1ei3KoTcoPs+sqBo3OZJShJtamHGbd8NbdRq+XaebLD8e+glE5evamzGNCV5u
         uY0g==
X-Gm-Message-State: AOAM532zl0qmol0VnWdV5Dn3sBWGwUQmzuMcsVum7lRO1IzQU4dNm6Vh
        n8/3tn4z3HBDlmrUUUEBA2V24pbIp0w=
X-Google-Smtp-Source: ABdhPJw0LJkHrokp8cROfnvyA7/o23AZJJ/5JYUXFgzxGISfM80Hqh1RO8T/b7nP4Z2z/+wonV/I7Q==
X-Received: by 2002:ac2:4a65:: with SMTP id q5mr7862348lfp.320.1608198290433;
        Thu, 17 Dec 2020 01:44:50 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u19sm613917lji.2.2020.12.17.01.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 01:44:50 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, Ion Agorria <ion@agorria.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] usb: chipidea: tegra: Rename UDC to USB
Date:   Thu, 17 Dec 2020 12:40:03 +0300
Message-Id: <20201217094007.19336-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094007.19336-1-digetx@gmail.com>
References: <20201217094007.19336-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Rename all occurrences in the code from "udc" to "usb" and change the
Kconfig entry in order to show that this driver supports USB modes other
than device-only mode. The follow up patch will add host-mode support and
it will be cleaner to perform the renaming separately, i.e. in this patch.

Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/Kconfig         |  2 +-
 drivers/usb/chipidea/ci_hdrc_tegra.c | 78 ++++++++++++++--------------
 2 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index 8bafcfc6080d..8685ead6ccc7 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -53,7 +53,7 @@ config USB_CHIPIDEA_GENERIC
 	default USB_CHIPIDEA
 
 config USB_CHIPIDEA_TEGRA
-	tristate "Enable Tegra UDC glue driver" if EMBEDDED
+	tristate "Enable Tegra USB glue driver" if EMBEDDED
 	depends on OF
 	depends on USB_CHIPIDEA_UDC
 	default USB_CHIPIDEA
diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 10eaaba2a3f0..d8efa80aa1c2 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -12,7 +12,7 @@
 
 #include "ci.h"
 
-struct tegra_udc {
+struct tegra_usb {
 	struct ci_hdrc_platform_data data;
 	struct platform_device *dev;
 
@@ -20,15 +20,15 @@ struct tegra_udc {
 	struct clk *clk;
 };
 
-struct tegra_udc_soc_info {
+struct tegra_usb_soc_info {
 	unsigned long flags;
 };
 
-static const struct tegra_udc_soc_info tegra_udc_soc_info = {
+static const struct tegra_usb_soc_info tegra_udc_soc_info = {
 	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
 };
 
-static const struct of_device_id tegra_udc_of_match[] = {
+static const struct of_device_id tegra_usb_of_match[] = {
 	{
 		.compatible = "nvidia,tegra20-udc",
 		.data = &tegra_udc_soc_info,
@@ -45,16 +45,16 @@ static const struct of_device_id tegra_udc_of_match[] = {
 		/* sentinel */
 	}
 };
-MODULE_DEVICE_TABLE(of, tegra_udc_of_match);
+MODULE_DEVICE_TABLE(of, tegra_usb_of_match);
 
-static int tegra_udc_probe(struct platform_device *pdev)
+static int tegra_usb_probe(struct platform_device *pdev)
 {
-	const struct tegra_udc_soc_info *soc;
-	struct tegra_udc *udc;
+	const struct tegra_usb_soc_info *soc;
+	struct tegra_usb *usb;
 	int err;
 
-	udc = devm_kzalloc(&pdev->dev, sizeof(*udc), GFP_KERNEL);
-	if (!udc)
+	usb = devm_kzalloc(&pdev->dev, sizeof(*usb), GFP_KERNEL);
+	if (!usb)
 		return -ENOMEM;
 
 	soc = of_device_get_match_data(&pdev->dev);
@@ -63,69 +63,69 @@ static int tegra_udc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
-	if (IS_ERR(udc->phy)) {
-		err = PTR_ERR(udc->phy);
+	usb->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
+	if (IS_ERR(usb->phy)) {
+		err = PTR_ERR(usb->phy);
 		dev_err(&pdev->dev, "failed to get PHY: %d\n", err);
 		return err;
 	}
 
-	udc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(udc->clk)) {
-		err = PTR_ERR(udc->clk);
+	usb->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(usb->clk)) {
+		err = PTR_ERR(usb->clk);
 		dev_err(&pdev->dev, "failed to get clock: %d\n", err);
 		return err;
 	}
 
-	err = clk_prepare_enable(udc->clk);
+	err = clk_prepare_enable(usb->clk);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable clock: %d\n", err);
 		return err;
 	}
 
 	/* setup and register ChipIdea HDRC device */
-	udc->data.name = "tegra-udc";
-	udc->data.flags = soc->flags;
-	udc->data.usb_phy = udc->phy;
-	udc->data.capoffset = DEF_CAPOFFSET;
-
-	udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
-				      pdev->num_resources, &udc->data);
-	if (IS_ERR(udc->dev)) {
-		err = PTR_ERR(udc->dev);
+	usb->data.name = "tegra-usb";
+	usb->data.flags = soc->flags;
+	usb->data.usb_phy = usb->phy;
+	usb->data.capoffset = DEF_CAPOFFSET;
+
+	usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
+				      pdev->num_resources, &usb->data);
+	if (IS_ERR(usb->dev)) {
+		err = PTR_ERR(usb->dev);
 		dev_err(&pdev->dev, "failed to add HDRC device: %d\n", err);
 		goto fail_power_off;
 	}
 
-	platform_set_drvdata(pdev, udc);
+	platform_set_drvdata(pdev, usb);
 
 	return 0;
 
 fail_power_off:
-	clk_disable_unprepare(udc->clk);
+	clk_disable_unprepare(usb->clk);
 	return err;
 }
 
-static int tegra_udc_remove(struct platform_device *pdev)
+static int tegra_usb_remove(struct platform_device *pdev)
 {
-	struct tegra_udc *udc = platform_get_drvdata(pdev);
+	struct tegra_usb *usb = platform_get_drvdata(pdev);
 
-	ci_hdrc_remove_device(udc->dev);
-	clk_disable_unprepare(udc->clk);
+	ci_hdrc_remove_device(usb->dev);
+	clk_disable_unprepare(usb->clk);
 
 	return 0;
 }
 
-static struct platform_driver tegra_udc_driver = {
+static struct platform_driver tegra_usb_driver = {
 	.driver = {
-		.name = "tegra-udc",
-		.of_match_table = tegra_udc_of_match,
+		.name = "tegra-usb",
+		.of_match_table = tegra_usb_of_match,
 	},
-	.probe = tegra_udc_probe,
-	.remove = tegra_udc_remove,
+	.probe = tegra_usb_probe,
+	.remove = tegra_usb_remove,
 };
-module_platform_driver(tegra_udc_driver);
+module_platform_driver(tegra_usb_driver);
 
-MODULE_DESCRIPTION("NVIDIA Tegra USB device mode driver");
+MODULE_DESCRIPTION("NVIDIA Tegra USB driver");
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.29.2

