Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CECC433DF
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:48:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ADA8206C3
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pg3dkv4M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbgHFRsg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgHFQfR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 12:35:17 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F89CC002162;
        Thu,  6 Aug 2020 09:04:22 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id b18so4400185edv.10;
        Thu, 06 Aug 2020 09:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZTh0PB6PtKkLmDSXAVhkUVZ2z542iKjjb2bge0x2uk=;
        b=pg3dkv4MzAI4Vu5ecucgFGw78gwbzmI6iFNufzUy2Y9bX4U+MpEOvwWztz/Kr7NOpu
         xtpjEUtJroaxQvp3Wyi5+D8C4VEfvJb0UTXMBshW76X9ox4sp+KuoPobM/0tJMW+COjX
         2cJ1jHU9SESSA77GtlVxxauA1toSZHcaEfJ6sf77ihymwZ5ecD+W6fsyN3RmpnIG8J0l
         Fxyy7FGyHYIgGv8YnfUIjgUOln56C/xs9Laon1VIVux7pkSZn8LFx/IjZH6HYhnPdxNA
         973wA7+KuPyRFjtGEzITS2phpbPrIme1DqwooH+sCogjL/f5fPbY3voQvcDopdAYr425
         +QcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZTh0PB6PtKkLmDSXAVhkUVZ2z542iKjjb2bge0x2uk=;
        b=o90kZ3ov1bFQzhUM8ur2e35doBjJ/W4u88XjzteS1r2H2BqR/QYV7+5j20w9ik5rzs
         NkReO0Pr8dyUs4BBqw3tQ0PjjwmwDxcXczsPHd+AmzxBq1Xgw0ScU/4BCm3xz6NQVEda
         VAJPwYXKYaTwpR/k6/MGjX/Tbw0+hmmGvhWStSihUqoLWNAuaudx4tHe8wywTTLgnnBa
         FKuEtr4lN6gmrN0D4kwu3Ki6rkyEvz2THivVAV5rs0CEL0YUu/fCm/nGm2ilXJbJW7+i
         DJI0OWWNLd98/iEEdS/aAURI4NmUMmqg/60vAkFcVosQWTwumMgtN3q8YF/Gr3sbhdZK
         5LeA==
X-Gm-Message-State: AOAM532wfsx2CTsAI11VqPWreCVCXaCHJLmJEdUGUIKeNn9qIYfAd5b3
        TQ8OZvrsmU4PPx4eIrhLBKA=
X-Google-Smtp-Source: ABdhPJzSfarPrINxyfBxN7O8FB+1XmqNpoBkjHDOIgn+Hcw4GEthMJtAUMIwNZblwph/Ue9nS5ik0g==
X-Received: by 2002:a50:ba84:: with SMTP id x4mr4954155ede.282.1596729860361;
        Thu, 06 Aug 2020 09:04:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bx22sm4051834ejc.18.2020.08.06.09.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 09:04:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] usb: gadget: tegra-xudc: Use consistent spelling and formatting
Date:   Thu,  6 Aug 2020 18:04:15 +0200
Message-Id: <20200806160417.3937056-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Make sure to use consistent spelling and formatting in error messages.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index d6ff68c06911..ec43081f15bd 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -705,11 +705,11 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 
 	err = phy_power_on(xudc->curr_utmi_phy);
 	if (err < 0)
-		dev_err(xudc->dev, "utmi power on failed %d\n", err);
+		dev_err(xudc->dev, "UTMI power on failed: %d\n", err);
 
 	err = phy_power_on(xudc->curr_usb3_phy);
 	if (err < 0)
-		dev_err(xudc->dev, "usb3 phy power on failed %d\n", err);
+		dev_err(xudc->dev, "USB3 PHY power on failed: %d\n", err);
 
 	dev_dbg(xudc->dev, "device mode on\n");
 
@@ -759,11 +759,11 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 
 	err = phy_power_off(xudc->curr_utmi_phy);
 	if (err < 0)
-		dev_err(xudc->dev, "utmi_phy power off failed %d\n", err);
+		dev_err(xudc->dev, "UTMI PHY power off failed: %d\n", err);
 
 	err = phy_power_off(xudc->curr_usb3_phy);
 	if (err < 0)
-		dev_err(xudc->dev, "usb3_phy power off failed %d\n", err);
+		dev_err(xudc->dev, "USB3 PHY power off failed: %d\n", err);
 
 	pm_runtime_put(xudc->dev);
 }
@@ -1539,7 +1539,7 @@ static int __tegra_xudc_ep_set_halt(struct tegra_xudc_ep *ep, bool halt)
 		return -EINVAL;
 
 	if (usb_endpoint_xfer_isoc(ep->desc)) {
-		dev_err(xudc->dev, "can't halt isoc EP\n");
+		dev_err(xudc->dev, "can't halt isochronous EP\n");
 		return -ENOTSUPP;
 	}
 
