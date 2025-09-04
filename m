Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB03D2F361B;
	Thu,  4 Sep 2025 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003580; cv=none; b=fHG/OHtDnezzYLS3VL7I6kAH+C6gH536z4hAehhjVzov0QOEIoiJosxwhdhxLH9upZLQdB7H2WQZ8cvC3xPP00ckssFYUPRJiXY01RH0IoFr4X4VIFm9zOkFk+J19pmuIKyWBSsRaGYDfNbE0JzWivmkGvy1McnJffyoS31XvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003580; c=relaxed/simple;
	bh=eoEbg4iL4baIlutKkY+5t3o5h26mHCZIKOnqlZOgMTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4ItVkKjFaKfSy6t28lGN9tKBD0CVeMd6O3kn9TdV8QW5rygawXMGtCalVMFjEGgz3/kAmR9zxwlL2d71LyWHrZxFfNUBf0lfAyqFNcNZX8xV7OuD4ig8YVTjFqGr/+Qo2ED1YpFx63Gm9sLuzsIDUAReo97cbJ3/9dZ+0D1tPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcPpsWZk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcPpsWZk"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f76454f69so1201358e87.0;
        Thu, 04 Sep 2025 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757003577; x=1757608377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSHHCv96egqSRM2Nq0rrSVK8iPlsa2hUn0LxilUNI6c=;
        b=lcPpsWZkknfJ1IP4NPXMDxbYxIeBm3FfY9+pSow676RQmFLk/n/ga5c8QYaHXuUMl0
         XaSCznX3lNGq7vSBvX9C+DpqPONtYXFPG3bmux42ebEG5mOa0EUrj48WVX+XgGoips0F
         MPgC1XzSDKoPkWmRbHGRF8/GNmVH5q6/25FMqV7NybR2N4HWwDhl70KoBBGoGEbBUSvr
         RcpmPUn2IDSqUuhY8SAvUENhZ6qV/g/kJbGvoA9JlR3PgbSpwc1pFOhBf4KX7lOt+A1X
         l527F6d280OB2V1vvUxASLPCEiPwY2acRzV6Zc8/B6fSSe+9EwdNyxpN9v62x+8T/opB
         Ib9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003577; x=1757608377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSHHCv96egqSRM2Nq0rrSVK8iPlsa2hUn0LxilUNI6c=;
        b=JVJwG/hEwwiJYBRHdotrQuvaC//om2eWv0iEI4s7n4kK1f+Gm0lUPZwI8Sd4Wx7wVT
         uo14TCvon3waE3ANfoepkEjYkkprMeE3fIGIqf8OX6So1tAI/DwnBJ6fr6frhFtFekfd
         0ltEWlrmf4IGonuNmXYa2A3qx5clZd3jkkXD48XHvXU6JorgwNkwwQ5VeHxi3IwVg/So
         bj8qv8M7j2FPXUPesJutFbar/yCnoFmNq+bC6J2S4lB23WAga9BdN+moDd9IdxNLlpqR
         p7HuSWdQlGxNJ35Zr56l4w21wbgGeM1WnC/OM9Q9qeIJKe69uU3Z4i6r9pOOGmpqmKki
         yZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUunS1Fj5mvK2rjHdqCFNvtx/RY5vJ16+OiD9Iy6XBl47uBlkxujn9olhWyMaCEkji50yXvwZ9n7hmaz30=@vger.kernel.org, AJvYcCX/4XFH3rL+25The4kQAdRIuzyoJx3iQZKvp9NmOajmAjeEMcXyxE6/BMB4GDusWfKgiRulrsZkcSsTJuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX63h19Nxq6lSUdWoVbAuEC71vD5qSyLguzk61spooyQNi1WOs
	oRYvHzJIuEpNqUfbpu0ebZjR5Gw/A+fLF1ohn1M3TKne0HvpQ01ryglj
