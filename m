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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41F5C3526E
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7925C23443
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgLRMMT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Dec 2020 07:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgLRMML (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Dec 2020 07:12:11 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598D0C061285;
        Fri, 18 Dec 2020 04:11:31 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id m25so4786725lfc.11;
        Fri, 18 Dec 2020 04:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YPDu5mDnI2HGS0Mt5YelET0ByxQ1jG4xW4epw3u9kbY=;
        b=iAu/MT1HCKMh7TLvqlK7zSJmQ/PeYZghUS8iCvPEVjsDqR3hOEcL4DbOPL0qs3v5Di
         MWL7hZwIkMUO6Fh+vh2fofvlm6ltzqoIppNeR7fp1sTou8t903kssXR6vRJ4TvLufJaH
         Q4g0kMDIXWyjBNK4ohosTJ2TIM3E4U40ZfWir2sk3Mh2/BW0ayRb0YVvp/wwMy8wsXGm
         oVbiftePMTq3aJ4nJpkCZ7Be+d81KAR1CQQCGV5Q9oWM7uA2damHn1z0l3LnHIVero3K
         HEIHxjSzuZR7DWqjV5cgtG5/zMyBRDpooRnZVin/w0ft3UiMY2DJwl/Ysg4R8MMhF3je
         fKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YPDu5mDnI2HGS0Mt5YelET0ByxQ1jG4xW4epw3u9kbY=;
        b=ISRzhOdXk94MvbmH59Nd51vjlpQPF/wH01m4HfVtVi9WGoXR9WjgaNY+QzwwEV+OAK
         jihOO5ZmuitCnZjLEyEwgXG+dnnvMl7WLOighU1iGZk1zC/Arx4HmssqNStYFDKYAzQg
         dJ7opUsHCHxR5WtGDDaHDUbQd3W60CW+jUSwcQ5LVzxFDmM1fTduPEXvJ9bcwZSYo/R6
         c1vpyFN96DbfTo4Mk6DZ2uo2kIlfhe98FeWMo4cG2CppOA0uYhmKqRnuGkCLdFsK79Eb
         pqIzAB/ZtHuG1chab2pMMcVhgqWywD45dxlUXrH6GaPIjvCfxmibbwgdDMwe+QPpCoiS
         Uu/g==
X-Gm-Message-State: AOAM53022IA/nS3kB7IPpYbl74yxPXTTwZrCnANoX3SENl2KMHo2+yHg
        5ltk+gobaKgph7BFj3tcmpUil3i6q3g=
X-Google-Smtp-Source: ABdhPJzIklsseqdcRaUh2WAh/8c1GaEuDWJtIOs+UyL2jCltKZYIP8vZP9iRCqrTQANc8DgAzIcKxg==
X-Received: by 2002:a19:385e:: with SMTP id d30mr1487222lfj.187.1608293489873;
        Fri, 18 Dec 2020 04:11:29 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id i9sm1036472ljn.18.2020.12.18.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 04:11:29 -0800 (PST)
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
Subject: [PATCH v3 2/9] usb: phy: tegra: Support waking up from a low power mode
Date:   Fri, 18 Dec 2020 15:02:39 +0300
Message-Id: <20201218120246.7759-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218120246.7759-1-digetx@gmail.com>
References: <20201218120246.7759-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Support programming of waking up from a low power mode by implementing the
generic set_wakeup() callback of the USB PHY API.

Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Ion Agorria <ion@agorria.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 100 ++++++++++++++++++++++++++----
 include/linux/usb/tegra_usb_phy.h |   2 +
 2 files changed, 91 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 1296524e1bee..a48452a6172b 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -45,6 +45,7 @@
 #define TEGRA_PORTSC1_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_OCC)
 
 #define USB_SUSP_CTRL				0x400
+#define   USB_WAKE_ON_RESUME_EN			BIT(2)
 #define   USB_WAKE_ON_CNNT_EN_DEV		BIT(3)
 #define   USB_WAKE_ON_DISCON_EN_DEV		BIT(4)
 #define   USB_SUSP_CLR				BIT(5)
@@ -56,6 +57,15 @@
 #define   USB_SUSP_SET				BIT(14)
 #define   USB_WAKEUP_DEBOUNCE_COUNT(x)		(((x) & 0x7) << 16)
 
+#define USB_PHY_VBUS_SENSORS			0x404
+#define   B_SESS_VLD_WAKEUP_EN			BIT(6)
+#define   B_VBUS_VLD_WAKEUP_EN			BIT(14)
+#define   A_SESS_VLD_WAKEUP_EN			BIT(22)
+#define   A_VBUS_VLD_WAKEUP_EN			BIT(30)
+
+#define USB_PHY_VBUS_WAKEUP_ID			0x408
+#define   VBUS_WAKEUP_WAKEUP_EN			BIT(30)
+
 #define USB1_LEGACY_CTRL			0x410
 #define   USB1_NO_LEGACY_MODE			BIT(0)
 #define   USB1_VBUS_SENSE_CTL_MASK		(3 << 1)
@@ -334,6 +344,11 @@ static int utmip_pad_power_on(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + UTMIP_BIAS_CFG0);
 	}
 
