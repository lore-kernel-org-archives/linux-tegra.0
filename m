Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8BEC433E5
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A96E161A26
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhCYQl6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhCYQlf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:41:35 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010B7C06174A;
        Thu, 25 Mar 2021 09:41:35 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso3466779wmi.3;
        Thu, 25 Mar 2021 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M7/JLbQJjUSymQX4uhScOBeXFiJb3pKiltILERb+d5I=;
        b=M9HnA5WWjzJNuB/7uB5CtL4EUy7cJyJNnYQjmW5dRwzoXBsbP5CP6uoymTGta3ZNzB
         MRN9pYs17bo81ZqAq15s04ecIIQsQcngvtv9xyOqleoLLcv0kCEW+c1EI6gZdi2qwLGh
         FioDUR9SkFyk7MPNTKd5sqZLX3WvTZzHqRCIgRcA0jGvp2zGxnCnc6BAbmNsz2CU199L
         an/ae2YrfJRcXIfqs68iUkA4WRHr1+5ZIxUSHW5bj3aRarW7yzt4cdC+xkI4q5QA0uq+
         ra3KLXgLHl8wt7loNiBmjZa7KBQAo8k0xqlvg0SvEkSYUaacr7zIANsuuzQkPgHawfdQ
         cy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M7/JLbQJjUSymQX4uhScOBeXFiJb3pKiltILERb+d5I=;
        b=MZJSmAtrPR2J77KzMaQu1CqHlRQOio16xZ4ssLmZqSChfcON0RkZeBRHCC3oC30JIh
         yFa+iTIE//648K80qu/lU9fX6EJHIn7hSZIqNziN3xRoq3P1kf27VPtxE5WLUJ4EnJpl
         jK1sLh2f6mqmseJKf70VIXqOPzGlawG7sp4mYyP1nXGcSDYKKdlWgwYSDYdOe0HlvTA1
         +H6yxIYp7O3HZsD371tpODu2pszp60vOumh2he/BZ9XkiPrfpWHOZDr2oRv/l0YmKWLx
         V8Db6a0L38Jq2sJJGdqkqowhej6bv8+Ud+r+uR60t6FBnap96CorQAfDJxQuUfnjwPih
         lDiQ==
X-Gm-Message-State: AOAM531Yaa82fOSV6VN7Af2Kgo53JtpaumpXsBzB51308dGyji0VEYyy
        086UxZE4v0/67nqyZhHHpno=
X-Google-Smtp-Source: ABdhPJx8N3Yxnfw/JNUeLdh2tYls8aL3hFOM4UkxY2TDsbWWQblrIYTMQLBAsBfHyNicg6gChAeVyA==
X-Received: by 2002:a05:600c:364c:: with SMTP id y12mr8971267wmq.96.1616690493669;
        Thu, 25 Mar 2021 09:41:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p16sm9055793wrt.54.2021.03.25.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:41:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v8 12/13] usb: host: xhci-tegra: Unlink power domain devices
Date:   Thu, 25 Mar 2021 17:40:56 +0100
Message-Id: <20210325164057.793954-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

This commit unlinks xhci-tegra platform device with SS/host power
domain devices. Reasons for this change is - at ELPG entry, PHY
sleepwalk and wake configuration need to be done before powering
down SS/host partitions, and PHY need be powered off after powering
down SS/host partitions. Sequence looks like roughly below:

  tegra_xusb_enter_elpg() -> xhci_suspend()
                          -> enable PHY sleepwalk and wake if needed
                          -> power down SS/host partitions
                          -> power down PHY

If SS/host power domains are linked to xhci-tegra platform device, we
are not able to perform the sequence like above.

This commit introduces:
  1. tegra_xusb_unpowergate_partitions() to power up SS and host
     partitions together. If SS/host power domain devices are
     available, it invokes pm_runtime_get_sync() to request power
     driver to power up partitions; If power domain devices are not
     available, tegra_powergate_sequence_power_up() will be used to
     power up partitions.

  2. tegra_xusb_powergate_partitions() to power down SS and host
     partitions together. If SS/host power domain devices are
     available, it invokes pm_runtime_put_sync() to request power
     driver to power down partitions; If power domain devices are not
     available, tegra_powergate_power_off() will be used to power down
     partitions.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 206 ++++++++++++++++++----------------
 1 file changed, 112 insertions(+), 94 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 50bb91b6a4b8..5b39a739f8f0 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2,7 +2,7 @@
 /*
  * NVIDIA Tegra xHCI host controller driver
  *
- * Copyright (C) 2014 NVIDIA Corporation
+ * Copyright (c) 2014-2020, NVIDIA CORPORATION. All rights reserved.
  * Copyright (C) 2014 Google, Inc.
  */
 
