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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A229C433EA
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DC4C61A1E
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhCYQl5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbhCYQl0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:41:26 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6053BC06174A;
        Thu, 25 Mar 2021 09:41:26 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so1543302wmi.3;
        Thu, 25 Mar 2021 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+mgUd3FfBG5V1WiGiq7Sg4bslUVk/BI3WMScbkkNnvo=;
        b=HDU9cNu0XKgix9QOGNKr3nLH70tx8Q2u5VwwF7ZMJ3ce5mq0PCs8Pv97HWyNwjeXGR
         RxBOyzvnY7d3oztATGgWrUCzWHhdHgMJ+eO02W/3xsCZ8QCVf9z9K1nqg/5tpHN9Z4tE
         t2eoxQLNO+KbxhTu3CArygjVjJ4vxUe/b8whrkEeKE3FqQsS3Hkhyr0u1czxHzAsoWCd
         hI4u5/bdf4IoTewIn1k2DLFGKhp45dU/3U3y7mBk9+MPcdfCU+oTcCCuRaADPQ8O5/I7
         0U50ulzmGzBiBzNQ0V2rtxqpVOakvqQcpwVh07B46hC/mFlFvzX8fqNFADxhUUhQRCF4
         qidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+mgUd3FfBG5V1WiGiq7Sg4bslUVk/BI3WMScbkkNnvo=;
        b=mWyzE7tJXLLE9JGT0MnC6+uxDSc9CeiOHgpa56+O9VZeGZcNzjBouvFvi1Nmm70U6r
         uonshhS3eL6Zz4US0hKxvvU3gr7jZF+N9Qp/V92V6Hotc8gl/5tn4NjtYWZxSMAwIHDR
         RwlBV4tbHM9CdrK5clw5HkxbIVPWOMuTUx7oXsDiDS9C/VmrC1usV99G/CXKB6NeT4zQ
         srEjbhP9CKmBM+BeZ9IhRj2dBMYr0Tc2B2v7QTOi2HRBuify5Fy7oMF4L9zks5pgcDbt
         efHxdsI0MWCBPgUrcPgm24MtHnusKFVl2Ys1iwDWZw7Xa/G8OgDVfu1SR5LiJTjHLwyt
         SCmw==
X-Gm-Message-State: AOAM530udnw2AeOmMHuh31/TTArYR1QmNBhPh+FYxRWqPQBroxL6J2vK
        DSIusYI6wA36S8dASi6NGGE=
X-Google-Smtp-Source: ABdhPJwecxKmDPs8sTv0ICfk8y8FLcz6o1BYpe4/XmBXW2UfZiktm5sFyZ8X94fBst1OiLGjH2miEg==
X-Received: by 2002:a1c:f614:: with SMTP id w20mr8746936wmc.70.1616690485017;
        Thu, 25 Mar 2021 09:41:25 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n3sm7141949wmi.7.2021.03.25.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:41:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v8 10/13] phy: tegra: xusb: Tegra210 host mode VBUS control
Date:   Thu, 25 Mar 2021 17:40:54 +0100
Message-Id: <20210325164057.793954-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

To support XUSB host controller ELPG, this commit moves VBUS control
.phy_power_on()/.phy_power_off() to .phy_init()/.phy_exit().
When XUSB host controller enters ELPG, host driver invokes
.phy_power_off(), VBUS should remain ON so that USB devices will not
disconnect. VBUS can be turned OFF when host driver invokes
.phy_exit() which indicates disabling a USB port.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 52 ++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 8af73ba78ad7..9d39f812fb43 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -1819,8 +1819,25 @@ static int tegra210_usb2_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct tegra_xusb_usb2_port *port;
+	int err;
 	u32 value;
 
+	port = tegra_xusb_find_usb2_port(padctl, index);
+	if (!port) {
+		dev_err(&phy->dev, "no port found for USB2 lane %u\n", index);
+		return -ENODEV;
+	}
+
+	if (port->supply && port->mode == USB_DR_MODE_HOST) {
+		err = regulator_enable(port->supply);
+		if (err)
+			return err;
+	}
+
+	mutex_lock(&padctl->lock);
+
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_PAD_MUX);
 	value &= ~(XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_MASK <<
 		   XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_SHIFT);
@@ -1828,11 +1845,30 @@ static int tegra210_usb2_phy_init(struct phy *phy)
 		 XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_SHIFT;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PAD_MUX);
 
+	mutex_unlock(&padctl->lock);
+
 	return 0;
 }
 
 static int tegra210_usb2_phy_exit(struct phy *phy)
 {
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra_xusb_usb2_port *port;
+	int err;
+
+	port = tegra_xusb_find_usb2_port(padctl, lane->index);
+	if (!port) {
+		dev_err(&phy->dev, "no port found for USB2 lane %u\n", lane->index);
+		return -ENODEV;
+	}
+
+	if (port->supply && port->mode == USB_DR_MODE_HOST) {
+		err = regulator_disable(port->supply);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
 
@@ -1953,6 +1989,8 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
 	priv = to_tegra210_xusb_padctl(padctl);
 
+	mutex_lock(&padctl->lock);
+
 	if (port->usb3_port_fake != -1) {
 		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
 		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
@@ -2046,14 +2084,6 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 	padctl_writel(padctl, value,
 		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
 
-	if (port->supply && port->mode == USB_DR_MODE_HOST) {
-		err = regulator_enable(port->supply);
-		if (err)
-			return err;
-	}
-
-	mutex_lock(&padctl->lock);
-
 	if (pad->enable > 0) {
 		pad->enable++;
 		mutex_unlock(&padctl->lock);
@@ -2062,7 +2092,7 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
 	err = clk_prepare_enable(pad->clk);
 	if (err)
-		goto disable_regulator;
+		goto out;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_MASK <<
@@ -2094,8 +2124,7 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
 	return 0;
 
-disable_regulator:
-	regulator_disable(port->supply);
+out:
 	mutex_unlock(&padctl->lock);
 	return err;
 }
@@ -2154,7 +2183,6 @@ static int tegra210_usb2_phy_power_off(struct phy *phy)
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
 
 out:
-	regulator_disable(port->supply);
 	mutex_unlock(&padctl->lock);
 	return 0;
 }
-- 
2.30.2

