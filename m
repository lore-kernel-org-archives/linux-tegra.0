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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D999C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3F31619BF
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhCYQlW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhCYQlA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:41:00 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5136EC06174A;
        Thu, 25 Mar 2021 09:41:00 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so1550245wmj.2;
        Thu, 25 Mar 2021 09:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EpEbA6CM/P+xQGbvt44AnGB0qjb5n3dM+VQpCNtPqmM=;
        b=j+tp6SfV0bfa/JnbEw3236v8dfeZo+yaidQwTkurboXKO7+DX08vw1X1aYhciD8fg/
         0mn/95q25Qe1RGhHMrmQOlOPu8A6mYAw4W3RMt9+kMB8aEUOvGry753YlkZLGEnAElVR
         z05g6AyKoI826aKOtGQUcKq9xNkWxwPjp5wf1iTNDvFu7DIGwy+rSFD5YhGQ7lLwRYoo
         /RcG4vlCb+AcemL2qPPHCV4T0J5oqcC5P3zMKrFoEMnB7Z2j/VGk5m8sD0nrCcothxyU
         qBMXCcfYC0f3SdJlVw8m5SpjrAend5fS5KpGna/amlf76rOpcTBy65f7BDRWhuxxpz95
         d7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EpEbA6CM/P+xQGbvt44AnGB0qjb5n3dM+VQpCNtPqmM=;
        b=GM8/50Sos80XSjmm1JggKL42xxUuDThDk/sdL/DgxY0oQxlNG0bKyolLpA1fSxTCHp
         jKviP0awOI6QC9XoPU3eJDFzIjGAXJiQdZ6A6AwpTd94z34MjFsMmne19YVivXzwkAcs
         oOOpTGz5HrHSUF7Y1kqRmdmzeXCTT9BD1aIoTiJJh6crYJ2+ex/yqz0VXQpJ5G4vTZMC
         K5p0WS42eiPBoBn9jaYoBAdkwMr1vtc4CE+ClRPMBPndeJFqVmEMZlLZFZuowi/2gvgx
         10sfOis/O7PDU2BWYk7gpLy5EtfcCusUl7ukxr4w2zUjZbDRyL37OZOMZrfSIU0Sv3pL
         b1DA==
X-Gm-Message-State: AOAM531lXK3cajKU0z3YyG9hVOA/Hu5OqYsOOqz+p8B2NvXUepTuLYeg
        lLH5B4wiwHA67vWSOLIykBg=
X-Google-Smtp-Source: ABdhPJwe09p97Asz1de3vmAHa8PX+hcWWVthf2x8ZLCdzwVPwxpOio3pTUB3zoFMKqg2vVcH5vUIbg==
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr9345030wmk.23.1616690458100;
        Thu, 25 Mar 2021 09:40:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d18sm8367429wra.8.2021.03.25.09.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:40:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v8 05/13] phy: tegra: xusb: Add Tegra210 lane_iddq operation
Date:   Thu, 25 Mar 2021 17:40:49 +0100
Message-Id: <20210325164057.793954-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

As per Tegra210 TRM, before changing lane assignments, driver should
keep lanes in IDDQ and sleep state; after changing lane assignments,
driver should bring lanes out of IDDQ.
This commit implements the required operations.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 82 ++++++++++++++++++++++++++++---
 drivers/phy/tegra/xusb.c          |  6 +++
 drivers/phy/tegra/xusb.h          |  6 +++
 3 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index faacb866cd1f..b038d032fea1 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -198,6 +198,18 @@
 #define XUSB_PADCTL_UPHY_MISC_PAD_CTL1_AUX_RX_TERM_EN BIT(18)
 #define XUSB_PADCTL_UPHY_MISC_PAD_CTL1_AUX_RX_MODE_OVRD BIT(13)
 
+#define XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(x) (0x464 + (x) * 0x40)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ BIT(0)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD BIT(1)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK (0x3 << 4)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL (0x3 << 4)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD BIT(24)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ BIT(8)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD BIT(9)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK (0x3 << 12)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL (0x3 << 12)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD BIT(25)
+
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL1 0x860
 
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL2 0x864
@@ -209,6 +221,7 @@
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL8 0x87c
 
 #define XUSB_PADCTL_UPHY_MISC_PAD_S0_CTL1 0x960
+#define XUSB_PADCTL_UPHY_MISC_PAD_S0_CTL2 0x964
 
 #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(x) (0xa60 + (x) * 0x40)
 #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT 16
@@ -1640,6 +1653,55 @@ static const struct tegra_xusb_pad_soc tegra210_hsic_pad = {
 	.ops = &tegra210_hsic_ops,
 };
 