@@ -1788,7 +1788,7 @@ static int __tegra_xudc_ep_enable(struct tegra_xudc_ep *ep,
 
 	if (usb_endpoint_xfer_isoc(desc)) {
 		if (xudc->nr_isoch_eps > XUDC_MAX_ISOCH_EPS) {
-			dev_err(xudc->dev, "too many isoch endpoints\n");
+			dev_err(xudc->dev, "too many isochronous endpoints\n");
 			return -EBUSY;
 		}
 		xudc->nr_isoch_eps++;
@@ -3509,7 +3509,7 @@ static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 		if (IS_ERR(xudc->utmi_phy[i])) {
 			err = PTR_ERR(xudc->utmi_phy[i]);
 			if (err != -EPROBE_DEFER)
-				dev_err(xudc->dev, "failed to get usb2-%d phy: %d\n",
+				dev_err(xudc->dev, "failed to get usb2-%d PHY: %d\n",
 					i, err);
 
 			goto clean_up;
@@ -3539,12 +3539,12 @@ static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 		if (IS_ERR(xudc->usb3_phy[i])) {
 			err = PTR_ERR(xudc->usb3_phy[i]);
 			if (err != -EPROBE_DEFER)
-				dev_err(xudc->dev, "failed to get usb3-%d phy: %d\n",
+				dev_err(xudc->dev, "failed to get usb3-%d PHY: %d\n",
 					usb3, err);
 
 			goto clean_up;
 		} else if (xudc->usb3_phy[i])
-			dev_dbg(xudc->dev, "usb3_phy-%d registered", usb3);
+			dev_dbg(xudc->dev, "usb3-%d PHY registered", usb3);
 	}
 
 	return err;
@@ -3577,13 +3577,13 @@ static int tegra_xudc_phy_init(struct tegra_xudc *xudc)
 	for (i = 0; i < xudc->soc->num_phys; i++) {
 		err = phy_init(xudc->utmi_phy[i]);
 		if (err < 0) {
-			dev_err(xudc->dev, "utmi phy init failed: %d\n", err);
+			dev_err(xudc->dev, "UTMI PHY #%u initialization failed: %d\n", i, err);
 			goto exit_phy;
 		}
 
 		err = phy_init(xudc->usb3_phy[i]);
 		if (err < 0) {
-			dev_err(xudc->dev, "usb3 phy init failed: %d\n", err);
+			dev_err(xudc->dev, "USB3 PHY #%u initialization failed: %d\n", i, err);
 			goto exit_phy;
 		}
 	}
@@ -3696,14 +3696,14 @@ static int tegra_xudc_powerdomain_init(struct tegra_xudc *xudc)
 								"dev");
 	if (IS_ERR(xudc->genpd_dev_device)) {
 		err = PTR_ERR(xudc->genpd_dev_device);
-		dev_err(dev, "failed to get dev pm-domain: %d\n", err);
+		dev_err(dev, "failed to get device power domain: %d\n", err);
 		return err;
 	}
 
 	xudc->genpd_dev_ss = dev_pm_domain_attach_by_name(dev, "ss");
 	if (IS_ERR(xudc->genpd_dev_ss)) {
 		err = PTR_ERR(xudc->genpd_dev_ss);
-		dev_err(dev, "failed to get superspeed pm-domain: %d\n", err);
+		dev_err(dev, "failed to get SuperSpeed power domain: %d\n", err);
 		return err;
 	}
 
@@ -3711,7 +3711,7 @@ static int tegra_xudc_powerdomain_init(struct tegra_xudc *xudc)
 					       DL_FLAG_PM_RUNTIME |
 					       DL_FLAG_STATELESS);
 	if (!xudc->genpd_dl_device) {
-		dev_err(dev, "adding usb device device link failed!\n");
+		dev_err(dev, "failed to add USB device link\n");
 		return -ENODEV;
 	}
 
@@ -3719,7 +3719,7 @@ static int tegra_xudc_powerdomain_init(struct tegra_xudc *xudc)
 					     DL_FLAG_PM_RUNTIME |
 					     DL_FLAG_STATELESS);
 	if (!xudc->genpd_dl_ss) {
-		dev_err(dev, "adding superspeed device link failed!\n");
+		dev_err(dev, "failed to add SuperSpeed device link\n");
 		return -ENODEV;
 	}
 
@@ -3783,7 +3783,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	err = devm_clk_bulk_get(&pdev->dev, xudc->soc->num_clks,
 				      xudc->clks);
 	if (err) {
-		dev_err(xudc->dev, "failed to request clks %d\n", err);
+		dev_err(xudc->dev, "failed to request clocks: %d\n", err);
 		return err;
 	}
 
@@ -3798,7 +3798,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	err = devm_regulator_bulk_get(&pdev->dev, xudc->soc->num_supplies,
 				      xudc->supplies);
 	if (err) {
-		dev_err(xudc->dev, "failed to request regulators %d\n", err);
+		dev_err(xudc->dev, "failed to request regulators: %d\n", err);
 		return err;
 	}
 
@@ -3808,7 +3808,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 
 	err = regulator_bulk_enable(xudc->soc->num_supplies, xudc->supplies);
 	if (err) {
-		dev_err(xudc->dev, "failed to enable regulators %d\n", err);
+		dev_err(xudc->dev, "failed to enable regulators: %d\n", err);
 		goto put_padctl;
 	}
 
-- 
2.27.0

