Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA29F32AABE
	for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483145; cv=none; b=ZKOoeAsFcbR8ooURMvTqMr1ctqSp7M34SrLnEa9lpVDVAxXMbr/b+4eOjikw57SEsMBqE2hLJxyT8bM8KzyTrfFsTaxAJSfxIlGsm2eOSjYI09ceXofaBb6hM8PbIIT3r8XkXim2zfeeLbKW800/4DIRIZ5WcV/NPXJyentqlQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483145; c=relaxed/simple;
	bh=2CwjCktaAAvQP52hVAcQSiYNs442fX7cEjzBglFlmOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/sxYoGosOAhm1XjyNK6wLvmJrLKLmItp9tiVfL4aFshuCbrFPlAQCZFAwA/mDhF59k6/Qzq5zQ33zcRGtQ9ttcacmZwvvsEc3QYRgva6deIEyGRdkUwubcA0XAWJVhD5TQYARLqHHTbThfStkncJ5TsA+ADMjjH931QhSST2TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktTu6UL9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktTu6UL9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbc305882so2462372f8f.0
        for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 01:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483141; x=1767087941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtmZyPmcNnWj/pPrYtT2bQOdQiTp1GNJXWQfrbQ1Sro=;
        b=ktTu6UL9ZqOc38FAGXPDFviiigS4hQWTaCHp9Us72HwBsRLgpg3w7wLw8q8eniXSON
         yT9dgYYYVJVQxx5mMpq1rJHTHDc6VifrUthKipLWpu0hbN2E4eIgrPqDz8T0K75gSODG
         H23avs4Zt7o+I6kDeI8Yss+H/UubE/VcLQTq1w+aDM8pl3BkiIU5eSI2Pr45Z72WMLYp
         kPkTpo6CQcwOy7WWvwXEoWLJW/y8mIOsWF8G96rICj0u1VrQeq7DOY0O+reZhtvSO2gV
         J6+QhtoXTmFz6R6s5HKoiKec4SQiD8xH1AB8yZwl3UC79PFpADh91WxmJ3fOW0zSZ5OV
         y12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483141; x=1767087941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PtmZyPmcNnWj/pPrYtT2bQOdQiTp1GNJXWQfrbQ1Sro=;
        b=HXVD/VNpYcnQXPHYBrHQmYacTSAvTTFzL4o3LIXZYkd3KlQIm7eOEALJRn9bX9sUp3
         Q2qfeHVFD2wz1PRwxPpUvrn/oJ3jx/MQb3r+HWlsqPkuThV7KLB0T9dw9hXyUT/DO2Us
         anOH4njijNV3ql0R63VlUxknPAKoR46C7R9NzwXfc9oKqu02XfOa25fcwm0f5SDanIUV
         FlKKIFp8ViCjn8K8/NwiaYrzB9U1FJuoLEjK9NriBjsR7OqSZWe9FsOMED0JGX4rc0oW
         +3srJOV7wfozhvsLnKMupasATeNBT5xPJSG2ZVWHz3Jkegk1TbDWNzA/h6xEa8hQPylH
         iI9A==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5MaDnP1WgrMo6U1/qK1PohWbm5PBQ1iH5QbIVXnkypFQVDPvKnXRHBrTyKjZaR2uFWZcP+LANKx0uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2yTCAKJ3ZioLiqnyivBpNbmGzoamptfOQg6y8FL2r6GM9v1DR
	p/va2lSfIRM0SK1+zpZeCoUwpqPtulPaBokl6PwVw/b8qZ8hQAwwUZJd
X-Gm-Gg: AY/fxX7qwx/sRe3unxFghVXmMmMDrWp4j5d81OosNJNGmgBjXC5wYrDEoHQilquKAuU
	vCNVR1M7MKHYDxpIs8Ha1KNs5xVyPo/p5chLXzA+HEWyEI/3tfR2I6pGapGYNCRJ85JUXSlUn8d
	477PRfz40RGL7wFrA3ZVJFsQgPpNIW5aRJGfhHjn2SxCfKA8DAGuaYy6zIq1ysyzk5Kn2TPWY14
	W/AlriMRT6upfILo0DkJMZCGrARwgcJ6/v1mo7iuE8RofTobEUi7GJfoYTMeqy+KLNAnN4axklg
	Elf8CpNBmt4gDrdXYLhdxovp9H9vMKRFpGW4EwS4X6lRLAo1uKFEulU/o6pcVywbXTw08b38Ysx
	K3jfbnA+LDTNtE22WQNkxHLozyneA8DVT6oATq4CZrTTGqWBxFU3uPM4VuaqICnKi4mer9ITcBo
	Dw
X-Google-Smtp-Source: AGHT+IHrFmA3PPM8ft+5rTNEgWxkKLDHXqcquDXCom6fZSokZOHfeaGKqpPd0DmltR1qlbma/iIK0w==
X-Received: by 2002:a05:6000:4305:b0:431:8ec:9372 with SMTP id ffacd0b85a97d-4324e5108c1mr12648847f8f.55.1766483140982;
        Tue, 23 Dec 2025 01:45:40 -0800 (PST)
Received: from xeon ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1ae12sm25759024f8f.6.2025.12.23.01.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:45:40 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] usb: phy: tegra: add HSIC support
Date: Tue, 23 Dec 2025 11:45:29 +0200
Message-ID: <20251223094529.7202-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223094529.7202-1-clamor95@gmail.com>
References: <20251223094529.7202-1-clamor95@gmail.com>
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
index 13232b074649..31c0b6e34bc8 100644
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
@@ -812,6 +879,153 @@ static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
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
 	int err = 0;
@@ -828,6 +1042,10 @@ static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
 		err = ulpi_phy_power_on(phy);
 		break;
 
+	case USBPHY_INTERFACE_MODE_HSIC:
+		err = uhsic_phy_power_on(phy);
+		break;
+
 	default:
 		break;
 	}
@@ -859,6 +1077,10 @@ static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
 		err = ulpi_phy_power_off(phy);
 		break;
 
+	case USBPHY_INTERFACE_MODE_HSIC:
+		err = uhsic_phy_power_off(phy);
+		break;
+
 	default:
 		break;
 	}
@@ -1256,6 +1478,8 @@ static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.requires_usbmode_setup = false,
 	.requires_extra_tuning_parameters = false,
 	.requires_pmc_ao_power_up = false,
+	.uhsic_registers_shift = 0,
+	.uhsic_tx_rtune = 0, /* 40 ohm */
 };
 
 static const struct tegra_phy_soc_config tegra30_soc_config = {
@@ -1264,6 +1488,8 @@ static const struct tegra_phy_soc_config tegra30_soc_config = {
 	.requires_usbmode_setup = true,
 	.requires_extra_tuning_parameters = true,
 	.requires_pmc_ao_power_up = true,
+	.uhsic_registers_shift = 0x400,
+	.uhsic_tx_rtune = 8,  /* 50 ohm */
 };
 
 static const struct of_device_id tegra_usb_phy_id_table[] = {
@@ -1360,6 +1586,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	tegra_phy->phy_type = of_usb_get_phy_mode(np);
 	switch (tegra_phy->phy_type) {
 	case USBPHY_INTERFACE_MODE_UTMI:
+	case USBPHY_INTERFACE_MODE_HSIC:
 		err = utmi_phy_probe(tegra_phy, pdev);
 		if (err)
 			return err;
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index e394f4880b7e..4e79f1c2173a 100644
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
2.51.0

