Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA810C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 07:38:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6ABBC23142
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 07:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbhATHib (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 02:38:31 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6690 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729169AbhATHf5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 02:35:57 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6007dd320000>; Tue, 19 Jan 2021 23:35:14 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan
 2021 07:35:11 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 20 Jan 2021 07:35:08 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, <linux-clk@vger.kernel.org>,
        JC Kuo <jckuo@nvidia.com>, Thierry Reding <treding@nvidia.com>
Subject: [PATCH v7 13/14] usb: host: xhci-tegra: Unlink power domain devices
Date:   Wed, 20 Jan 2021 15:34:13 +0800
Message-ID: <20210120073414.69208-14-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120073414.69208-1-jckuo@nvidia.com>
References: <20210120073414.69208-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611128114; bh=8OAKWRqtP92VODxlWi13Ad3QiiXJoOcEdg7CU811U5E=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=K/R6chqyRIvKynxQonPilIeRS2ZqWTdcL7EZhjta/4wFKMyjxw7xry6I/AGdJMbfL
         a6G3TdSFPv8H4vm10hGWLRWHVtOmObWzXyGCByE9J4afmxK+BqLan8NZFknJ76X4Ox
         seRJJzk2G7Z+ELyYJUF2sf0tYsbPIYQUK5adUPZoo+eVrVDdozbgdjqdP6RUDLU9rs
         aIzBlLWIUvDOe87UwBb104Wir/MMH2AgC98Jb/MrZrcf+NNIOYZy09i3MEjqlOvsqf
         oGumruMhN3N97hIiFZRNcFMyiFkMvBAs8jl3IVczNbEbxM49hijhLKquvrjVJX4g6v
         mPifBD+iIhAWQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

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
Acked-by: Thierry Reding <treding@nvidia.com>
---
v7:
   add 'Acked-by: Thierry Reding <treding@nvidia.com>'
v6:
   no change
v5:
   no change
v4:
   commit message improvement
   update copyright string
v3:
   use 'unsigned int' for PHY index
   remove unnecessary 'else'
   drop IRQF_TRIGGER_HIGH when invokes devm_request_threaded_irq()

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
=20
@@ -249,8 +249,7 @@ struct tegra_xusb {
=20
 	struct device *genpd_dev_host;
 	struct device *genpd_dev_ss;
-	struct device_link *genpd_dl_host;
-	struct device_link *genpd_dl_ss;
+	bool use_genpd;
=20
 	struct phy **phys;
 	unsigned int num_phys;
@@ -821,36 +820,12 @@ static void tegra_xusb_phy_disable(struct tegra_xusb =
*tegra)
=20
 static int tegra_xusb_runtime_suspend(struct device *dev)
 {
-	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
-
-	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
-	tegra_xusb_clk_disable(tegra);
-
 	return 0;
 }
=20
 static int tegra_xusb_runtime_resume(struct device *dev)
 {
-	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
-	int err;
-
-	err =3D tegra_xusb_clk_enable(tegra);
-	if (err) {
-		dev_err(dev, "failed to enable clocks: %d\n", err);
-		return err;
-	}
-
-	err =3D regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
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
=20
 #ifdef CONFIG_PM_SLEEP
@@ -1026,10 +1001,9 @@ static int tegra_xusb_load_firmware(struct tegra_xus=
b *tegra)
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
@@ -1055,20 +1029,84 @@ static int tegra_xusb_powerdomain_init(struct devic=
e *dev,
 		return err;
 	}
=20
-	tegra->genpd_dl_host =3D device_link_add(dev, tegra->genpd_dev_host,
-					       DL_FLAG_PM_RUNTIME |
-					       DL_FLAG_STATELESS);
-	if (!tegra->genpd_dl_host) {
-		dev_err(dev, "adding host device link failed!\n");
-		return -ENODEV;
+	tegra->use_genpd =3D true;
+
+	return 0;
+}
+
+static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
+{
+	struct device *dev =3D tegra->dev;
+	int rc;
+
+	if (tegra->use_genpd) {
+		rc =3D pm_runtime_get_sync(tegra->genpd_dev_ss);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB SS partition\n");
+			return rc;
+		}
+
+		rc =3D pm_runtime_get_sync(tegra->genpd_dev_host);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB Host partition\n");
+			pm_runtime_put_sync(tegra->genpd_dev_ss);
+			return rc;
+		}
+	} else {
+		rc =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
+							tegra->ss_clk,
+							tegra->ss_rst);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB SS partition\n");
+			return rc;
+		}
+
+		rc =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
+							tegra->host_clk,
+							tegra->host_rst);
+		if (rc < 0) {
+			dev_err(dev, "failed to enable XUSB Host partition\n");
+			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+			return rc;
+		}
 	}
