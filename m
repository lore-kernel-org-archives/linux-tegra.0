Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80679C8300E
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 08:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EB7224654
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 08:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="GNOl113t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgKSIyl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Nov 2020 03:54:41 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6223 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgKSIyj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 03:54:39 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb632d20000>; Thu, 19 Nov 2020 00:54:42 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 08:54:35 +0000
Received: from jckuo-lt.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 19 Nov 2020 08:54:33 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v5 12/16] phy: tegra: xusb: Tegra210 host mode VBUS control
Date:   Thu, 19 Nov 2020 16:54:01 +0800
Message-ID: <20201119085405.556138-13-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119085405.556138-1-jckuo@nvidia.com>
References: <20201119085405.556138-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605776083; bh=GcKhSTUMA+wERV7O/gIh1VHCMVCsgKSvJewwcJbCPr8=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=GNOl113ti8l4WMTz+DQLEueZ9BkhnIF4Bl0J7WtblZs7laKyBD6098LUVIPEPFojR
         cElOmP43+65THPTF8eThSZeDabfpE9gcf+FvUFOD2/PJ0bIxG3H2dxADpXfJ1t/+FM
         AFLx7ucO1wcbiXMtZXaCY0xDIckA+CPzHCrG1tcmBQHKHomn9AovwYSMiWRQTpPXaH
         9v9+9ABBWpFxAMGnB4IcEKNsEFeQyeDuHfAwpOebpqGKUzS+jG1Bds3fk8zBGQ+TeB
         1BnNDR7QrlFSkncCcpZluJe1h4z7qN+HG0/mRKCNY+ZG+oQcqlEKp9v4OiKc5YZ+Zp
         RA5A2+fSPuz2g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

To support XUSB host controller ELPG, this commit moves VBUS control
.phy_power_on()/.phy_power_off() to .phy_init()/.phy_exit().
When XUSB host controller enters ELPG, host driver invokes
.phy_power_off(), VBUS should remain ON so that USB devices will not
disconnect. VBUS can be turned OFF when host driver invokes
.phy_exit() which indicates disabling a USB port.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v5:
   no change
v4:
   no change
v3:
   new, was a part of "phy: tegra: xusb: Add wake/sleepwalk for Tegra210"

 drivers/phy/tegra/xusb-tegra210.c | 52 ++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-teg=
ra210.c
index 8af73ba78ad7..9d39f812fb43 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -1819,8 +1819,25 @@ static int tegra210_usb2_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	unsigned int index =3D lane->index;
+	struct tegra_xusb_usb2_port *port;
+	int err;
 	u32 value;
=20
+	port =3D tegra_xusb_find_usb2_port(padctl, index);
+	if (!port) {
+		dev_err(&phy->dev, "no port found for USB2 lane %u\n", index);
+		return -ENODEV;
+	}
+
+	if (port->supply && port->mode =3D=3D USB_DR_MODE_HOST) {
+		err =3D regulator_enable(port->supply);
+		if (err)
+			return err;
+	}
+
+	mutex_lock(&padctl->lock);
+
 	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_PAD_MUX);
 	value &=3D ~(XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_MASK <<
 		   XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_SHIFT);
@@ -1828,11 +1845,30 @@ static int tegra210_usb2_phy_init(struct phy *phy)
 		 XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_SHIFT;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PAD_MUX);
=20
+	mutex_unlock(&padctl->lock);
+
 	return 0;
 }
=20
 static int tegra210_usb2_phy_exit(struct phy *phy)
 {
+	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	struct tegra_xusb_usb2_port *port;
+	int err;
+
+	port =3D tegra_xusb_find_usb2_port(padctl, lane->index);
+	if (!port) {
+		dev_err(&phy->dev, "no port found for USB2 lane %u\n", lane->index);
+		return -ENODEV;
+	}
+
+	if (port->supply && port->mode =3D=3D USB_DR_MODE_HOST) {
+		err =3D regulator_disable(port->supply);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
=20
@@ -1953,6 +1989,8 @@ static int tegra210_usb2_phy_power_on(struct phy *phy=
)
=20
 	priv =3D to_tegra210_xusb_padctl(padctl);
=20
+	mutex_lock(&padctl->lock);
+
 	if (port->usb3_port_fake !=3D -1) {
 		value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
 		value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
@@ -2046,14 +2084,6 @@ static int tegra210_usb2_phy_power_on(struct phy *ph=
y)
 	padctl_writel(padctl, value,
 		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
=20
-	if (port->supply && port->mode =3D=3D USB_DR_MODE_HOST) {
-		err =3D regulator_enable(port->supply);
-		if (err)
-			return err;
-	}
-
-	mutex_lock(&padctl->lock);
-
 	if (pad->enable > 0) {
 		pad->enable++;
 		mutex_unlock(&padctl->lock);
@@ -2062,7 +2092,7 @@ static int tegra210_usb2_phy_power_on(struct phy *phy=
)
=20
 	err =3D clk_prepare_enable(pad->clk);
 	if (err)
-		goto disable_regulator;
+		goto out;
=20
 	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 	value &=3D ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_MASK <<
@@ -2094,8 +2124,7 @@ static int tegra210_usb2_phy_power_on(struct phy *phy=
)
=20
 	return 0;
=20
-disable_regulator:
-	regulator_disable(port->supply);
+out:
 	mutex_unlock(&padctl->lock);
 	return err;
 }
@@ -2154,7 +2183,6 @@ static int tegra210_usb2_phy_power_off(struct phy *ph=
y)
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
=20
 out:
-	regulator_disable(port->supply);
 	mutex_unlock(&padctl->lock);
 	return 0;
 }
--=20
2.25.1