X-Gm-Gg: ASbGncslbfwWInoJtHXSv7huDYcE03DCIKh0MQGJsg1iRegh0Hho3XTvxhqDUmLHsAw
	EzSYW3xpDTJk3B4eJyYS15AnyGTzyQ8OM7nzqrnCgT0nqpM4HDJ6dE18azONTnWn7EI/CXfyyzj
	/Eo1vPLLO2zAbM2ZGoT2zNIaviZJp9HPhGA7qq8wZuPe9cFqzxZ0ctll/joCaRpbfNBzzR7NKB7
	4Hfdyq7m3inZc38lRo7jinLp2s/VlhggD+0yjl7g0+U9nSZt8v3fyLZ0CRGIILd6iECMBcXL/e+
	v6/2W+VW3jJrLfFvOhV3GV4HGXXseUCsfrztXQhTcgd0u5EA8gKleREY87J05umU+6rpV0533BG
	/h3Vo8KxnPYEALSZ7Akuqo/Ts
X-Google-Smtp-Source: AGHT+IGmUcP0RhHU6FGqvX8wXKVxk88zWAZNWnlWonZAEEVNPYDRmll40Qz11YwZaJZc6XkxY4OTqg==
X-Received: by 2002:a05:6512:b8a:b0:55f:6831:6ef9 with SMTP id 2adb3069b0e04-55f70969065mr6119923e87.46.1757003576656;
        Thu, 04 Sep 2025 09:32:56 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad45889sm1272978e87.138.2025.09.04.09.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:32:56 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] usb: phy: tegra: add HSIC support
Date: Thu,  4 Sep 2025 19:32:38 +0300
Message-ID: <20250904163238.238105-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250904163238.238105-1-clamor95@gmail.com>
References: <20250904163238.238105-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for HSIC USB mode, which can be set for second USB controller
and PHY on Tegra SoC along with already supported UTMI or ULPI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 249 ++++++++++++++++++++++++++++--
 include/linux/usb/tegra_usb_phy.h |   5 +
 2 files changed, 243 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index d3c29af1217c..882ad87ff89e 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -29,17 +29,26 @@
 #include <linux/usb/tegra_usb_phy.h>
 #include <linux/usb/ulpi.h>
 
+#define USB_TXFILLTUNING			0x154
+#define USB_FIFO_TXFILL_THRES(x)		(((x) & 0x1f) << 16)
+#define USB_FIFO_TXFILL_MASK			0x1f0000
+
 #define ULPI_VIEWPORT				0x170
 
 /* PORTSC PTS/PHCD bits, Tegra20 only */
 #define TEGRA_USB_PORTSC1			0x184
-#define TEGRA_USB_PORTSC1_PTS(x)		(((x) & 0x3) << 30)
-#define TEGRA_USB_PORTSC1_PHCD			BIT(23)
+#define   TEGRA_USB_PORTSC1_PTS(x)		(((x) & 0x3) << 30)
+#define   TEGRA_USB_PORTSC1_PHCD		BIT(23)
+#define   TEGRA_USB_PORTSC1_WKOC		BIT(22)
+#define   TEGRA_USB_PORTSC1_WKDS		BIT(21)
+#define   TEGRA_USB_PORTSC1_WKCN		BIT(20)
 
 /* HOSTPC1 PTS/PHCD bits, Tegra30 and above */
+#define TEGRA30_USB_PORTSC1			0x174
 #define TEGRA_USB_HOSTPC1_DEVLC			0x1b4
-#define TEGRA_USB_HOSTPC1_DEVLC_PTS(x)		(((x) & 0x7) << 29)
-#define TEGRA_USB_HOSTPC1_DEVLC_PHCD		BIT(22)
+#define   TEGRA_USB_HOSTPC1_DEVLC_PTS(x)	(((x) & 0x7) << 29)
+#define   TEGRA_USB_HOSTPC1_DEVLC_PHCD		BIT(22)
+#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC	BIT(2)
 
 /* Bits of PORTSC1, which will get cleared by writing 1 into them */
 #define TEGRA_PORTSC1_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_OCC)
