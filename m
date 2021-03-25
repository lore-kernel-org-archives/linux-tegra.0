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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BA9C433E8
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D011961A2A
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCYQl6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhCYQlb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:41:31 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7049C06174A;
        Thu, 25 Mar 2021 09:41:30 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 12so1535222wmf.5;
        Thu, 25 Mar 2021 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FzV3zBMv51XDLkh/8s4gze+scJ88wDHClM0XU2WDdxM=;
        b=d511zFVk8j3ZPT2YMgzSDlAgxvt+KdY70K4GnhOKZF4x8z4a7gEPFPnrMmQ8lqmeRT
         +/ZR0kohLKObwcN3azYl4nl7NdFuKCnriGiZz6OlzKAcHKZb0yM+mFeXbYuYam3ZdfGx
         mzV4hcOS7YV0sNGiTrg561mmEObKO7cyCTjkXCLBcBwjtcLMu4z58eDykALWtSvKof3u
         zIgt7SlYYRHzYqBmRqzs0/Fom8//9OYH3OjCyAN3MqYTqqszfhs2ECLJPZR7DpDKHwRW
         gpVbtX66LcNrkHowPRuGvnRbiShGWsnVTgAixvZ0YBJ0NBIwR7DdOVqnVVN+xmvCwAiZ
         7znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FzV3zBMv51XDLkh/8s4gze+scJ88wDHClM0XU2WDdxM=;
        b=b9lfc/mEmtcf+vgbkChx8NFFvFLSZ5eZNZ6nQ+WYc0Q3gRA8NCqmMOCVpz1212BkDC
         i9JGA8OVD81vfqMXHZVrpBr4ZaAOlwgaBWY2XoK6GIWvX7C7Q7MLDYe1KwNWVwQGwPPs
         3+0avEsqVQqhLtLTfGGJ5ns7DZD29dW0duJMJuFIu+/UcMaIrCbuFM/7H+y35nD1LsI6
         l1bsOguAbq4Z9QWLPxmhM1wwc5wwDpHBVA51oCcFVz7MTNW9WTpiMmiy7vseCly3qoC/
         ogyyMelrw0TZl7K4DuiDBDl9bifk224B/fIAPI3gdJ4hyJ9HbYqB5T4jj43fkZjWhCBY
         KJNw==
X-Gm-Message-State: AOAM533cc7g72m3wCXcM+PoWjfr52EqQp4L6DfIp2x5FZtmXJbQpJ+Xo
        YY5fwPrwpEGFrvQpFHYDnDo=
X-Google-Smtp-Source: ABdhPJwygLbH8aj/ylrr7WQLf44ym9QnSIYD9c2QPr6eXWsjvTXLkOMfG2zx+3SC47GQTEl5kTtDpQ==
X-Received: by 2002:a1c:9a09:: with SMTP id c9mr8655136wme.172.1616690489315;
        Thu, 25 Mar 2021 09:41:29 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c2sm7213995wmr.22.2021.03.25.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:41:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v8 11/13] phy: tegra: xusb: Add wake/sleepwalk for Tegra186
Date:   Thu, 25 Mar 2021 17:40:55 +0100
Message-Id: <20210325164057.793954-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

This commit implements Tegra186/Tegra194 XUSB PADCTL/AO wake and
sleepwalk operations.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 558 +++++++++++++++++++++++++++++-
 1 file changed, 557 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 5d64f69b39a9..6378bf722745 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2016-2019, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2016-2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -113,6 +113,117 @@
 #define  ID_OVERRIDE_FLOATING			ID_OVERRIDE(8)
 #define  ID_OVERRIDE_GROUNDED			ID_OVERRIDE(0)
 
