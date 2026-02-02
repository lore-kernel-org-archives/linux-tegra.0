Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDBC311C15
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 08:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019557; cv=none; b=cx8Cbneac2uEv4qurgzJLnaD+GYaMEzOE4eisrMAlSNa9hrCEkHmlK1XFgijxjnjINsC1IfbEsPhg3rf0M5pBS0uOUDeHTjcKCo/HKlMBKv2yFvaICG2hEEESjiHOKtyMdXYgm+ByNdIKQ7YIcFghE/O6D9cpit/Bs2PbtXbH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019557; c=relaxed/simple;
	bh=4DLuHDpXAVSEadkbFoPphu57qatbcSuZfLy7Dg1mEiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksq4bHgkTT9dK88MNfZCLg+xvCnCVpX+6GM6RHfnbwLo0JxHieK5WpSnwIPmBEbJlvT750BrBnl1yRZ/3nZAIM8sfxgNEowcfwzZTYYejuERLD4fi4G85ZExRjNHlSy2stmNukLuJZI+kgxnMmtfu6rQoh5Usd8D5ohvZiV/Zk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ic+NJa+V; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ic+NJa+V"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so29697855e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 00:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019552; x=1770624352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9k1zjIr03iooF2YM3kRmAjERuwBowXr3HGt8AVXOiw=;
        b=Ic+NJa+V03sLjetxA/dH8u42g5eBTmgG+dMAFgpYxQyMSZq/i+UpgVL4jgu8f60iPH
         DQ+XA2y19M9nQNk7Fk8jPPMvb1k6PLS4L9oCYrt3VU/i6KGR+yQFQ4FcF+++fAqtf0fQ
         lfSTIpIIM1rWOA2j+/2iJ9ANcHAoX1Q76kcIj6DyJBNhRk6mGwEAsuIQJ3HPsQ3a9B0v
         BSr/qPRxonn5279mm56b6d8LGQwk1cmVlqM+GFXWrdrgEdBo0RXNbII8of+opeUA58rq
         JASeWkISpCRJm72gMzwn+2bA5pC/+Evtwh3IC1YQfHlr+4+LjXhnLS/eReBxkAK9mYhw
         Nn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019552; x=1770624352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W9k1zjIr03iooF2YM3kRmAjERuwBowXr3HGt8AVXOiw=;
        b=flOGDk1NQ4DGz+vu5PhkeP3lXAk40oAYKHqbSKYPttEJ9BiNe/BnM1kWZdynrWZ4HD
         d+sBz7A0GxVTlEhrOoUJ/h2cWu0V1tp98N1MHziFCP01jGmPaJYSggXQbWu+tZ5FxMJE
         JS5K1aP3t8z4RBTWH+WiMFdJxmCSBk801mE0E+KDZGIUdrKxllwv/VGv1xzsbA7H9zsk
         Ie+zRsHbm2FMZ0QQY9195aud2dLLjTwNuPGiYrlxRRoFKXvpTvalelenmK4jQRk7Poco
         jqutEA+HzJCutGq3GeGpXUmwW8D5afYol8+t22uY136FSGffPc5pVrSMtngvdh6CZ9+K
         F2tw==
X-Forwarded-Encrypted: i=1; AJvYcCUXX0nDqXIfVvY+fMkQgQaWql6l4mVBEVAqQSPaPsTn3wmdUjdoTJ1rG4Vx+c1llfXCWTQcXmVF/2oPMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLA2/0PCtSYtPYVGVQI3GhhZcAzpuyZtjCr5IHJWPVvxtA5Co
	ogYUZzElUy7/o26dXQrbUayvks6j9ZwvF48pheNiCJx6zx51v5dcw6Uf
X-Gm-Gg: AZuq6aJRYlp+YDiwXFgVrMXJuxso9tKKT+EEvpqaGZVp3St6BQDh8PycthLy7f9gtId
	JuEHsLQWngFqS66qqBj8SMODghz1Al+siL7YjUZA3jLPv9uj1xe8PQfQOyShdhD81E+KXoxbYYL
	KynmNCmZyqaLFMPXI+7K7xqTJqCCLxMdPCVY/1tnCn0mglTL+aPitg8yT2ZvMqpTWUA6RH4j14T
	bDAKzFd791h3kDmxsA9DnJgu6PpRvHcBRPHnYiWu67WFmAfQ/NLAZjYiCd896Ctr/ASiSpchXTd
	Q02cfjuVr8d0d2/c7x24JsB57yVgiTl/mVGypVKAcc4V9XGGFZz96tA9hWIrVINEJVo5w7hsl2J
	luu0EybbRnKO2K4h/dw+C/RWDhECgZDPy/WGdr22wb29KE2MMyBfRDhc3yAf+Wjr9npvPUFICNP
	smXaQ0K7YZj1c=
X-Received: by 2002:a05:600c:4e56:b0:480:53ce:45d3 with SMTP id 5b1f17b1804b1-482db47cdc5mr122394605e9.18.1770019552325;
        Mon, 02 Feb 2026 00:05:52 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:51 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] usb: phy: tegra: parametrize HSIC PTS value
Date: Mon,  2 Feb 2026 10:05:25 +0200
Message-ID: <20260202080526.23487-4-clamor95@gmail.com>
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

The parallel transceiver select used in HSIC mode differs on Tegra20,
where it uses the UTMI value (0), whereas Tegra30+ uses a dedicated HSIC
value. Reflect this in the SoC config.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 7 +++----
 include/linux/usb/tegra_usb_phy.h | 2 ++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 6173b240c3ea..812d99443180 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -957,10 +957,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + USB_USBMODE);
 	}
 
-	if (phy->soc_config->has_hostpc)
-		set_pts(phy, TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC);
-	else
-		set_pts(phy, 0);
+	set_pts(phy, phy->soc_config->uhsic_pts_value);
 
 	val = readl_relaxed(base + USB_TXFILLTUNING);
 	if ((val & USB_FIFO_TXFILL_MASK) != USB_FIFO_TXFILL_THRES(0x10)) {
@@ -1474,6 +1471,7 @@ static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.requires_pmc_ao_power_up = false,
 	.uhsic_registers_offset = 0,
 	.uhsic_tx_rtune = 0, /* 40 ohm */
+	.uhsic_pts_value = 0, /* UTMI */
 };
 
 static const struct tegra_phy_soc_config tegra30_soc_config = {
@@ -1484,6 +1482,7 @@ static const struct tegra_phy_soc_config tegra30_soc_config = {
 	.requires_pmc_ao_power_up = true,
 	.uhsic_registers_offset = 0x400,
 	.uhsic_tx_rtune = 8,  /* 50 ohm */
+	.uhsic_pts_value = TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC,
 };
 
 static const struct of_device_id tegra_usb_phy_id_table[] = {
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index fbdd2dcb3a2b..81d9f22e58b5 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -27,6 +27,7 @@ struct gpio_desc;
  * uhsic_registers_offset: for Tegra30+ where HSIC registers were offset
  *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on PHY2
  * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/PMOS driver
+ * uhsic_pts_value: parallel transceiver select enumeration value
  */
 
 struct tegra_phy_soc_config {
@@ -37,6 +38,7 @@ struct tegra_phy_soc_config {
 	bool requires_pmc_ao_power_up;
 	u32 uhsic_registers_offset;
 	u32 uhsic_tx_rtune;
+	u32 uhsic_pts_value;
 };
 
 struct tegra_utmip_config {
-- 
2.51.0