@@ -51,11 +60,12 @@
 #define   USB_SUSP_CLR				BIT(5)
 #define   USB_PHY_CLK_VALID			BIT(7)
 #define   UTMIP_RESET				BIT(11)
-#define   UHSIC_RESET				BIT(11)
 #define   UTMIP_PHY_ENABLE			BIT(12)
 #define   ULPI_PHY_ENABLE			BIT(13)
 #define   USB_SUSP_SET				BIT(14)
+#define   UHSIC_RESET				BIT(14)
 #define   USB_WAKEUP_DEBOUNCE_COUNT(x)		(((x) & 0x7) << 16)
+#define   UHSIC_PHY_ENABLE			BIT(19)
 
 #define USB_PHY_VBUS_SENSORS			0x404
 #define   B_SESS_VLD_WAKEUP_EN			BIT(14)
@@ -156,6 +166,58 @@
 #define UTMIP_BIAS_CFG1				0x83c
 #define   UTMIP_BIAS_PDTRK_COUNT(x)		(((x) & 0x1f) << 3)
 
+/*
+ * Tegra20 has no UTMIP registers on PHY2 and UHSIC registers start from 0x800
+ * just where UTMIP registers should have been. This is the case only with Tegra20
+ * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers shifter by 0x400
+ * to 0xc00, but register layout is preserved.
+ */
+#define UHSIC_PLL_CFG1				0x804
+#define   UHSIC_XTAL_FREQ_COUNT(x)		(((x) & 0xfff) << 0)
+#define   UHSIC_PLLU_ENABLE_DLY_COUNT(x)	(((x) & 0x1f) << 14)
+
+#define UHSIC_HSRX_CFG0				0x808
+#define   UHSIC_ELASTIC_UNDERRUN_LIMIT(x)	(((x) & 0x1f) << 2)
+#define   UHSIC_ELASTIC_OVERRUN_LIMIT(x)	(((x) & 0x1f) << 8)
+#define   UHSIC_IDLE_WAIT(x)			(((x) & 0x1f) << 13)
+
+#define UHSIC_HSRX_CFG1				0x80c
+#define   UHSIC_HS_SYNC_START_DLY(x)		(((x) & 0x1f) << 1)
+
+#define UHSIC_TX_CFG0				0x810
+#define   UHSIC_HS_READY_WAIT_FOR_VALID		BIT(9)
+
+#define UHSIC_MISC_CFG0				0x814
+#define   UHSIC_SUSPEND_EXIT_ON_EDGE		BIT(7)
+#define   UHSIC_DETECT_SHORT_CONNECT		BIT(8)
+#define   UHSIC_FORCE_XCVR_MODE			BIT(15)
+#define   UHSIC_DISABLE_BUSRESET		BIT(20)
+
+#define UHSIC_MISC_CFG1				0x818
+#define   UHSIC_PLLU_STABLE_COUNT(x)		(((x) & 0xfff) << 2)
+
+#define UHSIC_PADS_CFG0				0x81c
+#define   UHSIC_TX_RTUNEN			0xf000
+#define   UHSIC_TX_RTUNE(x)			(((x) & 0xf) << 12)
+
+#define UHSIC_PADS_CFG1				0x820
+#define   UHSIC_PD_BG				BIT(2)
+#define   UHSIC_PD_TX				BIT(3)
+#define   UHSIC_PD_TRK				BIT(4)
+#define   UHSIC_PD_RX				BIT(5)
+#define   UHSIC_PD_ZI				BIT(6)
+#define   UHSIC_RX_SEL				BIT(7)
+#define   UHSIC_RPD_DATA			BIT(9)
+#define   UHSIC_RPD_STROBE			BIT(10)
+#define   UHSIC_RPU_DATA			BIT(11)
+#define   UHSIC_RPU_STROBE			BIT(12)
+
+#define UHSIC_CMD_CFG0				0x824
+#define   UHSIC_PRETEND_CONNECT_DETECT		BIT(5)
+
+#define UHSIC_STAT_CFG0				0x828
+#define   UHSIC_CONNECT_DETECT			BIT(0)
+
 /* For Tegra30 and above only, the address is different in Tegra20 */
 #define USB_USBMODE				0x1f8
 #define   USB_USBMODE_MASK			(3 << 0)
