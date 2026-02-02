Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018E03148C2
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019556; cv=none; b=CFprB56lBDNL/vvQZIOv+b8I4gsnqkosPuMX6zmMCQ2JnixiaTM4H8Le8VOVQ7kdrguw0B7S2IXr3ydwqnwHzn1aw1JjYp88jR+jfhOaHsGeT1Zi+GNycRkh0jrOj12lgric2HzVoJ+62wWWQpJH1UWuemw8Uvp6hyxHepz72FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019556; c=relaxed/simple;
	bh=V3jvzW11PyDhK8lR9wu29ch6YrkIS1se+hxEZ5/pSOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tHSAzdOAPl9j91ewynN6r/SXiJFkWapOhxEPnTL5IhqKdvGrS79XwKxumsbzUs8CAK/4lIh1zsEN96uCzzfmasPEAPrANoGLWzX2XnAWoFB9BdNXDa24XY6o/QDJeqNL7ZOaE/1mmXfodPNR6DYdkkOiRzBwgTYVMJnGu9MQuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cU+Ybqpl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cU+Ybqpl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-481188b7760so26152235e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 00:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019553; x=1770624353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/sUdOuzlxCbV7DR0QBRghRBYHyuYh6kbLEBCenrgxA=;
        b=cU+YbqplKThuL0yFRunbnjXJqyHIKGc571XT99y8S3yHkpLx766BO4Bt7G8kK2hLOh
         VmrkCZvQNSai6sm/fiUFNIGDR/BVjbOITztPF98B60ZibsfY/jX0hBzxvG5ZTQucUAyA
         sw2N8oNy5PjkPJFpNHGhJju2cOCnYHQ3tbJ2249umQrVU3u6XyqO8cfLax9+Cl+5owao
         Vyr0Q3KrxqtkfH2tX9TVhtc0mdAdo09Nxjl7811STXVPXzIIGxkXMAcqX5kkvBeYGxaT
         1EkZAAxS2f5Sel53Ttf6+8OcOVjg9tKBTTB8YzBLEHO/4McVO11tLa4ZcGA4EiLINwUT
         zTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019553; x=1770624353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/sUdOuzlxCbV7DR0QBRghRBYHyuYh6kbLEBCenrgxA=;
        b=QH2ENKBrBcU0NZ8eUTP0RpzJQQtCZ/IK48VFgGNKulUhNVh8WpiL/3DVdPy3oxVwYZ
         Zg/ytE/bweUbaofrBshY/khH82QJ6D0CalTfbpCm/7uJfOjdVUwqVj2GccAE/C6KoGVe
         SFrEaCxJWNRO7OkSjVoftxxSDCSS8eTwymBeU8I3iFZmz+6SbdN0l8V35ZMxEjQPXfIs
         k9wOCarn6Xq80KKAq1swmC0hAp7agkAgGtzxpD7uBVfzX1WPt+4BRAnsmCdex16mTpfU
         zkyaoh0qoY3sei49WHINQLXc3WP8LvPDuzirbjYQp2DEY0TL50VTlUhbt12AqJfvoP8j
         N/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLHj8U8utZm7GdU2mta8V4IvOSoliJBZG7b1h4GIqdcYBp2c0v3g3LT0lwG9O8ogC69V5/K4sGDqX1pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+jzCD2WF1W1JPtOXgUUjXbcRekUq5QizO1KKdUH7EN2QZiK+z
	qbR/suDMVjUkyii2BO1KuJ2vxNcLJTPuAYw0cOvbCEdeLgmOyAwRWdFy
X-Gm-Gg: AZuq6aKo0qIUWSBjBhMjTXLdhgDSq1A2C/FGsUUbGjxzCoyKiod/xHB029PaTDUBJ2k
	uxrhyObYmLTwth2sAKAtY9GW2lDPYE00Nmz+fweufeJxfiga/hZ4PrPKzmAkdwBhJlkCs+T0E8p
	8JGAzDU0oQVmd58F+ZVne4tmY9zVene6CPSfN03s3/rvMXSy4LpYW6JIR14QHELvN1w33ExuXON
	gntlyau3RTGjt/UGOsHkLFKkuh2nRMxVz2oPOTDcrxrGWI5xMYuWvw2KXjwZS9J5+XsTO+SG/Cx
	dSTV/lgtlJ40m4J6KJ/tvL04AnAuUPOuuL3ZLUE0OH3uO04t+HJPgQNOoFSmlROQZyAb/ddxu7+
	hRp2EVTRS828dwV8a/AUVxsw468dFnqfIPzCYNs6OhuG/kB/tg+WxF2dd2uV5K1knqSSRBMC/Yz
	GN