=20
-	tegra->genpd_dl_ss =3D device_link_add(dev, tegra->genpd_dev_ss,
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
+	struct device *dev =3D tegra->dev;
+	int rc;
+
+	if (tegra->use_genpd) {
+		rc =3D pm_runtime_put_sync(tegra->genpd_dev_host);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB Host partition\n");
+			return rc;
+		}
+
+		rc =3D pm_runtime_put_sync(tegra->genpd_dev_ss);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB SS partition\n");
+			pm_runtime_get_sync(tegra->genpd_dev_host);
+			return rc;
+		}
+	} else {
+		rc =3D tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB Host partition\n");
+			return rc;
+		}
+
+		rc =3D tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
+		if (rc < 0) {
+			dev_err(dev, "failed to disable XUSB SS partition\n");
+			tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
+							  tegra->host_clk,
+							  tegra->host_rst);
+			return rc;
+		}
 	}
=20
 	return 0;
@@ -1432,25 +1470,6 @@ static int tegra_xusb_probe(struct platform_device *=
pdev)
 				err);
 			goto put_padctl;
 		}
-
-		err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBA,
-							tegra->ss_clk,
-							tegra->ss_rst);
-		if (err) {
-			dev_err(&pdev->dev,
-				"failed to enable XUSBA domain: %d\n", err);
-			goto put_padctl;
-		}
-
-		err =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_XUSBC,
-							tegra->host_clk,
-							tegra->host_rst);
-		if (err) {
-			tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
-			dev_err(&pdev->dev,
-				"failed to enable XUSBC domain: %d\n", err);
-			goto put_padctl;
-		}
 	} else {
 		err =3D tegra_xusb_powerdomain_init(&pdev->dev, tegra);
 		if (err)
@@ -1525,10 +1544,22 @@ static int tegra_xusb_probe(struct platform_device =
*pdev)
 	 */
 	platform_set_drvdata(pdev, tegra);
=20
+	err =3D tegra_xusb_clk_enable(tegra);
+	if (err) {
+		dev_err(tegra->dev, "failed to enable clocks: %d\n", err);
+		goto put_hcd;
+	}
+
+	err =3D regulator_bulk_enable(tegra->soc->num_supplies, tegra->supplies);
+	if (err) {
+		dev_err(tegra->dev, "failed to enable regulators: %d\n", err);
+		goto disable_clk;
+	}
+
 	err =3D tegra_xusb_phy_enable(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable PHYs: %d\n", err);
-		goto put_hcd;
+		goto disable_regulator;
 	}
=20
 	/*
@@ -1547,30 +1578,22 @@ static int tegra_xusb_probe(struct platform_device =
*pdev)
 		goto disable_phy;
 	}
=20
-	pm_runtime_enable(&pdev->dev);
-
-	if (!pm_runtime_enabled(&pdev->dev))
-		err =3D tegra_xusb_runtime_resume(&pdev->dev);
-	else
-		err =3D pm_runtime_get_sync(&pdev->dev);
-
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable device: %d\n", err);
+	err =3D tegra_xusb_unpowergate_partitions(tegra);
+	if (err)
 		goto free_firmware;
-	}
=20
 	tegra_xusb_config(tegra);
=20
 	err =3D tegra_xusb_load_firmware(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to load firmware: %d\n", err);
-		goto put_rpm;
+		goto powergate;
 	}
=20
 	err =3D usb_add_hcd(tegra->hcd, tegra->xhci_irq, IRQF_SHARED);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to add USB HCD: %d\n", err);
-		goto put_rpm;
+		goto powergate;
 	}
=20
 	device_wakeup_enable(tegra->hcd->self.controller);
@@ -1622,24 +1645,21 @@ static int tegra_xusb_probe(struct platform_device =
*pdev)
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
@@ -1664,15 +1684,13 @@ static int tegra_xusb_remove(struct platform_device=
 *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
=20
-	if (!of_property_read_bool(pdev->dev.of_node, "power-domains")) {
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBC);
-		tegra_powergate_power_off(TEGRA_POWERGATE_XUSBA);
-	} else {
-		tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
-	}
+	tegra_xusb_powergate_partitions(tegra);
=20
-	tegra_xusb_phy_disable(tegra);
+	tegra_xusb_powerdomain_remove(&pdev->dev, tegra);
=20
+	tegra_xusb_phy_disable(tegra);
+	tegra_xusb_clk_disable(tegra);
+	regulator_bulk_disable(tegra->soc->num_supplies, tegra->supplies);
 	tegra_xusb_padctl_put(tegra->padctl);
=20
 	return 0;
--=20
2.25.1