@@ -174,7 +236,8 @@ struct tegra_xtal_freq {
 	u8 enable_delay;
 	u8 stable_count;
 	u8 active_delay;
-	u8 xtal_freq_count;
+	u8 utmi_xtal_freq_count;
+	u16 hsic_xtal_freq_count;
 	u16 debounce;
 };
 
@@ -184,7 +247,8 @@ static const struct tegra_xtal_freq tegra_freq_table[] = {
 		.enable_delay = 0x02,
 		.stable_count = 0x2F,
 		.active_delay = 0x04,
-		.xtal_freq_count = 0x76,
+		.utmi_xtal_freq_count = 0x76,
+		.hsic_xtal_freq_count = 0x1CA,
 		.debounce = 0x7530,
 	},
 	{
@@ -192,7 +256,8 @@ static const struct tegra_xtal_freq tegra_freq_table[] = {
 		.enable_delay = 0x02,
 		.stable_count = 0x33,
 		.active_delay = 0x05,
-		.xtal_freq_count = 0x7F,
+		.utmi_xtal_freq_count = 0x7F,
+		.hsic_xtal_freq_count = 0x1F0,
 		.debounce = 0x7EF4,
 	},
 	{
@@ -200,7 +265,8 @@ static const struct tegra_xtal_freq tegra_freq_table[] = {
 		.enable_delay = 0x03,
 		.stable_count = 0x4B,
 		.active_delay = 0x06,
-		.xtal_freq_count = 0xBB,
+		.utmi_xtal_freq_count = 0xBB,
+		.hsic_xtal_freq_count = 0x2DD,
 		.debounce = 0xBB80,
 	},
 	{
@@ -208,7 +274,8 @@ static const struct tegra_xtal_freq tegra_freq_table[] = {
 		.enable_delay = 0x04,
 		.stable_count = 0x66,
 		.active_delay = 0x09,
-		.xtal_freq_count = 0xFE,
+		.utmi_xtal_freq_count = 0xFE,
+		.hsic_xtal_freq_count = 0x3E0,
 		.debounce = 0xFDE8,
 	},
 };
@@ -541,7 +608,7 @@ static int utmi_phy_power_on(struct tegra_usb_phy *phy)
 		val = readl_relaxed(base + UTMIP_PLL_CFG1);
 		val &= ~(UTMIP_XTAL_FREQ_COUNT(~0) |
 			UTMIP_PLLU_ENABLE_DLY_COUNT(~0));
-		val |= UTMIP_XTAL_FREQ_COUNT(phy->freq->xtal_freq_count) |
+		val |= UTMIP_XTAL_FREQ_COUNT(phy->freq->utmi_xtal_freq_count) |
 			UTMIP_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_delay);
 		writel_relaxed(val, base + UTMIP_PLL_CFG1);
 	}
@@ -864,6 +931,153 @@ static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 	return 0;
 }
 
