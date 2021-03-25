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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B232AC433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71E7B61A25
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCYQl5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhCYQlY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:41:24 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85574C06174A;
        Thu, 25 Mar 2021 09:41:23 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id k8so2970057wrc.3;
        Thu, 25 Mar 2021 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQoxEc3w2v6pmQQ4kNvF8Hq2eWdul3mxmXS3gmEZTbs=;
        b=O7C93sT5s7lwg7QZs0Vi8UVCN5yYYHLV9zDAqg+u6x7pMfLxXs6SgdvdFfV5jQIPYU
         NMzOWoovUUzoGKpBLD1tYSk3SWxqUQU4CfBt0DDLA6uiwoO07k9PhZfHqZ6nSJv3/dca
         tKz97fjkoWMvy7NyxzJ0ZrdZwPTMWQRwhi5iMiCEOsjSvtG44GE/mLdKj3i93zYZSn+k
         Arb2VURIrHwUz55IsHmRxCBL4TrGAFfbD/J5b/R/cZhle2e8XAW+CSRJnPNTU7nP9k1U
         z08ih4fyaJnP+SZhR1lL6Osk1Uuw55vIa5I2IhPZPDRttvDjykK47CqAJCZXpUj/S5/D
         42Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQoxEc3w2v6pmQQ4kNvF8Hq2eWdul3mxmXS3gmEZTbs=;
        b=P5bCBeFdPkAndhhyiaWw1egyOKZ0k/XDK/iNTB/rvNVcEgC0ovpuhS4CV9NBj/AsJI
         q8mZCiKJGrMzHOJTj9m20JBIg/ZLOgPIWy65qES4c2eDLB+b9vreFL0NIBz2zGt5XZZX
         bV2TKy8h+jRqIN4Zu5c0qhJsWIzQNJA2OC8DWHHJNM/Equm25t5GUV7tjIJt/b6V1o6e
         XYKsH2xObxPBNTn07bvukJ5csUDTfP4QwQnGP69jTN/4IcDXBFkxLK4BWa4YShnWrK7w
         pB7owqGfhsUMU1ILvs9NKXeSN2fvNwCbzF3AYhZbcsl9qV9XsShzAsQqv1mDvAsHRPdq
         A/7g==
X-Gm-Message-State: AOAM531kXMZdlVKNO7mYZQTcruZqS8VNIzwhGIgR+jhweFZ4x5o6GBfA
        1SUtBUmt4BZnmw2JBUU6hLU=
X-Google-Smtp-Source: ABdhPJxxRLZQrWc1QNx+cVDagXSMKfZb41M8lvGuvUmw/d4uMq0gzUegUyvI+3EEouK41vlLekMTqA==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr10053130wre.234.1616690482004;
        Thu, 25 Mar 2021 09:41:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 1sm12040506wmj.0.2021.03.25.09.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:41:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v8 09/13] phy: tegra: xusb: Add wake/sleepwalk for Tegra210
Date:   Thu, 25 Mar 2021 17:40:53 +0100
Message-Id: <20210325164057.793954-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

This commit implements Tegra210 XUSB PADCTL wake and sleepwalk
routines. Sleepwalk logic is in PMC (always-on) hardware block.
PMC driver provides managed access to the sleepwalk registers
via regmap framework.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 930 ++++++++++++++++++++++++++++++
 1 file changed, 930 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index b038d032fea1..8af73ba78ad7 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -16,6 +16,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/regmap.h>
+#include <linux/of_platform.h>
 
 #include <soc/tegra/fuse.h>
 
@@ -52,6 +54,20 @@
 #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 5))
 #define XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED 0x7
 
+#define XUSB_PADCTL_ELPG_PROGRAM_0 0x20
+#define   USB2_PORT_WAKE_INTERRUPT_ENABLE(x)      BIT((x))
+#define   USB2_PORT_WAKEUP_EVENT(x)               BIT((x) + 7)
+#define   SS_PORT_WAKE_INTERRUPT_ENABLE(x)        BIT((x) + 14)
+#define   SS_PORT_WAKEUP_EVENT(x)                 BIT((x) + 21)
+#define   USB2_HSIC_PORT_WAKE_INTERRUPT_ENABLE(x) BIT((x) + 28)
+#define   USB2_HSIC_PORT_WAKEUP_EVENT(x)          BIT((x) + 30)
+#define   ALL_WAKE_EVENTS ( \
+		USB2_PORT_WAKEUP_EVENT(0) | USB2_PORT_WAKEUP_EVENT(1) | \
+		USB2_PORT_WAKEUP_EVENT(2) | USB2_PORT_WAKEUP_EVENT(3) | \
+		SS_PORT_WAKEUP_EVENT(0) | SS_PORT_WAKEUP_EVENT(1) | \
+		SS_PORT_WAKEUP_EVENT(2) | SS_PORT_WAKEUP_EVENT(3) | \
+		USB2_HSIC_PORT_WAKEUP_EVENT(0))
+
 #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
 #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31)
 #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN_EARLY (1 << 30)
@@ -90,6 +106,8 @@
 #define XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DR (1 << 2)
 #define XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DISC_OVRD (1 << 1)
 #define XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_CHRP_OVRD (1 << 0)
+#define   RPD_CTRL(x)                      (((x) & 0x1f) << 26)
+#define   RPD_CTRL_VALUE(x)                (((x) >> 26) & 0x1f)
 
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL0 0x284
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD (1 << 11)
@@ -108,6 +126,8 @@
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_SHIFT 12
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_MASK 0x7f
 #define XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_VAL 0x1e