@@ -249,8 +249,7 @@ struct tegra_xusb {
 
 	struct device *genpd_dev_host;
 	struct device *genpd_dev_ss;
-	struct device_link *genpd_dl_host;
-	struct device_link *genpd_dl_ss;
+	bool use_genpd;
 
 	struct phy **phys;
 	unsigned int num_phys;
@@ -821,36 +820,12 @@ static void tegra_xusb_phy_disable(struct tegra_xusb *tegra)
 
 static int tegra_xusb_runtime_suspend(struct device *dev)
 {
-	struct tegra_xusb *tegra = dev_get_drvdata(dev);
-
-	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
-	tegra_xusb_clk_disable(tegra);
-
 	return 0;
 }
 
 static int tegra_xusb_runtime_resume(struct device *dev)
 {
-	struct tegra_xusb *tegra = dev_get_drvdata(dev);
-	int err;
-
-	err = tegra_xusb_clk_enable(tegra);
-	if (err) {
-		dev_err(dev, "failed to enable clocks: %d\n", err);
-		return err;
-	}
-
-	err = regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
-	if (err) {
-		dev_err(dev, "failed to enable regulators: %d\n", err);
-		goto disable_clk;
-	}
-
 	return 0;
-
-disable_clk:
-	tegra_xusb_clk_disable(tegra);
-	return err;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1026,10 +1001,9 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 static void tegra_xusb_powerdomain_remove(struct device *dev,
 					  struct tegra_xusb *tegra)
 {
-	if (tegra->genpd_dl_ss)
-		device_link_del(tegra->genpd_dl_ss);
-	if (tegra->genpd_dl_host)
-		device_link_del(tegra->genpd_dl_host);
+	if (!tegra->use_genpd)
+		return;
+
 	if (!IS_ERR_OR_NULL(tegra->genpd_dev_ss))
 		dev_pm_domain_detach(tegra->genpd_dev_ss, true);
 	if (!IS_ERR_OR_NULL(tegra->genpd_dev_host))
@@ -1055,20 +1029,84 @@ static int tegra_xusb_powerdomain_init(struct device *dev,
 		return err;
 	}
 
-	tegra->genpd_dl_host = device_link_add(dev, tegra->genpd_dev_host,
-					       DL_FLAG_PM_RUNTIME |
-					       DL_FLAG_STATELESS);
-	if (!tegra->genpd_dl_host) {
-		dev_err(dev, "adding host device link failed!\n");
-		return -ENODEV;
+	tegra->use_genpd = true;
+
+	return 0;
+}
+
+static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
+{
+	struct device *dev = tegra->dev;
+	int rc;
+
+	if (tegra->use_genpd) {
+		rc = pm_runtime_get_sync(tegra->genpd_dev_ss);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB SS partition\n");
+			return rc;
+		}
+
+		rc = pm_runtime_get_sync(tegra->genpd_dev_host);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB Host partition\n");
+			pm_runtime_put_sync(tegra->genpd_dev_ss);
+			return rc;
+		}
+	} else {
+		rc = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
+							tegra->ss_clk,
+							tegra->ss_rst);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB SS partition\n");
+			return rc;
+		}
+
+		rc = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
+							tegra->host_clk,
+							tegra->host_rst);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB Host partition\n");
+			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+			return rc;
+		}
 	}
 