+static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
+{
+	void __iomem *base = phy->regs;
+	u32 shift = phy->soc_config->uhsic_registers_shift;
+
+	return readl_relaxed(base + shift + reg);
+}
+
+static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg, u32 value)
+{
+	void __iomem *base = phy->regs;
+	u32 shift = phy->soc_config->uhsic_registers_shift;
+
+	writel_relaxed(value, base + shift + reg);
+}
+
+static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
+{
+	struct tegra_utmip_config *config = phy->config;
+	void __iomem *base = phy->regs;
+	u32 val;
+
+	val = tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
+	val &= ~(UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_RX |
+		 UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
+	val |= UHSIC_RX_SEL;
+	tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
+
+	udelay(2);
+
+	val = readl_relaxed(base + USB_SUSP_CTRL);
+	val |= UHSIC_RESET;
+	writel_relaxed(val, base + USB_SUSP_CTRL);
+
+	udelay(30);
+
+	val = readl_relaxed(base + USB_SUSP_CTRL);
+	val |= UHSIC_PHY_ENABLE;
+	writel_relaxed(val, base + USB_SUSP_CTRL);
+
+	val = tegra_hsic_readl(phy, UHSIC_HSRX_CFG0);
+	val &= ~(UHSIC_IDLE_WAIT(~0) |
+		 UHSIC_ELASTIC_UNDERRUN_LIMIT(~0) |
+		 UHSIC_ELASTIC_OVERRUN_LIMIT(~0));
+	val |= UHSIC_IDLE_WAIT(config->idle_wait_delay) |
+		UHSIC_ELASTIC_UNDERRUN_LIMIT(config->elastic_limit) |
+		UHSIC_ELASTIC_OVERRUN_LIMIT(config->elastic_limit);
+	tegra_hsic_writel(phy, UHSIC_HSRX_CFG0, val);
+
+	val = tegra_hsic_readl(phy, UHSIC_HSRX_CFG1);
+	val &= ~UHSIC_HS_SYNC_START_DLY(~0);
+	val |= UHSIC_HS_SYNC_START_DLY(config->hssync_start_delay);
+	tegra_hsic_writel(phy, UHSIC_HSRX_CFG1, val);
+
+	val = tegra_hsic_readl(phy, UHSIC_MISC_CFG0);
+	val |= UHSIC_SUSPEND_EXIT_ON_EDGE;
+	tegra_hsic_writel(phy, UHSIC_MISC_CFG0, val);
+
+	val = tegra_hsic_readl(phy, UHSIC_MISC_CFG1);
+	val &= ~UHSIC_PLLU_STABLE_COUNT(~0);
+	val |= UHSIC_PLLU_STABLE_COUNT(phy->freq->stable_count);
+	tegra_hsic_writel(phy, UHSIC_MISC_CFG1, val);
+
+	val = tegra_hsic_readl(phy, UHSIC_PLL_CFG1);
+	val &= ~(UHSIC_XTAL_FREQ_COUNT(~0) |
+		UHSIC_PLLU_ENABLE_DLY_COUNT(~0));
+	val |= UHSIC_XTAL_FREQ_COUNT(phy->freq->hsic_xtal_freq_count) |
+		UHSIC_PLLU_ENABLE_DLY_COUNT(phy->freq->enable_delay);
+	tegra_hsic_writel(phy, UHSIC_PLL_CFG1, val);
+
+	val = readl_relaxed(base + USB_SUSP_CTRL);
+	val &= ~UHSIC_RESET;
+	writel_relaxed(val, base + USB_SUSP_CTRL);
+
+	udelay(2);
+
+	if (phy->soc_config->requires_usbmode_setup) {
+		val = readl_relaxed(base + USB_USBMODE);
+		val &= ~USB_USBMODE_MASK;
+		if (phy->mode == USB_DR_MODE_HOST)
+			val |= USB_USBMODE_HOST;
+		else
+			val |= USB_USBMODE_DEVICE;
+		writel_relaxed(val, base + USB_USBMODE);
+	}
+
+	if (phy->soc_config->has_hostpc)
+		set_pts(phy, TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC);
+	else
+		set_pts(phy, 0);
+
+	val = readl_relaxed(base + USB_TXFILLTUNING);
+	if ((val & USB_FIFO_TXFILL_MASK) != USB_FIFO_TXFILL_THRES(0x10)) {
+		val = USB_FIFO_TXFILL_THRES(0x10);
+		writel_relaxed(val, base + USB_TXFILLTUNING);
+	}
+
+	if (phy->soc_config->has_hostpc) {
+		val = readl_relaxed(base + TEGRA30_USB_PORTSC1);
+		val &= ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
+			 TEGRA_USB_PORTSC1_WKCN);
+		writel_relaxed(val, base + TEGRA30_USB_PORTSC1);
+	} else {
+		val = readl_relaxed(base + TEGRA_USB_PORTSC1);
+		val &= ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
+			 TEGRA_USB_PORTSC1_WKCN);
+		writel_relaxed(val, base + TEGRA_USB_PORTSC1);
+	}
+
+	val = tegra_hsic_readl(phy, UHSIC_PADS_CFG0);
+	val &= ~UHSIC_TX_RTUNEN;
+	val |= UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
+	tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
+
+	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
+			       USB_PHY_CLK_VALID))
+		dev_err(phy->u_phy.dev,
+			"Timeout waiting for PHY to stabilize on enable (HSIC)\n");
+
+	return 0;
+}
+
+static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
+{
+	void __iomem *base = phy->regs;
+	u32 val;
+
+	set_phcd(phy, true);
+
+	val = tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
+	val |= (UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_RX |
+		UHSIC_PD_ZI | UHSIC_RPD_DATA | UHSIC_RPD_STROBE);
+	tegra_hsic_writel(phy, UHSIC_PADS_CFG1, val);
+
+	val = readl_relaxed(base + USB_SUSP_CTRL);
+	val |= UHSIC_RESET;
+	writel_relaxed(val, base + USB_SUSP_CTRL);
+
+	udelay(30);
+
+	val = readl_relaxed(base + USB_SUSP_CTRL);
+	val &= ~UHSIC_PHY_ENABLE;
+	writel_relaxed(val, base + USB_SUSP_CTRL);
+
+	return 0;
+}
+
 static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
 {
 	int err;
@@ -880,6 +1094,10 @@ static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
 		err = ulpi_phy_power_on(phy);
 		break;
 
+	case USBPHY_INTERFACE_MODE_HSIC:
+		err = uhsic_phy_power_on(phy);
+		break;
+
 	default:
 		break;
 	}
