Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DD33191A0
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019554; cv=none; b=phoi1QsPcB24EdZi+GIzMsi5nUrsl70DCak+fAFvkuLPZIYDem68lbs85GQcLok6yFtdOPzIX7VyPPtddy5Jc3w1yGCmgSZ0vgpNwGSHY3D0vsn+dUsnu3wgeDWTSMIISH7SFWhuQZjrtV6GdNUdNjKJZtbLt22lhMwdOqK3oT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019554; c=relaxed/simple;
	bh=NthgmsJEUbMoIJI99WoKA7oE7tr2kOG4g+HL24zjOhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggX6RXXOaU9L/ZDkQd7XqNvrBvZ3zcsrtW365D4KFNDkmaykbjWWhzm0pou2/2VZEqdW3vl+nGYpwk+4rh411dae9oKWkIV1KmVH5YZdlc93qt0yaeT/oOfYNrzKyt9LG2QqSOwojNXxQv7LF19FpBaFsPVqRtlWoR6CTTyWuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtV4qTtz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtV4qTtz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso42210645e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 00:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019551; x=1770624351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf4unyiRORlqIaPPXQybFDN9bhdoOYo19zL5kOSCjqE=;
        b=AtV4qTtzRycpMNDYybX6UD2WuLl99a15D7/LrppZ2/Tke8RfT1CCkhjvWFJGIIB7oe
         BH5VoGY8GaTeoqBe5c/y6Q0TT0zZ6LAaiwwTxX2S1R2tw/oYg1ICW3APykTpl3g5neWy
         g1nnWl1NWe5l1WkZuqaFt8bEmGur249h9e0LNRYegk7ASfIUjuejRcFLKOQtAEvhR3xC
         ZHo1caT3f9JbXz8b1bZ0+XI2vHl4uyW1sD3Jvt0m8Y/ifOSj2fojJt+Cer7QNSV3erGI
         tTgwicupGV3W2X2dwQwZk7AgJdyXHed/9NR8lp5cav87dktSKmZaBXa+qy+vRwfP+s3/
         dHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019551; x=1770624351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zf4unyiRORlqIaPPXQybFDN9bhdoOYo19zL5kOSCjqE=;
        b=vyd7r0fiFEptd+cmgQn9ztZzSqoc1szNhki0pJKgEvd5ZoIw6Qkdwk3Xfei06s7+XU
         cfiySg8viGKX33iTG1MhSXIHnwXQ0lccohgFMrpAa88vkTwkRyu9g0Dcej8T2cBH3esS
         9e63hqxulopjAy7mZQNq3FvI/GsF81hXw3vWTLX6LSmHaziy/j0OJnHy3gN2VEjMlxp3
         YMuqfY8eTxR8TSuvlK6cUAF8Uabz5lAr7ag5izOH/P06uRFICpRCvqjRKrUWqP8mvlGb
         Y4jkvMEmr8nbZcGTB13xZVkzEpOLoGK3chLPERBThFztsyG3vpY7CNqsn22NCzI4oDdr
         EXDw==
X-Forwarded-Encrypted: i=1; AJvYcCWbIT2nPOstBVXQ6cx61WRC7k3cBVK0fJxC1eMGCTDCWFyrjGifBn3wZ7efDXwBTSYf1sgF5jBVfnZDBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvB1Qgb4ifYJfZAO07UHzW+pJP2v0abgYo6ZGjBaVqGwSx/Ryx
	LPXiVuuTg8hDhOvsl8jGvSsp9Bu/PbVU1ZHJz7hCZwlq0ka3yMyqPlDu
X-Gm-Gg: AZuq6aKEZo2kxhcUDgeEYVfSPDLcm+YPuvh+3FxtwSdGTkBYy0yyTCkoGs8SHyNArc0
	CBKblIxFqfga74hIxXUTnzkp5MJTtgUPA8DcYuGnAskT2Tc2FSJ3VEqDdw0xOZuZtxUeqo1T5F8
	9vXvgCrDzN3dnYkp1cS9eXhI0LyRWzPIqRfNGsliVS7nJl0wLRKHIBR3fFZsv8pbdbHPBSaLiYR
	As5/wHKApAjhSEkeG4U4mgIinN8TsU7lBPquVSPp4g+xDuaczHeI1dHqWomLTFsPtKCQPp4Yb28
	m0OCyM7+U8GqmsNuahrBdxJSiYTQRAZK9lSz2pYDMgg+ivQC/E9vRJnYs3Rg3yp5In3v79nG2Ah
	BSa+XKN4njg0oi3/GjTGMqcpdnovueLV3/yeBMZUNGsSigzN90ZIUTMLUp2XvP/aGuLBDjty4bH
	DXClq23WJPK4g=
