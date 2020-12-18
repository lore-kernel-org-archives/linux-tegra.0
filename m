Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7C3C2BBD5
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CED023A5B
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgLRMMc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Dec 2020 07:12:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgLRMMT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Dec 2020 07:12:19 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BCEC061257;
        Fri, 18 Dec 2020 04:11:33 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o13so4892180lfr.3;
        Fri, 18 Dec 2020 04:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8UqzgAUvRyCbJv6AmahHgIq+N+dcP215KzTyHyBHVRE=;
        b=lAdEj3KC24DNljp7rWe0ay1/0Ln3EVGvORGgEpWVal7BYgGv8JzjP+1TRWCVYR2M4Y
         Nj5zukASKARakSXZesqepIl40Q5ag37+GFnYsaNBb3bHTsFk5ou9Ho6e8C04L6Fbd+ba
         +zaGLWNmKbfXewhsy03SR0aSGKo2wWnDuZ1cyqeLjE3nd/+yRT/ddC6/BhbBTWHS1iZ1
         hp0XmQKHDFo1Zj7gM7d92a/ZdJtONCGcXLflwx/4CfcccicnWoe7n23FznkOzuk2ubIY
         PeppWp84ITnxEWli8l0GKXe51ns5J5lxFeKRRQ/8hGMMBpCUpWy2Nq+b2z9sNluwJSFh
         jdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8UqzgAUvRyCbJv6AmahHgIq+N+dcP215KzTyHyBHVRE=;
        b=PgSR/mEnXQsBnCIQs/Pz1SLXHpKd9JR+iS107SUig2xzEci9WzU137K8qAoKGlHN8Q
         JGdWPyLztYJb+r/VPOprYyfBFcKv0rDjDxzVpz+cXmJ6lqQELPhXPQbUrj+VpCQYaPuA
         wDGv0dqWG9RWJYkUEs+Z/Zij5AwQscRze3vsbny3w65/Emgb7VXrpApxil1KiBfxYCRy
         TmYiZMks0M2hqCXi0mw/rOS5h+fsYLtBi9VmYuHh0xK5Pe4NW+5AvV7QiecvOwghuDIS
         hwPgPwvoDX1wA1h9cxpilj/ousoVCEV0iiLoTCz96FdUmaiQJjJb0/6bk/LpTJiYoQFI
         aOWA==
X-Gm-Message-State: AOAM531W6hl/9lW9kaRaDQnCrMfS/lT42szMXoRGYCyG6zD+aLWxYLMa
        1IQSso0PM9HqPVvHulAmQyA=
X-Google-Smtp-Source: ABdhPJwmYRk+6Y+mChel9HufYeaNuMKP4y52b1tu3L4Q+h5NRuUcNgIStFS691AnE6TedVYMFslBqg==
X-Received: by 2002:a19:c20a:: with SMTP id l10mr1341249lfc.155.1608293491809;
        Fri, 18 Dec 2020 04:11:31 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id i9sm1036472ljn.18.2020.12.18.04.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 04:11:31 -0800 (PST)
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
Subject: [PATCH v3 4/9] usb: chipidea: tegra: Rename UDC to USB
Date:   Fri, 18 Dec 2020 15:02:41 +0300
Message-Id: <20201218120246.7759-5-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218120246.7759-1-digetx@gmail.com>
References: <20201218120246.7759-1-digetx@gmail.com>
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
Acked-by: Thierry Reding <treding@nvidia.com>
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