@@ -911,6 +1129,10 @@ static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
 		err = ulpi_phy_power_off(phy);
 		break;
 
+	case USBPHY_INTERFACE_MODE_HSIC:
+		err = uhsic_phy_power_off(phy);
+		break;
+
 	default:
 		break;
 	}
@@ -1345,6 +1567,8 @@ static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.requires_usbmode_setup = false,
 	.requires_extra_tuning_parameters = false,
 	.requires_pmc_ao_power_up = false,
+	.uhsic_registers_shift = 0,
+	.uhsic_tx_rtune = 0, /* 40 ohm */
 };
 
 static const struct tegra_phy_soc_config tegra30_soc_config = {
@@ -1353,6 +1577,8 @@ static const struct tegra_phy_soc_config tegra30_soc_config = {
 	.requires_usbmode_setup = true,
 	.requires_extra_tuning_parameters = true,
 	.requires_pmc_ao_power_up = true,
+	.uhsic_registers_shift = 0x400,
+	.uhsic_tx_rtune = 8,  /* 50 ohm */
 };
 
 static const struct of_device_id tegra_usb_phy_id_table[] = {
@@ -1449,6 +1675,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	tegra_phy->phy_type = of_usb_get_phy_mode(np);
 	switch (tegra_phy->phy_type) {
 	case USBPHY_INTERFACE_MODE_UTMI:
+	case USBPHY_INTERFACE_MODE_HSIC:
 		err = utmi_phy_probe(tegra_phy, pdev);
 		if (err)
 			return err;
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 101da5f53815..7128274c5443 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -24,6 +24,9 @@ struct gpio_desc;
  * requires_extra_tuning_parameters: true if xcvr_hsslew, hssquelch_level
  *      and hsdiscon_level should be set for adequate signal quality
  * requires_pmc_ao_power_up: true if USB AO is powered down by default
+ * uhsic_registers_shift: for Tegra30+ where HSIC registers were shifted
+ *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on PHY2
+ * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/PMOS driver
  */
 
 struct tegra_phy_soc_config {
@@ -32,6 +35,8 @@ struct tegra_phy_soc_config {
 	bool requires_usbmode_setup;
 	bool requires_extra_tuning_parameters;
 	bool requires_pmc_ao_power_up;
+	u32 uhsic_registers_shift;
+	u32 uhsic_tx_rtune;
 };
 
 struct tegra_utmip_config {
-- 
2.48.1