X-Received: by 2002:a05:600c:8116:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-482db460140mr119083985e9.13.1770019553184;
        Mon, 02 Feb 2026 00:05:53 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:52 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] usb: phy: tegra: parametrize PORTSC1 register offset
Date: Mon,  2 Feb 2026 10:05:26 +0200
Message-ID: <20260202080526.23487-5-clamor95@gmail.com>
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

The PORTSC1 register has a different offset in Tegra20 compared to
Tegra30+, yet they share a crucial set of registers required for HSIC
functionality. Reflect this register offset change in the SoC config.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 17 ++++++-----------
 include/linux/usb/tegra_usb_phy.h |  2 ++
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 812d99443180..00443a7beaeb 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -965,17 +965,10 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 		writel_relaxed(val, base + USB_TXFILLTUNING);
 	}
 
-	if (phy->soc_config->has_hostpc) {
-		val = readl_relaxed(base + TEGRA30_USB_PORTSC1);
-		val &= ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
-			 TEGRA_USB_PORTSC1_WKCN);
-		writel_relaxed(val, base + TEGRA30_USB_PORTSC1);
-	} else {
-		val = readl_relaxed(base + TEGRA_USB_PORTSC1);
-		val &= ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
-			 TEGRA_USB_PORTSC1_WKCN);
-		writel_relaxed(val, base + TEGRA_USB_PORTSC1);
-	}
+	val = readl_relaxed(base + phy->soc_config->portsc1_offset);
+	val &= ~(TEGRA_USB_PORTSC1_WKOC | TEGRA_USB_PORTSC1_WKDS |
+		 TEGRA_USB_PORTSC1_WKCN);
+	writel_relaxed(val, base + phy->soc_config->portsc1_offset);
 
 	val = tegra_hsic_readl(phy, UHSIC_PADS_CFG0);
 	val &= ~UHSIC_TX_RTUNEN;
@@ -1472,6 +1465,7 @@ static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.uhsic_registers_offset = 0,
 	.uhsic_tx_rtune = 0, /* 40 ohm */
 	.uhsic_pts_value = 0, /* UTMI */
+	.portsc1_offset = TEGRA_USB_PORTSC1,
 };
 
 static const struct tegra_phy_soc_config tegra30_soc_config = {
@@ -1483,6 +1477,7 @@ static const struct tegra_phy_soc_config tegra30_soc_config = {
 	.uhsic_registers_offset = 0x400,
 	.uhsic_tx_rtune = 8,  /* 50 ohm */
 	.uhsic_pts_value = TEGRA_USB_HOSTPC1_DEVLC_PTS_HSIC,
+	.portsc1_offset = TEGRA30_USB_PORTSC1,
 };
 
 static const struct of_device_id tegra_usb_phy_id_table[] = {
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 81d9f22e58b5..57e22aae6247 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -28,6 +28,7 @@ struct gpio_desc;
  *      comparing to Tegra20 by 0x400, since Tegra20 has no UTMIP on PHY2
  * uhsic_tx_rtune: fine tuned 50 Ohm termination resistor for NMOS/PMOS driver
  * uhsic_pts_value: parallel transceiver select enumeration value
+ * portsc1_offset: register offset of PORTSC1
  */
 
 struct tegra_phy_soc_config {
@@ -39,6 +40,7 @@ struct tegra_phy_soc_config {
 	u32 uhsic_registers_offset;
 	u32 uhsic_tx_rtune;
 	u32 uhsic_pts_value;
+	u32 portsc1_offset;
 };
 
 struct tegra_utmip_config {
-- 
2.51.0