X-Received: by 2002:a05:600c:1e89:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-482db4ac0f4mr131691325e9.34.1770019550545;
        Mon, 02 Feb 2026 00:05:50 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:50 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] usb: phy: tegra: cosmetic fixes
Date: Mon,  2 Feb 2026 10:05:23 +0200
Message-ID: <20260202080526.23487-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202080526.23487-1-clamor95@gmail.com>
References: <20260202080526.23487-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC to its literal value instead of
using the BIT macro, as it is an enumeration. Correct the spelling in the
comment and rename uhsic_registers_shift to uhsic_registers_offset.
These changes are cosmetic and do not affect code behavior.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 12 ++++++------
 include/linux/usb/tegra_usb_phy.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index effa767ec019..3a7a74f01d1c 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -48,7 +48,7 @@
 #define TEGRA_USB_HOSTPC1_DEVLC			0x1b4
 #define   TEGRA_USB_HOSTPC1_DEVLC_PTS(x)	(((x) & 0x7) << 29)
 #define   TEGRA_USB_HOSTPC1_DEVLC_PHCD		BIT(22)
-#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC	BIT(2)
+#define   TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC	4
 
 /* Bits of PORTSC1, which will get cleared by writing 1 into them */
 #define TEGRA_PORTSC1_RWC_BITS	(PORT_CSC | PORT_PEC | PORT_OCC)
@@ -169,7 +169,7 @@
 /*
  * Tegra20 has no UTMIP registers on PHY2 and UHSIC registers start from 0x800
  * just where UTMIP registers should have been. This is the case only with Tegra20
- * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers shifter by 0x400
+ * Tegra30+ have UTMIP registers at 0x800 and UHSIC registers are shifted by 0x400
  * to 0xc00, but register layout is preserved.
  */
 #define UHSIC_PLL_CFG1				0x804
@@ -873,7 +873,7 @@ static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
 {
 	void __iomem *base = phy->regs;
-	u32 shift = phy->soc_config->uhsic_registers_shift;
+	u32 shift = phy->soc_config->uhsic_registers_offset;
 
 	return readl_relaxed(base + shift + reg);
 }
@@ -881,7 +881,7 @@ static u32 tegra_hsic_readl(struct tegra_usb_phy *phy, u32 reg)
 static void tegra_hsic_writel(struct tegra_usb_phy *phy, u32 reg, u32 value)
 {
 	void __iomem *base = phy->regs;
-	u32 shift = phy->soc_config->uhsic_registers_shift;
+	u32 shift = phy->soc_config->uhsic_registers_offset;
 
 	writel_relaxed(value, base + shift + reg);
 }
@@ -1469,7 +1469,7 @@ static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.requires_usbmode_setup = false,
 	.requires_extra_tuning_parameters = false,
 	.requires_pmc_ao_power_up = false,
-	.uhsic_registers_shift = 0,
+	.uhsic_registers_offset = 0,
 	.uhsic_tx_rtune = 0, /* 40 ohm */
 };
 
@@ -1479,7 +1479,7 @@ static const struct tegra_phy_soc_config tegra30_soc_config = {
 	.requires_usbmode_setup = true,
 	.requires_extra_tuning_parameters = true,
 	.requires_pmc_ao_power_up = true,
-	.uhsic_registers_shift = 0x400,
+	.uhsic_registers_offset = 0x400,
 	.uhsic_tx_rtune = 8,  /* 50 ohm */
 };
 
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 1a8843bd1e95..fbdd2dcb3a2b 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -24,7 +24,7 @@ struct gpio_desc;
  * requires_extra_tuning_parameters: true if xcvr_hsslew, hssquelch_level
  *      and hsdiscon_level should be set for adequate signal quality
  * requires_pmc_ao_power_up: true if USB AO is powered down by default
- * uhsic_registers_shift: for Tegra30+ where HSIC registers were shifted
+ * uhsic_registers_offset: for Tegra30+ where HSIC registers were offset
  *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on PHY2
  * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/PMOS driver
  */
@@ -35,7 +35,7 @@ struct tegra_phy_soc_config {
 	bool requires_usbmode_setup;
 	bool requires_extra_tuning_parameters;
 	bool requires_pmc_ao_power_up;
-	u32 uhsic_registers_shift;
+	u32 uhsic_registers_offset;
 	u32 uhsic_tx_rtune;
 };
 
-- 
2.51.0