+static void tegra210_uphy_lane_iddq_enable(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	u32 value;
+
+	value = padctl_readl(padctl, lane->soc->regs.misc_ctl2);
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ;
+	value &= ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ;
+	value &= ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL;
+	padctl_writel(padctl, value, lane->soc->regs.misc_ctl2);
+}
+
+static void tegra210_uphy_lane_iddq_disable(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	u32 value;
+
+	value = padctl_readl(padctl, lane->soc->regs.misc_ctl2);
+	value &= ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD;
+	value &= ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD;
+	value &= ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD;
+	value &= ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ;
+	value &= ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ;
+	value &= ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK;
+	value |= XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL;
+	padctl_writel(padctl, value, lane->soc->regs.misc_ctl2);
+}
+
+#define TEGRA210_UPHY_LANE(_name, _offset, _shift, _mask, _type, _misc)	\
+	{								\
+		.name = _name,						\
+		.offset = _offset,					\
+		.shift = _shift,					\
+		.mask = _mask,						\
+		.num_funcs = ARRAY_SIZE(tegra210_##_type##_functions),	\
+		.funcs = tegra210_##_type##_functions,			\
+		.regs.misc_ctl2 = _misc,				\
+	}
+
 static const char *tegra210_pcie_functions[] = {
 	"pcie-x1",
 	"usb3-ss",
@@ -1648,13 +1710,13 @@ static const char *tegra210_pcie_functions[] = {
 };
 
 static const struct tegra_xusb_lane_soc tegra210_pcie_lanes[] = {
-	TEGRA210_LANE("pcie-0", 0x028, 12, 0x3, pcie),
-	TEGRA210_LANE("pcie-1", 0x028, 14, 0x3, pcie),
-	TEGRA210_LANE("pcie-2", 0x028, 16, 0x3, pcie),
-	TEGRA210_LANE("pcie-3", 0x028, 18, 0x3, pcie),
-	TEGRA210_LANE("pcie-4", 0x028, 20, 0x3, pcie),
-	TEGRA210_LANE("pcie-5", 0x028, 22, 0x3, pcie),
-	TEGRA210_LANE("pcie-6", 0x028, 24, 0x3, pcie),
+	TEGRA210_UPHY_LANE("pcie-0", 0x028, 12, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(0)),
+	TEGRA210_UPHY_LANE("pcie-1", 0x028, 14, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(1)),
+	TEGRA210_UPHY_LANE("pcie-2", 0x028, 16, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(2)),
+	TEGRA210_UPHY_LANE("pcie-3", 0x028, 18, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(3)),
+	TEGRA210_UPHY_LANE("pcie-4", 0x028, 20, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(4)),
+	TEGRA210_UPHY_LANE("pcie-5", 0x028, 22, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(5)),
+	TEGRA210_UPHY_LANE("pcie-6", 0x028, 24, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(6)),
 };
 
 static struct tegra_xusb_usb3_port *
@@ -1815,6 +1877,8 @@ static void tegra210_pcie_lane_remove(struct tegra_xusb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_pcie_lane_ops = {
 	.probe = tegra210_pcie_lane_probe,
 	.remove = tegra210_pcie_lane_remove,
+	.iddq_enable = tegra210_uphy_lane_iddq_enable,
+	.iddq_disable = tegra210_uphy_lane_iddq_disable,
 };
 
 static int tegra210_pcie_phy_init(struct phy *phy)
@@ -1939,7 +2003,7 @@ static const struct tegra_xusb_pad_soc tegra210_pcie_pad = {
 };
 
 static const struct tegra_xusb_lane_soc tegra210_sata_lanes[] = {
-	TEGRA210_LANE("sata-0", 0x028, 30, 0x3, pcie),
+	TEGRA210_UPHY_LANE("sata-0", 0x028, 30, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_PAD_S0_CTL2),
 };
 
 static struct tegra_xusb_lane *
@@ -1978,6 +2042,8 @@ static void tegra210_sata_lane_remove(struct tegra_xusb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_sata_lane_ops = {
 	.probe = tegra210_sata_lane_probe,
 	.remove = tegra210_sata_lane_remove,
+	.iddq_enable = tegra210_uphy_lane_iddq_enable,
+	.iddq_disable = tegra210_uphy_lane_iddq_disable,
 };
 
 static int tegra210_sata_phy_init(struct phy *phy)
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 3110aafa8cf6..a34d304677bb 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -321,11 +321,17 @@ static void tegra_xusb_lane_program(struct tegra_xusb_lane *lane)
 	if (soc->num_funcs < 2)
 		return;
 
+	if (lane->pad->ops->iddq_enable)
+		lane->pad->ops->iddq_enable(lane);
+
 	/* choose function */
 	value = padctl_readl(padctl, soc->offset);
 	value &= ~(soc->mask << soc->shift);
 	value |= lane->function << soc->shift;
 	padctl_writel(padctl, value, soc->offset);
+
+	if (lane->pad->ops->iddq_disable)
+		lane->pad->ops->iddq_disable(lane);
 }
 
 static void tegra_xusb_pad_program(struct tegra_xusb_pad *pad)
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index ccb5dc9b1220..e789d5ff4eb8 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -35,6 +35,10 @@ struct tegra_xusb_lane_soc {
 
 	const char * const *funcs;
 	unsigned int num_funcs;
+
+	struct {
+		unsigned int misc_ctl2;
+	} regs;
 };
 
 struct tegra_xusb_lane {
@@ -126,6 +130,8 @@ struct tegra_xusb_lane_ops {
 					 struct device_node *np,
 					 unsigned int index);
 	void (*remove)(struct tegra_xusb_lane *lane);
+	void (*iddq_enable)(struct tegra_xusb_lane *lane);
+	void (*iddq_disable)(struct tegra_xusb_lane *lane);
 };
 
 bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane, const char *function);
-- 
2.30.2