+/* XUSB AO registers */
+#define XUSB_AO_USB_DEBOUNCE_DEL		(0x4)
+#define   UHSIC_LINE_DEB_CNT(x)			(((x) & 0xf) << 4)
+#define   UTMIP_LINE_DEB_CNT(x)			((x) & 0xf)
+
+#define XUSB_AO_UTMIP_TRIGGERS(x)		(0x40 + (x) * 4)
+#define   CLR_WALK_PTR				(1 << 0)
+#define   CAP_CFG				(1 << 1)
+#define   CLR_WAKE_ALARM			(1 << 3)
+
+#define XUSB_AO_UHSIC_TRIGGERS(x)		(0x60 + (x) * 4)
+#define   HSIC_CLR_WALK_PTR			(1 << 0)
+#define   HSIC_CLR_WAKE_ALARM			(1 << 3)
+#define   HSIC_CAP_CFG				(1 << 4)
+
+#define XUSB_AO_UTMIP_SAVED_STATE(x)		(0x70 + (x) * 4)
+#define   SPEED(x)				((x) & 0x3)
+#define     UTMI_HS				SPEED(0)
+#define     UTMI_FS				SPEED(1)
+#define     UTMI_LS				SPEED(2)
+#define     UTMI_RST				SPEED(3)
+
+#define XUSB_AO_UHSIC_SAVED_STATE(x)		(0x90 + (x) * 4)
+#define   MODE(x)				((x) & 0x1)
+#define   MODE_HS				MODE(0)
+#define   MODE_RST				MODE(1)
+
+#define XUSB_AO_UTMIP_SLEEPWALK_CFG(x)		(0xd0 + (x) * 4)
+#define XUSB_AO_UHSIC_SLEEPWALK_CFG(x)		(0xf0 + (x) * 4)
+#define   FAKE_USBOP_VAL			(1 << 0)
+#define   FAKE_USBON_VAL			(1 << 1)
+#define   FAKE_USBOP_EN				(1 << 2)
+#define   FAKE_USBON_EN				(1 << 3)
+#define   FAKE_STROBE_VAL			(1 << 0)
+#define   FAKE_DATA_VAL				(1 << 1)
+#define   FAKE_STROBE_EN			(1 << 2)
+#define   FAKE_DATA_EN				(1 << 3)
+#define   WAKE_WALK_EN				(1 << 14)
+#define   MASTER_ENABLE				(1 << 15)
+#define   LINEVAL_WALK_EN			(1 << 16)
+#define   WAKE_VAL(x)				(((x) & 0xf) << 17)
+#define     WAKE_VAL_NONE			WAKE_VAL(12)
+#define     WAKE_VAL_ANY			WAKE_VAL(15)
+#define     WAKE_VAL_DS10			WAKE_VAL(2)
+#define   LINE_WAKEUP_EN			(1 << 21)
+#define   MASTER_CFG_SEL			(1 << 22)
+
+#define XUSB_AO_UTMIP_SLEEPWALK(x)		(0x100 + (x) * 4)
+/* phase A */
+#define   USBOP_RPD_A				(1 << 0)
+#define   USBON_RPD_A				(1 << 1)
+#define   AP_A					(1 << 4)
+#define   AN_A					(1 << 5)
+#define   HIGHZ_A				(1 << 6)
+/* phase B */
+#define   USBOP_RPD_B				(1 << 8)
+#define   USBON_RPD_B				(1 << 9)
+#define   AP_B					(1 << 12)
+#define   AN_B					(1 << 13)
+#define   HIGHZ_B				(1 << 14)
+/* phase C */
+#define   USBOP_RPD_C				(1 << 16)
+#define   USBON_RPD_C				(1 << 17)
+#define   AP_C					(1 << 20)
+#define   AN_C					(1 << 21)
+#define   HIGHZ_C				(1 << 22)
+/* phase D */
+#define   USBOP_RPD_D				(1 << 24)
+#define   USBON_RPD_D				(1 << 25)
+#define   AP_D					(1 << 28)
+#define   AN_D					(1 << 29)
+#define   HIGHZ_D				(1 << 30)
+
+#define XUSB_AO_UHSIC_SLEEPWALK(x)		(0x120 + (x) * 4)
+/* phase A */
+#define   RPD_STROBE_A				(1 << 0)
+#define   RPD_DATA0_A				(1 << 1)
+#define   RPU_STROBE_A				(1 << 2)
+#define   RPU_DATA0_A				(1 << 3)
+/* phase B */
+#define   RPD_STROBE_B				(1 << 8)
+#define   RPD_DATA0_B				(1 << 9)
+#define   RPU_STROBE_B				(1 << 10)
+#define   RPU_DATA0_B				(1 << 11)
+/* phase C */
+#define   RPD_STROBE_C				(1 << 16)
+#define   RPD_DATA0_C				(1 << 17)
+#define   RPU_STROBE_C				(1 << 18)
+#define   RPU_DATA0_C				(1 << 19)
+/* phase D */
+#define   RPD_STROBE_D				(1 << 24)
+#define   RPD_DATA0_D				(1 << 25)
+#define   RPU_STROBE_D				(1 << 26)
+#define   RPU_DATA0_D				(1 << 27)
+
+#define XUSB_AO_UTMIP_PAD_CFG(x)		(0x130 + (x) * 4)
+#define   FSLS_USE_XUSB_AO			(1 << 3)
+#define   TRK_CTRL_USE_XUSB_AO			(1 << 4)
+#define   RPD_CTRL_USE_XUSB_AO			(1 << 5)
+#define   RPU_USE_XUSB_AO			(1 << 6)
+#define   VREG_USE_XUSB_AO			(1 << 7)
+#define   USBOP_VAL_PD				(1 << 8)
+#define   USBON_VAL_PD				(1 << 9)
+#define   E_DPD_OVRD_EN				(1 << 10)
+#define   E_DPD_OVRD_VAL			(1 << 11)
+
+#define XUSB_AO_UHSIC_PAD_CFG(x)		(0x150 + (x) * 4)
+#define   STROBE_VAL_PD				(1 << 0)
+#define   DATA0_VAL_PD				(1 << 1)
+#define   USE_XUSB_AO				(1 << 4)
+
 #define TEGRA186_LANE(_name, _offset, _shift, _mask, _type)		\
 	{								\
 		.name = _name,						\
@@ -130,16 +241,41 @@ struct tegra_xusb_fuse_calibration {
 	u32 rpd_ctrl;
 };
 
+struct tegra186_xusb_padctl_context {
+	u32 vbus_id;
+	u32 usb2_pad_mux;
+	u32 usb2_port_cap;
+	u32 ss_port_cap;
+};
+
 struct tegra186_xusb_padctl {
 	struct tegra_xusb_padctl base;
+	void __iomem *ao_regs;
 
 	struct tegra_xusb_fuse_calibration calib;
 
 	/* UTMI bias and tracking */
 	struct clk *usb2_trk_clk;
 	unsigned int bias_pad_enable;
+
+	/* padctl context */
+	struct tegra186_xusb_padctl_context context;
 };
 
+static inline void ao_writel(struct tegra186_xusb_padctl *priv, u32 value, unsigned int offset)
+{
+	dev_dbg(priv->base.dev, "ao %08x < %08x\n", offset, value);
+	writel(value, priv->ao_regs + offset);
+}
+
+static inline u32 ao_readl(struct tegra186_xusb_padctl *priv, unsigned int offset)
+{
+	u32 value = readl(priv->ao_regs + offset);
+
+	dev_dbg(priv->base.dev, "ao %08x > %08x\n", offset, value);
+	return value;
+}
+
 static inline struct tegra186_xusb_padctl *
 to_tegra186_xusb_padctl(struct tegra_xusb_padctl *padctl)
 {
@@ -180,9 +316,256 @@ static void tegra186_usb2_lane_remove(struct tegra_xusb_lane *lane)
 	kfree(usb2);
 }
 
+static int tegra186_utmi_enable_phy_sleepwalk(struct tegra_xusb_lane *lane,
+					      enum usb_device_speed speed)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra186_xusb_padctl *priv = to_tegra186_xusb_padctl(padctl);
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy enable sleepwalk UTMI %d speed %d\n", index, speed);
+
+	mutex_lock(&padctl->lock);
+
+	/* ensure sleepwalk logic is disabled */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value &= ~MASTER_ENABLE;
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	/* ensure sleepwalk logics are in low power mode */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value |= MASTER_CFG_SEL;
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	/* set debounce time */
+	value = ao_readl(priv, XUSB_AO_USB_DEBOUNCE_DEL);
+	value &= ~UTMIP_LINE_DEB_CNT(~0);
+	value |= UTMIP_LINE_DEB_CNT(1);
+	ao_writel(priv, value, XUSB_AO_USB_DEBOUNCE_DEL);
+
+	/* ensure fake events of sleepwalk logic are desiabled */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value &= ~(FAKE_USBOP_VAL | FAKE_USBON_VAL |
+		FAKE_USBOP_EN | FAKE_USBON_EN);
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	/* ensure wake events of sleepwalk logic are not latched */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value &= ~LINE_WAKEUP_EN;
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	/* disable wake event triggers of sleepwalk logic */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value &= ~WAKE_VAL(~0);
+	value |= WAKE_VAL_NONE;
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	/* power down the line state detectors of the pad */
+	value = ao_readl(priv, XUSB_AO_UTMIP_PAD_CFG(index));
+	value |= (USBOP_VAL_PD | USBON_VAL_PD);
+	ao_writel(priv, value, XUSB_AO_UTMIP_PAD_CFG(index));
+
+	/* save state per speed */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SAVED_STATE(index));
+	value &= ~SPEED(~0);
+	if (speed == USB_SPEED_HIGH)
+		value |= UTMI_HS;
+	else if (speed == USB_SPEED_FULL)
+		value |= UTMI_FS;
+	else if (speed == USB_SPEED_LOW)
+		value |= UTMI_LS;
+	else
+		value |= UTMI_RST;
+	ao_writel(priv, value, XUSB_AO_UTMIP_SAVED_STATE(index));
+
+	/* enable the trigger of the sleepwalk logic */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value |= LINEVAL_WALK_EN;
+	value &= ~WAKE_WALK_EN;
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	/* reset the walk pointer and clear the alarm of the sleepwalk logic,
+	 * as well as capture the configuration of the USB2.0 pad
+	 */
+	value = ao_readl(priv, XUSB_AO_UTMIP_TRIGGERS(index));
+	value |= (CLR_WALK_PTR | CLR_WAKE_ALARM | CAP_CFG);
+	ao_writel(priv, value, XUSB_AO_UTMIP_TRIGGERS(index));
+
+	/* setup the pull-ups and pull-downs of the signals during the four
+	 * stages of sleepwalk.
+	 * if device is connected, program sleepwalk logic to maintain a J and
+	 * keep driving K upon seeing remote wake.
+	 */
+	value = (USBOP_RPD_A | USBOP_RPD_B | USBOP_RPD_C | USBOP_RPD_D);
+	value |= (USBON_RPD_A | USBON_RPD_B | USBON_RPD_C | USBON_RPD_D);
+	if (speed == USB_SPEED_UNKNOWN) {
+		value |= (HIGHZ_A | HIGHZ_B | HIGHZ_C | HIGHZ_D);
+	} else if ((speed == USB_SPEED_HIGH) || (speed == USB_SPEED_FULL)) {
+		/* J state: D+/D- = high/low, K state: D+/D- = low/high */
+		value |= HIGHZ_A;
+		value |= (AP_A);
+		value |= (AN_B | AN_C | AN_D);
+	} else if (speed == USB_SPEED_LOW) {
+		/* J state: D+/D- = low/high, K state: D+/D- = high/low */
+		value |= HIGHZ_A;
+		value |= AN_A;
+		value |= (AP_B | AP_C | AP_D);
+	}
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK(index));
+
+	/* power up the line state detectors of the pad */
+	value = ao_readl(priv, XUSB_AO_UTMIP_PAD_CFG(index));
+	value &= ~(USBOP_VAL_PD | USBON_VAL_PD);
+	ao_writel(priv, value, XUSB_AO_UTMIP_PAD_CFG(index));
+
+	usleep_range(150, 200);
+
+	/* switch the electric control of the USB2.0 pad to XUSB_AO */
+	value = ao_readl(priv, XUSB_AO_UTMIP_PAD_CFG(index));
+	value |= (FSLS_USE_XUSB_AO | TRK_CTRL_USE_XUSB_AO |
+		RPD_CTRL_USE_XUSB_AO | RPU_USE_XUSB_AO | VREG_USE_XUSB_AO);
+	ao_writel(priv, value, XUSB_AO_UTMIP_PAD_CFG(index));
+
+	/* set the wake signaling trigger events */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value &= ~WAKE_VAL(~0);
+	value |= WAKE_VAL_ANY;
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	/* enable the wake detection */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value |= (MASTER_ENABLE | LINE_WAKEUP_EN);
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra186_utmi_disable_phy_sleepwalk(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra186_xusb_padctl *priv = to_tegra186_xusb_padctl(padctl);
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy disable sleepwalk UTMI %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	/* disable the wake detection */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value &= ~(MASTER_ENABLE | LINE_WAKEUP_EN);
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	/* switch the electric control of the USB2.0 pad to XUSB vcore logic */
+	value = ao_readl(priv, XUSB_AO_UTMIP_PAD_CFG(index));
+	value &= ~(FSLS_USE_XUSB_AO | TRK_CTRL_USE_XUSB_AO |
+		RPD_CTRL_USE_XUSB_AO | RPU_USE_XUSB_AO | VREG_USE_XUSB_AO);
+	ao_writel(priv, value, XUSB_AO_UTMIP_PAD_CFG(index));
+
+	/* disable wake event triggers of sleepwalk logic */
+	value = ao_readl(priv, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+	value &= ~WAKE_VAL(~0);
+	value |= WAKE_VAL_NONE;
+	ao_writel(priv, value, XUSB_AO_UTMIP_SLEEPWALK_CFG(index));
+
+	/* power down the line state detectors of the port */
+	value = ao_readl(priv, XUSB_AO_UTMIP_PAD_CFG(index));
+	value |= (USBOP_VAL_PD | USBON_VAL_PD);
+	ao_writel(priv, value, XUSB_AO_UTMIP_PAD_CFG(index));
+
+	/* clear alarm of the sleepwalk logic */
+	value = ao_readl(priv, XUSB_AO_UTMIP_TRIGGERS(index));
+	value |= CLR_WAKE_ALARM;
+	ao_writel(priv, value, XUSB_AO_UTMIP_TRIGGERS(index));
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra186_utmi_enable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy enable wake UTMI %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= USB2_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= USB2_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra186_utmi_disable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy disable wake UTMI %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	value &= ~ALL_WAKE_EVENTS;
+	value &= ~USB2_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= USB2_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static bool tegra186_utmi_phy_remote_wake_detected(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	u32 value;
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	if ((value & USB2_PORT_WAKE_INTERRUPT_ENABLE(index)) &&
+			(value & USB2_PORT_WAKEUP_EVENT(index)))
+		return true;
+
+	return false;
+}
+
 static const struct tegra_xusb_lane_ops tegra186_usb2_lane_ops = {
 	.probe = tegra186_usb2_lane_probe,
 	.remove = tegra186_usb2_lane_remove,
+	.enable_phy_sleepwalk = tegra186_utmi_enable_phy_sleepwalk,
+	.disable_phy_sleepwalk = tegra186_utmi_disable_phy_sleepwalk,
+	.enable_phy_wake = tegra186_utmi_enable_phy_wake,
+	.disable_phy_wake = tegra186_utmi_disable_phy_wake,
+	.remote_wake_detected = tegra186_utmi_phy_remote_wake_detected,
 };
 
 static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
@@ -656,10 +1039,140 @@ static void tegra186_usb3_lane_remove(struct tegra_xusb_lane *lane)
 	kfree(usb3);
 }
 
+static int tegra186_usb3_enable_phy_sleepwalk(struct tegra_xusb_lane *lane,
+					      enum usb_device_speed speed)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy enable sleepwalk USB3 %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_1);
+	value |= SSPX_ELPG_CLAMP_EN_EARLY(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_1);
+
+	usleep_range(100, 200);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_1);
+	value |= SSPX_ELPG_CLAMP_EN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_1);
+
+	usleep_range(250, 350);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra186_usb3_disable_phy_sleepwalk(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy disable sleepwalk USB3 %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_1);
+	value &= ~SSPX_ELPG_CLAMP_EN_EARLY(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_1);
+
+	usleep_range(100, 200);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_1);
+	value &= ~SSPX_ELPG_CLAMP_EN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_1);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra186_usb3_enable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy enable wake USB3 %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= SS_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= SS_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra186_usb3_disable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy disable wake USB3 %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	value &= ~ALL_WAKE_EVENTS;
+	value &= ~SS_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= SS_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static bool tegra186_usb3_phy_remote_wake_detected(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	u32 value;
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
+	if ((value & SS_PORT_WAKE_INTERRUPT_ENABLE(index)) && (value & SS_PORT_WAKEUP_EVENT(index)))
+		return true;
+
+	return false;
+}
+
 static const struct tegra_xusb_lane_ops tegra186_usb3_lane_ops = {
 	.probe = tegra186_usb3_lane_probe,
 	.remove = tegra186_usb3_lane_remove,
+	.enable_phy_sleepwalk = tegra186_usb3_enable_phy_sleepwalk,
+	.disable_phy_sleepwalk = tegra186_usb3_disable_phy_sleepwalk,
+	.enable_phy_wake = tegra186_usb3_enable_phy_wake,
+	.disable_phy_wake = tegra186_usb3_disable_phy_wake,
+	.remote_wake_detected = tegra186_usb3_phy_remote_wake_detected,
 };