+#define   TCTRL_VALUE(x)                (((x) & 0x3f) >> 0)
+#define   PCTRL_VALUE(x)                (((x) >> 6) & 0x3f)
 
 #define XUSB_PADCTL_HSIC_PADX_CTL0(x) (0x300 + (x) * 0x20)
 #define XUSB_PADCTL_HSIC_PAD_CTL0_RPU_STROBE (1 << 18)
@@ -251,16 +271,161 @@
 #define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
 #define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_GROUNDED 0
 
+/* USB2 SLEEPWALK registers */
+#define UTMIP(_port, _offset1, _offset2) \
+		(((_port) <= 2) ? (_offset1) : (_offset2))
+
+#define PMC_UTMIP_UHSIC_SLEEP_CFG(x)	UTMIP(x, 0x1fc, 0x4d0)
+#define   UTMIP_MASTER_ENABLE(x)		UTMIP(x, BIT(8 * (x)), BIT(0))
+#define   UTMIP_FSLS_USE_PMC(x)			UTMIP(x, BIT(8 * (x) + 1), \
+							BIT(1))
+#define   UTMIP_PCTRL_USE_PMC(x)		UTMIP(x, BIT(8 * (x) + 2), \
+							BIT(2))
+#define   UTMIP_TCTRL_USE_PMC(x)		UTMIP(x, BIT(8 * (x) + 3), \
+							BIT(3))
+#define   UTMIP_WAKE_VAL(_port, _value)		(((_value) & 0xf) << \
+					(UTMIP(_port, 8 * (_port) + 4, 4)))
+#define   UTMIP_WAKE_VAL_NONE(_port)		UTMIP_WAKE_VAL(_port, 12)
+#define   UTMIP_WAKE_VAL_ANY(_port)		UTMIP_WAKE_VAL(_port, 15)
+
+#define PMC_UTMIP_UHSIC_SLEEP_CFG1	(0x4d0)
+#define   UTMIP_RPU_SWITC_LOW_USE_PMC_PX(x)	BIT((x) + 8)
+#define   UTMIP_RPD_CTRL_USE_PMC_PX(x)		BIT((x) + 16)
+
+#define PMC_UTMIP_MASTER_CONFIG		(0x274)
+#define   UTMIP_PWR(x)				UTMIP(x, BIT(x), BIT(4))
+#define   UHSIC_PWR(x)				BIT(3)
+
+#define PMC_USB_DEBOUNCE_DEL		(0xec)
+#define   DEBOUNCE_VAL(x)			(((x) & 0xffff) << 0)
+#define   UTMIP_LINE_DEB_CNT(x)			(((x) & 0xf) << 16)
+#define   UHSIC_LINE_DEB_CNT(x)			(((x) & 0xf) << 20)
+
+#define PMC_UTMIP_UHSIC_FAKE(x)		UTMIP(x, 0x218, 0x294)
+#define   UTMIP_FAKE_USBOP_VAL(x)		UTMIP(x, BIT(4 * (x)), BIT(8))
+#define   UTMIP_FAKE_USBON_VAL(x)		UTMIP(x, BIT(4 * (x) + 1), \
+							BIT(9))
+#define   UTMIP_FAKE_USBOP_EN(x)		UTMIP(x, BIT(4 * (x) + 2), \
+							BIT(10))
+#define   UTMIP_FAKE_USBON_EN(x)		UTMIP(x, BIT(4 * (x) + 3), \
+							BIT(11))
+
+#define PMC_UTMIP_UHSIC_SLEEPWALK_CFG(x)	UTMIP(x, 0x200, 0x288)
+#define   UTMIP_LINEVAL_WALK_EN(x)		UTMIP(x, BIT(8 * (x) + 7), \
+							BIT(15))
+
+#define PMC_USB_AO			(0xf0)
+#define   USBOP_VAL_PD(x)			UTMIP(x, BIT(4 * (x)), BIT(20))
+#define   USBON_VAL_PD(x)			UTMIP(x, BIT(4 * (x) + 1), \
+							BIT(21))
+#define   STROBE_VAL_PD(x)			BIT(12)
+#define   DATA0_VAL_PD(x)			BIT(13)
+#define   DATA1_VAL_PD				BIT(24)
+
+#define PMC_UTMIP_UHSIC_SAVED_STATE(x)	UTMIP(x, 0x1f0, 0x280)
+#define   SPEED(_port, _value)			(((_value) & 0x3) << \
+						(UTMIP(_port, 8 * (_port), 8)))
+#define   UTMI_HS(_port)			SPEED(_port, 0)
+#define   UTMI_FS(_port)			SPEED(_port, 1)
+#define   UTMI_LS(_port)			SPEED(_port, 2)
+#define   UTMI_RST(_port)			SPEED(_port, 3)
+
+#define PMC_UTMIP_UHSIC_TRIGGERS		(0x1ec)
+#define   UTMIP_CLR_WALK_PTR(x)			UTMIP(x, BIT(x), BIT(16))
+#define   UTMIP_CAP_CFG(x)			UTMIP(x, BIT((x) + 4), BIT(17))
+#define   UTMIP_CLR_WAKE_ALARM(x)		UTMIP(x, BIT((x) + 12), \
+							BIT(19))
+#define   UHSIC_CLR_WALK_PTR			BIT(3)
+#define   UHSIC_CLR_WAKE_ALARM			BIT(15)
+
+#define PMC_UTMIP_SLEEPWALK_PX(x)	UTMIP(x, 0x204 + (4 * (x)), \
+							0x4e0)
+/* phase A */
+#define   UTMIP_USBOP_RPD_A			BIT(0)
+#define   UTMIP_USBON_RPD_A			BIT(1)
+#define   UTMIP_AP_A				BIT(4)
+#define   UTMIP_AN_A				BIT(5)
+#define   UTMIP_HIGHZ_A				BIT(6)
+/* phase B */
+#define   UTMIP_USBOP_RPD_B			BIT(8)
+#define   UTMIP_USBON_RPD_B			BIT(9)
+#define   UTMIP_AP_B				BIT(12)
+#define   UTMIP_AN_B				BIT(13)
+#define   UTMIP_HIGHZ_B				BIT(14)
+/* phase C */
+#define   UTMIP_USBOP_RPD_C			BIT(16)
+#define   UTMIP_USBON_RPD_C			BIT(17)
+#define   UTMIP_AP_C				BIT(20)
+#define   UTMIP_AN_C				BIT(21)
+#define   UTMIP_HIGHZ_C				BIT(22)
+/* phase D */
+#define   UTMIP_USBOP_RPD_D			BIT(24)
+#define   UTMIP_USBON_RPD_D			BIT(25)
+#define   UTMIP_AP_D				BIT(28)
+#define   UTMIP_AN_D				BIT(29)
+#define   UTMIP_HIGHZ_D				BIT(30)
+
+#define PMC_UTMIP_UHSIC_LINE_WAKEUP	(0x26c)
+#define   UTMIP_LINE_WAKEUP_EN(x)		UTMIP(x, BIT(x), BIT(4))
+#define   UHSIC_LINE_WAKEUP_EN			BIT(3)
+
+#define PMC_UTMIP_TERM_PAD_CFG		(0x1f8)
+#define   PCTRL_VAL(x)				(((x) & 0x3f) << 1)
+#define   TCTRL_VAL(x)				(((x) & 0x3f) << 7)
+
+#define PMC_UTMIP_PAD_CFGX(x)		(0x4c0 + (4 * (x)))
+#define   RPD_CTRL_PX(x)			(((x) & 0x1f) << 22)
+
+#define PMC_UHSIC_SLEEP_CFG	PMC_UTMIP_UHSIC_SLEEP_CFG(0)
+#define   UHSIC_MASTER_ENABLE			BIT(24)
+#define   UHSIC_WAKE_VAL(_value)		(((_value) & 0xf) << 28)
+#define   UHSIC_WAKE_VAL_SD10			UHSIC_WAKE_VAL(2)
+#define   UHSIC_WAKE_VAL_NONE			UHSIC_WAKE_VAL(12)
+
+#define PMC_UHSIC_FAKE			PMC_UTMIP_UHSIC_FAKE(0)
+#define   UHSIC_FAKE_STROBE_VAL			BIT(12)
+#define   UHSIC_FAKE_DATA_VAL			BIT(13)
+#define   UHSIC_FAKE_STROBE_EN			BIT(14)
+#define   UHSIC_FAKE_DATA_EN			BIT(15)
+
+#define PMC_UHSIC_SAVED_STATE		PMC_UTMIP_UHSIC_SAVED_STATE(0)
+#define   UHSIC_MODE(_value)			(((_value) & 0x1) << 24)
+#define   UHSIC_HS				UHSIC_MODE(0)
+#define   UHSIC_RST				UHSIC_MODE(1)
+
+#define PMC_UHSIC_SLEEPWALK_CFG		PMC_UTMIP_UHSIC_SLEEPWALK_CFG(0)
+#define   UHSIC_WAKE_WALK_EN			BIT(30)
+#define   UHSIC_LINEVAL_WALK_EN			BIT(31)
+
+#define PMC_UHSIC_SLEEPWALK_P0		(0x210)
+#define   UHSIC_DATA0_RPD_A			BIT(1)
+#define   UHSIC_DATA0_RPU_B			BIT(11)
+#define   UHSIC_DATA0_RPU_C			BIT(19)
+#define   UHSIC_DATA0_RPU_D			BIT(27)
+#define   UHSIC_STROBE_RPU_A			BIT(2)
+#define   UHSIC_STROBE_RPD_B			BIT(8)
+#define   UHSIC_STROBE_RPD_C			BIT(16)
+#define   UHSIC_STROBE_RPD_D			BIT(24)
+
 struct tegra210_xusb_fuse_calibration {
 	u32 hs_curr_level[4];
 	u32 hs_term_range_adj;
 	u32 rpd_ctrl;
 };
 