+	if (phy->pad_wakeup) {
+		phy->pad_wakeup = false;
+		utmip_pad_count--;
+	}
+
 	spin_unlock(&utmip_pad_lock);
 
 	clk_disable_unprepare(phy->pad_clk);
@@ -359,6 +374,17 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 		goto ulock;
 	}
 
+	/*
+	 * In accordance to TRM, OTG and Bias pad circuits could be turned off
+	 * to save power if wake is enabled, but the VBUS-change detection
+	 * method is board-specific and these circuits may need to be enabled
+	 * to generate wakeup event, hence we will just keep them both enabled.
+	 */
+	if (phy->wakeup_enabled) {
+		phy->pad_wakeup = true;
+		utmip_pad_count++;
+	}
+
 	if (--utmip_pad_count == 0) {
 		val = readl_relaxed(base + UTMIP_BIAS_CFG0);
 		val |= UTMIP_OTGPD | UTMIP_BIASPD;
@@ -503,11 +529,24 @@ static int utmi_phy_power_on(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + UTMIP_PLL_CFG1);
 	}
 
+	val = readl_relaxed(base + USB_SUSP_CTRL);
+	val &= ~USB_WAKE_ON_RESUME_EN;
+	writel_relaxed(val, base + USB_SUSP_CTRL);
+
 	if (phy->mode == USB_DR_MODE_PERIPHERAL) {
 		val = readl_relaxed(base + USB_SUSP_CTRL);
 		val &= ~(USB_WAKE_ON_CNNT_EN_DEV | USB_WAKE_ON_DISCON_EN_DEV);
 		writel_relaxed(val, base + USB_SUSP_CTRL);
 
+		val = readl_relaxed(base + USB_PHY_VBUS_WAKEUP_ID);
+		val &= ~VBUS_WAKEUP_WAKEUP_EN;
+		writel_relaxed(val, base + USB_PHY_VBUS_WAKEUP_ID);
+
+		val = readl_relaxed(base + USB_PHY_VBUS_SENSORS);
+		val &= ~(A_VBUS_VLD_WAKEUP_EN | A_SESS_VLD_WAKEUP_EN);
+		val &= ~(B_VBUS_VLD_WAKEUP_EN | B_SESS_VLD_WAKEUP_EN);
+		writel_relaxed(val, base + USB_PHY_VBUS_SENSORS);
+
 		val = readl_relaxed(base + UTMIP_BAT_CHRG_CFG0);
 		val &= ~UTMIP_PD_CHRG;
 		writel_relaxed(val, base + UTMIP_BAT_CHRG_CFG0);
@@ -605,31 +644,51 @@ static int utmi_phy_power_off(struct tegra_usb_phy *phy)
 
 	utmi_phy_clk_disable(phy);
 
-	if (phy->mode == USB_DR_MODE_PERIPHERAL) {
+	/* PHY won't resume if reset is asserted */
+	if (!phy->wakeup_enabled) {
 		val = readl_relaxed(base + USB_SUSP_CTRL);
-		val &= ~USB_WAKEUP_DEBOUNCE_COUNT(~0);
-		val |= USB_WAKE_ON_CNNT_EN_DEV | USB_WAKEUP_DEBOUNCE_COUNT(5);
+		val |= UTMIP_RESET;
 		writel_relaxed(val, base + USB_SUSP_CTRL);
 	}
 
-	val = readl_relaxed(base + USB_SUSP_CTRL);
-	val |= UTMIP_RESET;
-	writel_relaxed(val, base + USB_SUSP_CTRL);
-
 	val = readl_relaxed(base + UTMIP_BAT_CHRG_CFG0);
 	val |= UTMIP_PD_CHRG;
 	writel_relaxed(val, base + UTMIP_BAT_CHRG_CFG0);
 
-	val = readl_relaxed(base + UTMIP_XCVR_CFG0);
-	val |= UTMIP_FORCE_PD_POWERDOWN | UTMIP_FORCE_PD2_POWERDOWN |
-	       UTMIP_FORCE_PDZI_POWERDOWN;
-	writel_relaxed(val, base + UTMIP_XCVR_CFG0);
+	if (!phy->wakeup_enabled) {
+		val = readl_relaxed(base + UTMIP_XCVR_CFG0);
+		val |= UTMIP_FORCE_PD_POWERDOWN | UTMIP_FORCE_PD2_POWERDOWN |
+		       UTMIP_FORCE_PDZI_POWERDOWN;
+		writel_relaxed(val, base + UTMIP_XCVR_CFG0);
+	}
 
 	val = readl_relaxed(base + UTMIP_XCVR_CFG1);
 	val |= UTMIP_FORCE_PDDISC_POWERDOWN | UTMIP_FORCE_PDCHRP_POWERDOWN |
 	       UTMIP_FORCE_PDDR_POWERDOWN;
 	writel_relaxed(val, base + UTMIP_XCVR_CFG1);
 
+	if (phy->wakeup_enabled) {
+		val = readl_relaxed(base + USB_SUSP_CTRL);
+		val &= ~USB_WAKEUP_DEBOUNCE_COUNT(~0);
+		val |= USB_WAKEUP_DEBOUNCE_COUNT(5);
+		val |= USB_WAKE_ON_RESUME_EN;
+		writel_relaxed(val, base + USB_SUSP_CTRL);
+
+		/*
+		 * Ask VBUS sensor to generate wake event once cable is
+		 * connected.
+		 */
+		if (phy->mode == USB_DR_MODE_PERIPHERAL) {
+			val = readl_relaxed(base + USB_PHY_VBUS_WAKEUP_ID);
+			val |= VBUS_WAKEUP_WAKEUP_EN;
+			writel_relaxed(val, base + USB_PHY_VBUS_WAKEUP_ID);
+
+			val = readl_relaxed(base + USB_PHY_VBUS_SENSORS);
+			val |= A_VBUS_VLD_WAKEUP_EN;
+			writel_relaxed(val, base + USB_PHY_VBUS_SENSORS);
+		}
+	}
+
 	return utmip_pad_power_off(phy);
 }
 
@@ -765,6 +824,15 @@ static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 	usleep_range(5000, 6000);
 	clk_disable_unprepare(phy->clk);
 
+	/*
+	 * Wakeup currently unimplemented for ULPI, thus PHY needs to be
+	 * force-resumed.
+	 */
+	if (WARN_ON_ONCE(phy->wakeup_enabled)) {
+		ulpi_phy_power_on(phy);
+		return -EOPNOTSUPP;
+	}
+
 	return 0;
 }
 