-	tegra->genpd_dl_ss = device_link_add(dev, tegra->genpd_dev_ss,
-					     DL_FLAG_PM_RUNTIME |
-					     DL_FLAG_STATELESS);
-	if (!tegra->genpd_dl_ss) {
-		dev_err(dev, "adding superspeed device link failed!\n");
-		return -ENODEV;
+	return 0;
+}
+
+static int tegra_xusb_powergate_partitions(struct tegra_xusb *tegra)
+{
+	struct device *dev = tegra->dev;
+	int rc;
+
+	if (tegra->use_genpd) {
+		rc = pm_runtime_put_sync(tegra->genpd_dev_host);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB Host partition\n");
+			return rc;
+		}
+
+		rc = pm_runtime_put_sync(tegra->genpd_dev_ss);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB SS partition\n");
+			pm_runtime_get_sync(tegra->genpd_dev_host);
+			return rc;
+		}
+	} else {
+		rc = tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB Host partition\n");
+			return rc;
+		}
+
+		rc = tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB SS partition\n");
+			tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
+							  tegra->host_clk,
+							  tegra->host_rst);
+			return rc;
+		}
 	}
 
 	return 0;
@@ -1432,25 +1470,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 				err);
 			goto put_padctl;
 		}
-
-		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
-							tegra->ss_clk,
-							tegra->ss_rst);
-		if (err) {
-			dev_err(&pdev->dev,
-				"failed to enable XUSBA domain: %d\n", err);
-			goto put_padctl;
-		}
-
-		err = tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
-							tegra->host_clk,
-							tegra->host_rst);
-		if (err) {
-			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
-			dev_err(&pdev->dev,
-				"failed to enable XUSBC domain: %d\n", err);
-			goto put_padctl;
-		}
 	} else {
 		err = tegra_xusb_powerdomain_init(&pdev->dev, tegra);
 		if (err)
@@ -1525,10 +1544,22 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	 */
 	platform_set_drvdata(pdev, tegra);
 
+	err = tegra_xusb_clk_enable(tegra);
+	if (err) {
+		dev_err(tegra->dev, "failed to enable clocks: %d\n", err);
+		goto put_hcd;
+	}
+
+	err = regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
+	if (err) {
+		dev_err(tegra->dev, "failed to enable regulators: %d\n", err);
+		goto disable_clk;
+	}
+
 	err = tegra_xusb_phy_enable(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable PHYs: %d\n", err);
-		goto put_hcd;
+		goto disable_regulator;
 	}
 
 	/*
@@ -1547,30 +1578,22 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto disable_phy;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-
-	if (!pm_runtime_enabled(&pdev->dev))
-		err = tegra_xusb_runtime_resume(&pdev->dev);
-	else
-		err = pm_runtime_get_sync(&pdev->dev);
-
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
+	err = tegra_xusb_unpowergate_partitions(tegra);
+	if (err)
 		goto free_firmware;
-	}
 
 	tegra_xusb_config(tegra);
 
 	err = tegra_xusb_load_firmware(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to load firmware: %d\n", err);
-		goto put_rpm;
+		goto powergate;
 	}
 
 	err = usb_add_hcd(tegra->hcd, tegra->xhci_irq, IRQF_SHARED);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to add USB HCD: %d\n", err);
-		goto put_rpm;
+		goto powergate;
 	}
 
 	device_wakeup_enable(tegra->hcd->self.controller);
@@ -1622,24 +1645,21 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	usb_put_hcd(xhci->shared_hcd);
 remove_usb2:
 	usb_remove_hcd(tegra->hcd);
-put_rpm:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		tegra_xusb_runtime_suspend(&pdev->dev);
-put_hcd:
-	usb_put_hcd(tegra->hcd);
+powergate:
+	tegra_xusb_powergate_partitions(tegra);
 free_firmware:
 	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
 			  tegra->fw.phys);
 disable_phy:
 	tegra_xusb_phy_disable(tegra);
-	pm_runtime_disable(&pdev->dev);
+disable_regulator:
+	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
+disable_clk:
+	tegra_xusb_clk_disable(tegra);
+put_hcd:
+	usb_put_hcd(tegra->hcd);
 put_powerdomains:
-	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
-	} else {
-		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
-	}
+	tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
 put_padctl:
 	tegra_xusb_padctl_put(tegra->padctl);
 	return err;
@@ -1664,15 +1684,13 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
-	} else {
-		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
-	}
+	tegra_xusb_powergate_partitions(tegra);
 
-	tegra_xusb_phy_disable(tegra);
+	tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
 
+	tegra_xusb_phy_disable(tegra);
+	tegra_xusb_clk_disable(tegra);
+	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
 	tegra_xusb_padctl_put(tegra->padctl);
 
 	return 0;
-- 
2.30.2