+struct tegra210_xusb_padctl_context {
+	u32 usb2_pad_mux;
+	u32 usb2_port_cap;
+	u32 ss_port_map;
+	u32 usb3_pad_mux;
+};
+
 struct tegra210_xusb_padctl {
 	struct tegra_xusb_padctl base;
+	struct regmap *regmap;
 
 	struct tegra210_xusb_fuse_calibration fuse;
+	struct tegra210_xusb_padctl_context context;
 };
 
 static inline struct tegra210_xusb_padctl *
@@ -890,6 +1055,663 @@ static int tegra210_hsic_set_idle(struct tegra_xusb_padctl *padctl,
 	return 0;
 }
 
+static int tegra210_usb3_enable_phy_sleepwalk(struct tegra_xusb_lane *lane,
+					      enum usb_device_speed speed)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int port = tegra210_usb3_lane_map(lane);
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	if (port < 0) {
+		dev_err(dev, "invalid usb3 port number\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "phy enable sleepwalk usb3 %d\n", port);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(port);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(port);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(250, 350);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_usb3_disable_phy_sleepwalk(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int port = tegra210_usb3_lane_map(lane);
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	if (port < 0) {
+		dev_err(dev, "invalid usb3 port number\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "phy disable sleepwalk usb3 %d\n", port);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(port);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(port);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_usb3_enable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int port = tegra210_usb3_lane_map(lane);
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	if (port < 0) {
+		dev_err(dev, "invalid usb3 port number\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "phy enable wake usb3 %d\n", port);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= SS_PORT_WAKEUP_EVENT(port);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= SS_PORT_WAKE_INTERRUPT_ENABLE(port);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_usb3_disable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int port = tegra210_usb3_lane_map(lane);
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	if (port < 0) {
+		dev_err(dev, "invalid usb3 port number\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "phy disable wake usb3 %d\n", port);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value &= ~SS_PORT_WAKE_INTERRUPT_ENABLE(port);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= SS_PORT_WAKEUP_EVENT(port);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static bool tegra210_usb3_phy_remote_wake_detected(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int index = tegra210_usb3_lane_map(lane);
+	u32 value;
+
+	if (index < 0)
+		return false;
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	if ((value & SS_PORT_WAKE_INTERRUPT_ENABLE(index)) && (value & SS_PORT_WAKEUP_EVENT(index)))
+		return true;
+
+	return false;
+}
+
+static int tegra210_utmi_enable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy enable wake on usb2 %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= USB2_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= USB2_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_utmi_disable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy disable wake on usb2 %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value &= ~USB2_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= USB2_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static bool tegra210_utmi_phy_remote_wake_detected(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	u32 value;
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	if ((value & USB2_PORT_WAKE_INTERRUPT_ENABLE(index)) &&
+	    (value & USB2_PORT_WAKEUP_EVENT(index)))
+		return true;
+
+	return false;
+}
+
+static int tegra210_hsic_enable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy enable wake on hsic %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= USB2_HSIC_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= USB2_HSIC_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static int tegra210_hsic_disable_phy_wake(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	struct device *dev = padctl->dev;
+	u32 value;
+
+	dev_dbg(dev, "phy disable wake on hsic %d\n", index);
+
+	mutex_lock(&padctl->lock);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value &= ~USB2_HSIC_PORT_WAKE_INTERRUPT_ENABLE(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	usleep_range(10, 20);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	value &= ~ALL_WAKE_EVENTS;
+	value |= USB2_HSIC_PORT_WAKEUP_EVENT(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_0);
+
+	mutex_unlock(&padctl->lock);
+
+	return 0;
+}
+
+static bool tegra210_hsic_phy_remote_wake_detected(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	u32 value;
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_0);
+	if ((value & USB2_HSIC_PORT_WAKE_INTERRUPT_ENABLE(index)) &&
+	    (value & USB2_HSIC_PORT_WAKEUP_EVENT(index)))
+		return true;
+
+	return false;
+}
+
+#define padctl_pmc_readl(_priv, _offset)						\
+({											\
+	u32 value;									\
+	WARN(regmap_read(_priv->regmap, _offset, &value), "read %s failed\n", #_offset);\
+	value;										\
+})
+
+#define padctl_pmc_writel(_priv, _value, _offset)					\
+	WARN(regmap_write(_priv->regmap, _offset, _value), "write %s failed\n", #_offset)
+
+static int tegra210_pmc_utmi_enable_phy_sleepwalk(struct tegra_xusb_lane *lane,
+						  enum usb_device_speed speed)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra210_xusb_padctl *priv = to_tegra210_xusb_padctl(padctl);
+	struct device *dev = padctl->dev;
+	unsigned int port = lane->index;
+	u32 value, tctrl, pctrl, rpd_ctrl;
+
+	if (!priv->regmap)
+		return -EOPNOTSUPP;
+
+	if (speed > USB_SPEED_HIGH)
+		return -EINVAL;
+
+	dev_dbg(dev, "phy enable sleepwalk usb2 %d speed %d\n", port, speed);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+	tctrl = TCTRL_VALUE(value);
+	pctrl = PCTRL_VALUE(value);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(port));
+	rpd_ctrl = RPD_CTRL_VALUE(value);
+
+	/* ensure sleepwalk logic is disabled */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	value &= ~UTMIP_MASTER_ENABLE(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	/* ensure sleepwalk logics are in low power mode */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_MASTER_CONFIG);
+	value |= UTMIP_PWR(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_MASTER_CONFIG);
+
+	/* set debounce time */
+	value = padctl_pmc_readl(priv, PMC_USB_DEBOUNCE_DEL);
+	value &= ~UTMIP_LINE_DEB_CNT(~0);
+	value |= UTMIP_LINE_DEB_CNT(0x1);
+	padctl_pmc_writel(priv, value, PMC_USB_DEBOUNCE_DEL);
+
+	/* ensure fake events of sleepwalk logic are desiabled */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_FAKE(port));
+	value &= ~(UTMIP_FAKE_USBOP_VAL(port) | UTMIP_FAKE_USBON_VAL(port) |
+			UTMIP_FAKE_USBOP_EN(port) | UTMIP_FAKE_USBON_EN(port));
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_FAKE(port));
+
+	/* ensure wake events of sleepwalk logic are not latched */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	value &= ~UTMIP_LINE_WAKEUP_EN(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	/* disable wake event triggers of sleepwalk logic */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	value &= ~UTMIP_WAKE_VAL(port, ~0);
+	value |= UTMIP_WAKE_VAL_NONE(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	/* power down the line state detectors of the pad */
+	value = padctl_pmc_readl(priv, PMC_USB_AO);
+	value |= (USBOP_VAL_PD(port) | USBON_VAL_PD(port));
+	padctl_pmc_writel(priv, value, PMC_USB_AO);
+
+	/* save state per speed */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SAVED_STATE(port));
+	value &= ~SPEED(port, ~0);
+	if (speed == USB_SPEED_HIGH)
+		value |= UTMI_HS(port);
+	else if (speed == USB_SPEED_FULL)
+		value |= UTMI_FS(port);
+	else if (speed == USB_SPEED_LOW)
+		value |= UTMI_LS(port);
+	else
+		value |= UTMI_RST(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SAVED_STATE(port));
+
+	/* enable the trigger of the sleepwalk logic */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEPWALK_CFG(port));
+	value |= UTMIP_LINEVAL_WALK_EN(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEPWALK_CFG(port));
+
+	/* reset the walk pointer and clear the alarm of the sleepwalk logic,
+	 * as well as capture the configuration of the USB2.0 pad
+	 */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_TRIGGERS);
+	value |= (UTMIP_CLR_WALK_PTR(port) | UTMIP_CLR_WAKE_ALARM(port) |
+		UTMIP_CAP_CFG(port));
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_TRIGGERS);
+
+	/* program electrical parameters read from XUSB PADCTL */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_TERM_PAD_CFG);
+	value &= ~(TCTRL_VAL(~0) | PCTRL_VAL(~0));
+	value |= (TCTRL_VAL(tctrl) | PCTRL_VAL(pctrl));
+	padctl_pmc_writel(priv, value, PMC_UTMIP_TERM_PAD_CFG);
+
+	value = padctl_pmc_readl(priv, PMC_UTMIP_PAD_CFGX(port));
+	value &= ~RPD_CTRL_PX(~0);
+	value |= RPD_CTRL_PX(rpd_ctrl);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_PAD_CFGX(port));
+
+	/* setup the pull-ups and pull-downs of the signals during the four
+	 * stages of sleepwalk.
+	 * if device is connected, program sleepwalk logic to maintain a J and
+	 * keep driving K upon seeing remote wake.
+	 */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_SLEEPWALK_PX(port));
+	value = (UTMIP_USBOP_RPD_A | UTMIP_USBOP_RPD_B | UTMIP_USBOP_RPD_C |
+		UTMIP_USBOP_RPD_D);
+	value |= (UTMIP_USBON_RPD_A | UTMIP_USBON_RPD_B | UTMIP_USBON_RPD_C |
+		UTMIP_USBON_RPD_D);
+	if (speed == USB_SPEED_UNKNOWN) {
+		value |= (UTMIP_HIGHZ_A | UTMIP_HIGHZ_B | UTMIP_HIGHZ_C |
+			UTMIP_HIGHZ_D);
+	} else if ((speed == USB_SPEED_HIGH) || (speed == USB_SPEED_FULL)) {
+		/* J state: D+/D- = high/low, K state: D+/D- = low/high */
+		value |= UTMIP_HIGHZ_A;
+		value |= UTMIP_AP_A;
+		value |= (UTMIP_AN_B | UTMIP_AN_C | UTMIP_AN_D);
+	} else if (speed == USB_SPEED_LOW) {
+		/* J state: D+/D- = low/high, K state: D+/D- = high/low */
+		value |= UTMIP_HIGHZ_A;
+		value |= UTMIP_AN_A;
+		value |= (UTMIP_AP_B | UTMIP_AP_C | UTMIP_AP_D);
+	}
+	padctl_pmc_writel(priv, value, PMC_UTMIP_SLEEPWALK_PX(port));
+
+	/* power up the line state detectors of the pad */
+	value = padctl_pmc_readl(priv, PMC_USB_AO);
+	value &= ~(USBOP_VAL_PD(port) | USBON_VAL_PD(port));
+	padctl_pmc_writel(priv, value, PMC_USB_AO);
+
+	usleep_range(50, 100);
+
+	/* switch the electric control of the USB2.0 pad to PMC */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	value |= (UTMIP_FSLS_USE_PMC(port) | UTMIP_PCTRL_USE_PMC(port) |
+			UTMIP_TCTRL_USE_PMC(port));
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG1);
+	value |= (UTMIP_RPD_CTRL_USE_PMC_PX(port) |
+			UTMIP_RPU_SWITC_LOW_USE_PMC_PX(port));
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG1);
+
+	/* set the wake signaling trigger events */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	value &= ~UTMIP_WAKE_VAL(port, ~0);
+	value |= UTMIP_WAKE_VAL_ANY(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	/* enable the wake detection */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	value |= UTMIP_MASTER_ENABLE(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	value |= UTMIP_LINE_WAKEUP_EN(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	return 0;
+}
+
+static int tegra210_pmc_utmi_disable_phy_sleepwalk(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra210_xusb_padctl *priv = to_tegra210_xusb_padctl(padctl);
+	struct device *dev = padctl->dev;
+	unsigned int port = lane->index;
+	u32 value;
+
+	if (!priv->regmap)
+		return -EOPNOTSUPP;
+
+	dev_dbg(dev, "phy disable sleepwalk usb2 %d\n", port);
+
+	/* disable the wake detection */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	value &= ~UTMIP_MASTER_ENABLE(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	value &= ~UTMIP_LINE_WAKEUP_EN(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	/* switch the electric control of the USB2.0 pad to XUSB or USB2 */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	value &= ~(UTMIP_FSLS_USE_PMC(port) | UTMIP_PCTRL_USE_PMC(port) |
+			UTMIP_TCTRL_USE_PMC(port));
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG1);
+	value &= ~(UTMIP_RPD_CTRL_USE_PMC_PX(port) |
+			UTMIP_RPU_SWITC_LOW_USE_PMC_PX(port));
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG1);
+
+	/* disable wake event triggers of sleepwalk logic */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+	value &= ~UTMIP_WAKE_VAL(port, ~0);
+	value |= UTMIP_WAKE_VAL_NONE(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_SLEEP_CFG(port));
+
+	/* power down the line state detectors of the port */
+	value = padctl_pmc_readl(priv, PMC_USB_AO);
+	value |= (USBOP_VAL_PD(port) | USBON_VAL_PD(port));
+	padctl_pmc_writel(priv, value, PMC_USB_AO);
+
+	/* clear alarm of the sleepwalk logic */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_TRIGGERS);
+	value |= UTMIP_CLR_WAKE_ALARM(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_TRIGGERS);
+
+	return 0;
+}
+
+static int tegra210_pmc_hsic_enable_phy_sleepwalk(struct tegra_xusb_lane *lane,
+						  enum usb_device_speed speed)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra210_xusb_padctl *priv = to_tegra210_xusb_padctl(padctl);
+	struct device *dev = padctl->dev;
+	unsigned int port = lane->index;
+	u32 value;
+
+	if (!priv->regmap)
+		return -EOPNOTSUPP;
+
+	dev_dbg(dev, "phy enable sleepwalk hsic %d\n", port);
+
+	/* ensure sleepwalk logic is disabled */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_SLEEP_CFG);
+	value &= ~UHSIC_MASTER_ENABLE;
+	padctl_pmc_writel(priv, value, PMC_UHSIC_SLEEP_CFG);
+
+	/* ensure sleepwalk logics are in low power mode */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_MASTER_CONFIG);
+	value |= UHSIC_PWR(port);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_MASTER_CONFIG);
+
+	/* set debounce time */
+	value = padctl_pmc_readl(priv, PMC_USB_DEBOUNCE_DEL);
+	value &= ~UHSIC_LINE_DEB_CNT(~0);
+	value |= UHSIC_LINE_DEB_CNT(0x1);
+	padctl_pmc_writel(priv, value, PMC_USB_DEBOUNCE_DEL);
+
+	/* ensure fake events of sleepwalk logic are desiabled */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_FAKE);
+	value &= ~(UHSIC_FAKE_STROBE_VAL | UHSIC_FAKE_DATA_VAL |
+			UHSIC_FAKE_STROBE_EN | UHSIC_FAKE_DATA_EN);
+	padctl_pmc_writel(priv, value, PMC_UHSIC_FAKE);
+
+	/* ensure wake events of sleepwalk logic are not latched */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	value &= ~UHSIC_LINE_WAKEUP_EN;
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	/* disable wake event triggers of sleepwalk logic */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_SLEEP_CFG);
+	value &= ~UHSIC_WAKE_VAL(~0);
+	value |= UHSIC_WAKE_VAL_NONE;
+	padctl_pmc_writel(priv, value, PMC_UHSIC_SLEEP_CFG);
+
+	/* power down the line state detectors of the port */
+	value = padctl_pmc_readl(priv, PMC_USB_AO);
+	value |= (STROBE_VAL_PD(port) | DATA0_VAL_PD(port) | DATA1_VAL_PD);
+	padctl_pmc_writel(priv, value, PMC_USB_AO);
+
+	/* save state, HSIC always comes up as HS */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_SAVED_STATE);
+	value &= ~UHSIC_MODE(~0);
+	value |= UHSIC_HS;
+	padctl_pmc_writel(priv, value, PMC_UHSIC_SAVED_STATE);
+
+	/* enable the trigger of the sleepwalk logic */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_SLEEPWALK_CFG);
+	value |= (UHSIC_WAKE_WALK_EN | UHSIC_LINEVAL_WALK_EN);
+	padctl_pmc_writel(priv, value, PMC_UHSIC_SLEEPWALK_CFG);
+
+	/* reset the walk pointer and clear the alarm of the sleepwalk logic,
+	 * as well as capture the configuration of the USB2.0 port
+	 */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_TRIGGERS);
+	value |= (UHSIC_CLR_WALK_PTR | UHSIC_CLR_WAKE_ALARM);
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_TRIGGERS);
+
+	/* setup the pull-ups and pull-downs of the signals during the four
+	 * stages of sleepwalk.
+	 * maintain a HSIC IDLE and keep driving HSIC RESUME upon remote wake
+	 */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_SLEEPWALK_P0);
+	value = (UHSIC_DATA0_RPD_A | UHSIC_DATA0_RPU_B | UHSIC_DATA0_RPU_C |
+		UHSIC_DATA0_RPU_D);
+	value |= (UHSIC_STROBE_RPU_A | UHSIC_STROBE_RPD_B | UHSIC_STROBE_RPD_C |
+		UHSIC_STROBE_RPD_D);
+	padctl_pmc_writel(priv, value, PMC_UHSIC_SLEEPWALK_P0);
+
+	/* power up the line state detectors of the port */
+	value = padctl_pmc_readl(priv, PMC_USB_AO);
+	value &= ~(STROBE_VAL_PD(port) | DATA0_VAL_PD(port) | DATA1_VAL_PD);
+	padctl_pmc_writel(priv, value, PMC_USB_AO);
+
+	usleep_range(50, 100);
+
+	/* set the wake signaling trigger events */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_SLEEP_CFG);
+	value &= ~UHSIC_WAKE_VAL(~0);
+	value |= UHSIC_WAKE_VAL_SD10;
+	padctl_pmc_writel(priv, value, PMC_UHSIC_SLEEP_CFG);
+
+	/* enable the wake detection */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_SLEEP_CFG);
+	value |= UHSIC_MASTER_ENABLE;
+	padctl_pmc_writel(priv, value, PMC_UHSIC_SLEEP_CFG);
+
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	value |= UHSIC_LINE_WAKEUP_EN;
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	return 0;
+}
+
+static int tegra210_pmc_hsic_disable_phy_sleepwalk(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra210_xusb_padctl *priv = to_tegra210_xusb_padctl(padctl);
+	struct device *dev = padctl->dev;
+	unsigned int port = lane->index;
+	u32 value;
+
+	if (!priv->regmap)
+		return -EOPNOTSUPP;
+
+	dev_dbg(dev, "phy disable sleepwalk hsic %d\n", port);
+
+	/* disable the wake detection */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_SLEEP_CFG);
+	value &= ~UHSIC_MASTER_ENABLE;
+	padctl_pmc_writel(priv, value, PMC_UHSIC_SLEEP_CFG);
+
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+	value &= ~UHSIC_LINE_WAKEUP_EN;
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_LINE_WAKEUP);
+
+	/* disable wake event triggers of sleepwalk logic */
+	value = padctl_pmc_readl(priv, PMC_UHSIC_SLEEP_CFG);
+	value &= ~UHSIC_WAKE_VAL(~0);
+	value |= UHSIC_WAKE_VAL_NONE;
+	padctl_pmc_writel(priv, value, PMC_UHSIC_SLEEP_CFG);
+
+	/* power down the line state detectors of the port */
+	value = padctl_pmc_readl(priv, PMC_USB_AO);
+	value |= (STROBE_VAL_PD(port) | DATA0_VAL_PD(port) | DATA1_VAL_PD);
+	padctl_pmc_writel(priv, value, PMC_USB_AO);
+
+	/* clear alarm of the sleepwalk logic */
+	value = padctl_pmc_readl(priv, PMC_UTMIP_UHSIC_TRIGGERS);
+	value |= UHSIC_CLR_WAKE_ALARM;
+	padctl_pmc_writel(priv, value, PMC_UTMIP_UHSIC_TRIGGERS);
+
+	return 0;
+}
+
 static int tegra210_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 					 unsigned int index, bool enable)
 {
@@ -986,6 +1808,11 @@ static void tegra210_usb2_lane_remove(struct tegra_xusb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_usb2_lane_ops = {
 	.probe = tegra210_usb2_lane_probe,
 	.remove = tegra210_usb2_lane_remove,
+	.enable_phy_sleepwalk = tegra210_pmc_utmi_enable_phy_sleepwalk,
+	.disable_phy_sleepwalk = tegra210_pmc_utmi_disable_phy_sleepwalk,
+	.enable_phy_wake = tegra210_utmi_enable_phy_wake,
+	.disable_phy_wake = tegra210_utmi_disable_phy_wake,
+	.remote_wake_detected = tegra210_utmi_phy_remote_wake_detected,
 };
 
 static int tegra210_usb2_phy_init(struct phy *phy)
@@ -1449,6 +2276,11 @@ static void tegra210_hsic_lane_remove(struct tegra_xusb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_hsic_lane_ops = {
 	.probe = tegra210_hsic_lane_probe,
 	.remove = tegra210_hsic_lane_remove,
+	.enable_phy_sleepwalk = tegra210_pmc_hsic_enable_phy_sleepwalk,
+	.disable_phy_sleepwalk = tegra210_pmc_hsic_disable_phy_sleepwalk,
+	.enable_phy_wake = tegra210_hsic_enable_phy_wake,
+	.disable_phy_wake = tegra210_hsic_disable_phy_wake,
+	.remote_wake_detected = tegra210_hsic_phy_remote_wake_detected,
 };
 
 static int tegra210_hsic_phy_init(struct phy *phy)
@@ -1879,6 +2711,11 @@ static const struct tegra_xusb_lane_ops tegra210_pcie_lane_ops = {
 	.remove = tegra210_pcie_lane_remove,
 	.iddq_enable = tegra210_uphy_lane_iddq_enable,
 	.iddq_disable = tegra210_uphy_lane_iddq_disable,
+	.enable_phy_sleepwalk = tegra210_usb3_enable_phy_sleepwalk,
+	.disable_phy_sleepwalk = tegra210_usb3_disable_phy_sleepwalk,
+	.enable_phy_wake = tegra210_usb3_enable_phy_wake,
+	.disable_phy_wake = tegra210_usb3_disable_phy_wake,
+	.remote_wake_detected = tegra210_usb3_phy_remote_wake_detected,
 };
 
 static int tegra210_pcie_phy_init(struct phy *phy)
@@ -2044,6 +2881,11 @@ static const struct tegra_xusb_lane_ops tegra210_sata_lane_ops = {
 	.remove = tegra210_sata_lane_remove,
 	.iddq_enable = tegra210_uphy_lane_iddq_enable,
 	.iddq_disable = tegra210_uphy_lane_iddq_disable,
+	.enable_phy_sleepwalk = tegra210_usb3_enable_phy_sleepwalk,
+	.disable_phy_sleepwalk = tegra210_usb3_disable_phy_sleepwalk,
+	.enable_phy_wake = tegra210_usb3_enable_phy_wake,
+	.disable_phy_wake = tegra210_usb3_disable_phy_wake,
+	.remote_wake_detected = tegra210_usb3_phy_remote_wake_detected,
 };
 
 static int tegra210_sata_phy_init(struct phy *phy)
@@ -2293,6 +3135,8 @@ tegra210_xusb_padctl_probe(struct device *dev,
 			   const struct tegra_xusb_padctl_soc *soc)
 {
 	struct tegra210_xusb_padctl *padctl;
+	struct device_node *np;
+	struct platform_device *pdev;
 	int err;
 
 	padctl = devm_kzalloc(dev, sizeof(*padctl), GFP_KERNEL);
@@ -2306,6 +3150,26 @@ tegra210_xusb_padctl_probe(struct device *dev,
 	if (err < 0)
 		return ERR_PTR(err);
 
+	np = of_parse_phandle(dev->of_node, "nvidia,pmc", 0);
+	if (!np) {
+		dev_warn(dev, "nvidia,pmc property is missing\n");
+		goto out;
+	}
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev) {
+		dev_warn(dev, "PMC device is not available\n");
+		goto out;
+	}
+
+	if (!device_is_bound(&pdev->dev))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	padctl->regmap = dev_get_regmap(&pdev->dev, "usb_sleepwalk");
+	if (!padctl->regmap)
+		dev_info(dev, "pmc regmap is not available.\n");
+
+out:
 	return &padctl->base;
 }
 
@@ -2313,9 +3177,75 @@ static void tegra210_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
 {
 }
 
+static void tegra210_xusb_padctl_save(struct tegra_xusb_padctl *padctl)
+{
+	struct tegra210_xusb_padctl *priv = to_tegra210_xusb_padctl(padctl);
+
+	priv->context.usb2_pad_mux =
+		padctl_readl(padctl, XUSB_PADCTL_USB2_PAD_MUX);
+	priv->context.usb2_port_cap =
+		padctl_readl(padctl, XUSB_PADCTL_USB2_PORT_CAP);
+	priv->context.ss_port_map =
+		padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
+	priv->context.usb3_pad_mux =
+		padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
+}
+
+static void tegra210_xusb_padctl_restore(struct tegra_xusb_padctl *padctl)
+{
+	struct tegra210_xusb_padctl *priv = to_tegra210_xusb_padctl(padctl);
+	struct tegra_xusb_lane *lane;
+
+	padctl_writel(padctl, priv->context.usb2_pad_mux,
+		XUSB_PADCTL_USB2_PAD_MUX);
+	padctl_writel(padctl, priv->context.usb2_port_cap,
+		XUSB_PADCTL_USB2_PORT_CAP);
+	padctl_writel(padctl, priv->context.ss_port_map,
+		XUSB_PADCTL_SS_PORT_MAP);
+
+	list_for_each_entry(lane, &padctl->lanes, list) {
+		if (lane->pad->ops->iddq_enable)
+			tegra210_uphy_lane_iddq_enable(lane);
+	}
+
+	padctl_writel(padctl, priv->context.usb3_pad_mux,
+		XUSB_PADCTL_USB3_PAD_MUX);
+
+	list_for_each_entry(lane, &padctl->lanes, list) {
+		if (lane->pad->ops->iddq_disable)
+			tegra210_uphy_lane_iddq_disable(lane);
+	}
+}
+
+static int tegra210_xusb_padctl_suspend_noirq(struct tegra_xusb_padctl *padctl)
+{
+	mutex_lock(&padctl->lock);
+
+	tegra210_uphy_deinit(padctl);
+
+	tegra210_xusb_padctl_save(padctl);
+
+	mutex_unlock(&padctl->lock);
+	return 0;
+}
+
+static int tegra210_xusb_padctl_resume_noirq(struct tegra_xusb_padctl *padctl)
+{
+	mutex_lock(&padctl->lock);
+
+	tegra210_xusb_padctl_restore(padctl);
+
+	tegra210_uphy_init(padctl);
+
+	mutex_unlock(&padctl->lock);
+	return 0;
+}
+
 static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
 	.probe = tegra210_xusb_padctl_probe,
 	.remove = tegra210_xusb_padctl_remove,
+	.suspend_noirq = tegra210_xusb_padctl_suspend_noirq,
+	.resume_noirq = tegra210_xusb_padctl_resume_noirq,
 	.usb3_set_lfps_detect = tegra210_usb3_set_lfps_detect,
 	.hsic_set_idle = tegra210_hsic_set_idle,
 	.vbus_override = tegra210_xusb_padctl_vbus_override,
-- 
2.30.2