+
 static int tegra186_usb3_port_enable(struct tegra_xusb_port *port)
 {
 	return 0;
@@ -913,7 +1426,9 @@ static struct tegra_xusb_padctl *
 tegra186_xusb_padctl_probe(struct device *dev,
 			   const struct tegra_xusb_padctl_soc *soc)
 {
+	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra186_xusb_padctl *priv;
+	struct resource *res;
 	int err;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -923,6 +1438,11 @@ tegra186_xusb_padctl_probe(struct device *dev,
 	priv->base.dev = dev;
 	priv->base.soc = soc;
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ao");
+	priv->ao_regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->ao_regs))
+		return priv->ao_regs;
+
 	err = tegra186_xusb_read_fuse_calibration(priv);
 	if (err < 0)
 		return ERR_PTR(err);
@@ -930,6 +1450,40 @@ tegra186_xusb_padctl_probe(struct device *dev,
 	return &priv->base;
 }
 
+static void tegra186_xusb_padctl_save(struct tegra_xusb_padctl *padctl)
+{
+	struct tegra186_xusb_padctl *priv = to_tegra186_xusb_padctl(padctl);
+
+	priv->context.vbus_id = padctl_readl(padctl, USB2_VBUS_ID);
+	priv->context.usb2_pad_mux = padctl_readl(padctl, XUSB_PADCTL_USB2_PAD_MUX);
+	priv->context.usb2_port_cap = padctl_readl(padctl, XUSB_PADCTL_USB2_PORT_CAP);
+	priv->context.ss_port_cap = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_CAP);
+}
+
+static void tegra186_xusb_padctl_restore(struct tegra_xusb_padctl *padctl)
+{
+	struct tegra186_xusb_padctl *priv = to_tegra186_xusb_padctl(padctl);
+
+	padctl_writel(padctl, priv->context.usb2_pad_mux, XUSB_PADCTL_USB2_PAD_MUX);
+	padctl_writel(padctl, priv->context.usb2_port_cap, XUSB_PADCTL_USB2_PORT_CAP);
+	padctl_writel(padctl, priv->context.ss_port_cap, XUSB_PADCTL_SS_PORT_CAP);
+	padctl_writel(padctl, priv->context.vbus_id, USB2_VBUS_ID);
+}
+
+static int tegra186_xusb_padctl_suspend_noirq(struct tegra_xusb_padctl *padctl)
+{
+	tegra186_xusb_padctl_save(padctl);
+
+	return 0;
+}
+
+static int tegra186_xusb_padctl_resume_noirq(struct tegra_xusb_padctl *padctl)
+{
+	tegra186_xusb_padctl_restore(padctl);
+
+	return 0;
+}
+
 static void tegra186_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
 {
 }
@@ -937,6 +1491,8 @@ static void tegra186_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
 static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.probe = tegra186_xusb_padctl_probe,
 	.remove = tegra186_xusb_padctl_remove,
+	.suspend_noirq = tegra186_xusb_padctl_suspend_noirq,
+	.resume_noirq = tegra186_xusb_padctl_resume_noirq,
 	.vbus_override = tegra186_xusb_padctl_vbus_override,
 };
 
-- 
2.30.2