@@ -827,6 +895,15 @@ static void tegra_usb_phy_shutdown(struct usb_phy *u_phy)
 	phy->freq = NULL;
 }
 
+static int tegra_usb_phy_set_wakeup(struct usb_phy *u_phy, bool enable)
+{
+	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
+
+	phy->wakeup_enabled = enable;
+
+	return 0;
+}
+
 static int tegra_usb_phy_set_suspend(struct usb_phy *u_phy, int suspend)
 {
 	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
@@ -1198,6 +1275,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	tegra_phy->u_phy.dev = &pdev->dev;
 	tegra_phy->u_phy.init = tegra_usb_phy_init;
 	tegra_phy->u_phy.shutdown = tegra_usb_phy_shutdown;
+	tegra_phy->u_phy.set_wakeup = tegra_usb_phy_set_wakeup;
 	tegra_phy->u_phy.set_suspend = tegra_usb_phy_set_suspend;
 
 	platform_set_drvdata(pdev, tegra_phy);
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index c29d1b4c9381..fd1c9f6a4e37 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -79,6 +79,8 @@ struct tegra_usb_phy {
 	bool is_ulpi_phy;
 	struct gpio_desc *reset_gpio;
 	struct reset_control *pad_rst;
+	bool wakeup_enabled;
+	bool pad_wakeup;
 	bool powered_on;
 };
 
-- 
2.29.2

