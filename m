Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD9C32AAA9
	for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483143; cv=none; b=TYlrgiHquS3FGlEhA6vlIFJc0h5f/J89bHqQXV5y7398jT+98oEV1GJ9eJiuhsL4GTPtzNcRiRllanyFe00d1/j7D+PCRJNBn5bLJ4zQ8LU0MtXZ3j0i0f8tu5AEmOmxV9NXp5qrXbm2p9eEWfS5tgdxbi8HjrpMrVv8JcLQ2kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483143; c=relaxed/simple;
	bh=DKeetzW3ONgxZzrSbR0sHWi+YgHN+BQmgsjoHD3eC64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRQDk6nb9Ql7utEHjZt8H8i65dSPjvjq6LrjRQkQU8OMXmEwdghIVxL1oycgzhdgTuJyugAgzu3W7Uj5gBL/PBWKJpJ5QIkOYIil1rngMTDb5/DOz7Zrvanrk9Gu7fR3Pky8MNXCIJM331r5PvwRravlT8D8qL1Kgc0y8Nl7l50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+QInOhJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+QInOhJ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so3581685f8f.2
        for <linux-tegra@vger.kernel.org>; Tue, 23 Dec 2025 01:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766483140; x=1767087940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4gxDi6v3H2DADeHS72LcwIC06VwKI575ueVFsSjhfU=;
        b=j+QInOhJSE8fbnpMSJSMVtWsb6AhsPwNpiK/HAVbz7t8/wFMDLxWOpCNjVQmvPkgvw
         GorloCZ1Pt/GIhrP24PLgbOC0DskbZF9p1gCr4O9ey3uiIpFmIBwLI24hq4OZbQjkTOm
         mQpdgA3E4vMCToVoIAivu5vdQh5qdjf0Ho9CWuScvy4Om1e1snl3rXGfHxZ/duUrIrrV
         FviR44dE375y1+S687vsQ7VltBh7ZjBUpp6VhLWxDIxiPzRzDMo9MinokcUnJzBr/Gz6
         tmJn1ImyKqlWLEulV7U5+Qg4U1tJtxUYBfRJXa6Irki4Kkaa3XvIR+mHCrL/MmnwV09z
         9ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483140; x=1767087940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d4gxDi6v3H2DADeHS72LcwIC06VwKI575ueVFsSjhfU=;
        b=JlUL8TD2+GAnS0r5vI20Pa0+Ft9VnsH2zxjZsEJwaaq0FEA4Laa4RMJFP9+uOgX9pW
         /E8TcdXYnx6SdupyOUlQuGNjTyg8GROnjL16TZYVYkJAGsQ73fQMW+qK96EybhwzUkBd
         PUkCPyw+xn3TTihagwna9O6iYcs4+5EcL2zGtg4VZBXGuY0aaqCPKLeU2jR34TMwjL9V
         0BdA1uGWwKhSOF5h7UL5RKa0in9xGmnBI5z+IU9x3ao8cZHUW12OAGCFd9phBNVtI7WB
         izvkOuvJApGIholjFgVlCqZ0SA7qgi8WD9a8wPTrCkNFx5SGg7tJWMwCw1227pPM3ge/
         eJxA==
X-Forwarded-Encrypted: i=1; AJvYcCXk+XVK3NztI87gMR4gY/lItuFoqOJrc46cFhrCpk4QFYhzzPR43TyLGGADXZbd+XbzgCQNXp9dc+Fs2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzJ9002Ot6DbBl8FdbHpkRmPA2EO7+T3FKzKXNcH3k4ZH3MWQ
	IvztG4cMjbOOnTWmA9yMxPW7SHbFeRCLeBvHZoLkODmPTfxV7subNU34
X-Gm-Gg: AY/fxX7ykAy+DlHLlPwcZp0gopwPujwKf9B5nM0qLysCjCn/dYwaJsEbsAn5UGUdCSX
	6fQGOoKTEc/CEP7m0lpg1KOB49/2nhtasTn3U68bww2DentORql+Jd+a6mAuP/kHBrodMcl4nJs
	VBuWp64y29Ey0NY79mti5J97WmT5t4R+mACjb8K48kobEIB8XrbxZgs99ZvzdNuk++Q5uPJllLW
	+qHAMvBtfaPyGntCfnmybfg7tkaFIGvdsHxQ4QUENxftRr2vY+UwGqaNz7/tw3Ndf576tBgRip7
	smhLjZ4I/BE8bfLBizJK6LQHLQ+iSYi8SQSvxSDOOcIsvbGmlDxrPZHYV/wS4mVAphDN2fayBoZ
	GWEjiAwfkF0bh1zCCTrum1LSN8kU5O7ffzF4OOrHdngF3mMxYtePQUs2ocfzyJkcNOrY21POLlS
	2F
X-Google-Smtp-Source: AGHT+IGjtntSpEM/XfblJzXJtwYQ7LvnZlKwUDhjMjjIEG2BTcu9fpyPlUzavrUxiMQLMRU/++RUmg==
X-Received: by 2002:a05:6000:2586:b0:430:fcda:452d with SMTP id ffacd0b85a97d-4324e4cbd79mr15227367f8f.22.1766483140047;
        Tue, 23 Dec 2025 01:45:40 -0800 (PST)
Received: from xeon ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1ae12sm25759024f8f.6.2025.12.23.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:45:39 -0800 (PST)
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
Subject: [PATCH v2 1/2] usb: phy: tegra: use phy type directly
Date: Tue, 23 Dec 2025 11:45:28 +0200
Message-ID: <20251223094529.7202-2-clamor95@gmail.com>
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

Refactor to directly use enum usb_phy_interface to determine the PHY mode.
This change is in preparation for adding support for HSIC mode.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 49 +++++++++++++++++++------------
 include/linux/usb/tegra_usb_phy.h |  2 +-
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 1f527fcb42f6..13232b074649 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -814,15 +814,24 @@ static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 
 static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
 {
-	int err;
+	int err = 0;
 
 	if (phy->powered_on)
 		return 0;
 
-	if (phy->is_ulpi_phy)
-		err = ulpi_phy_power_on(phy);
-	else
+	switch (phy->phy_type) {
+	case USBPHY_INTERFACE_MODE_UTMI:
 		err = utmi_phy_power_on(phy);
+		break;
+
+	case USBPHY_INTERFACE_MODE_ULPI:
+		err = ulpi_phy_power_on(phy);
+		break;
+
+	default:
+		break;
+	}
+
 	if (err)
 		return err;
 
@@ -841,10 +850,19 @@ static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
 	if (!phy->powered_on)
 		return 0;
 
-	if (phy->is_ulpi_phy)
-		err = ulpi_phy_power_off(phy);
-	else
+	switch (phy->phy_type) {
+	case USBPHY_INTERFACE_MODE_UTMI:
 		err = utmi_phy_power_off(phy);
+		break;
+
+	case USBPHY_INTERFACE_MODE_ULPI:
+		err = ulpi_phy_power_off(phy);
+		break;
+
+	default:
+		break;
+	}
+
 	if (err)
 		return err;
 
@@ -863,7 +881,7 @@ static void tegra_usb_phy_shutdown(struct usb_phy *u_phy)
 	usb_phy_set_wakeup(u_phy, false);
 	tegra_usb_phy_power_off(phy);
 
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmip_pad_close(phy);
 
 	regulator_disable(phy->vbus);
@@ -1049,7 +1067,7 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 		goto disable_clk;
 	}
 
-	if (!phy->is_ulpi_phy) {
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI) {
 		err = utmip_pad_open(phy);
 		if (err)
 			goto disable_vbus;
@@ -1066,7 +1084,7 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 	return 0;
 
 close_phy:
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmip_pad_close(phy);
 
 disable_vbus:
@@ -1104,8 +1122,6 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 	struct resource *res;
 	int err;
 
-	tegra_phy->is_ulpi_phy = false;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!res) {
 		dev_err(&pdev->dev, "Failed to get UTMI pad regs\n");
@@ -1280,7 +1296,6 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct tegra_usb_phy *tegra_phy;
-	enum usb_phy_interface phy_type;
 	struct reset_control *reset;
 	struct gpio_desc *gpiod;
 	struct resource *res;
@@ -1342,8 +1357,8 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	phy_type = of_usb_get_phy_mode(np);
-	switch (phy_type) {
+	tegra_phy->phy_type = of_usb_get_phy_mode(np);
+	switch (tegra_phy->phy_type) {
 	case USBPHY_INTERFACE_MODE_UTMI:
 		err = utmi_phy_probe(tegra_phy, pdev);
 		if (err)
@@ -1369,8 +1384,6 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		break;
 
 	case USBPHY_INTERFACE_MODE_ULPI:
-		tegra_phy->is_ulpi_phy = true;
-
 		tegra_phy->clk = devm_clk_get(&pdev->dev, "ulpi-link");
 		err = PTR_ERR_OR_ZERO(tegra_phy->clk);
 		if (err) {
@@ -1410,7 +1423,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 
 	default:
 		dev_err(&pdev->dev, "phy_type %u is invalid or unsupported\n",
-			phy_type);
+			tegra_phy->phy_type);
 		return -EINVAL;
 	}
 
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index c314fad5e375..e394f4880b7e 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -73,7 +73,7 @@ struct tegra_usb_phy {
 	struct usb_phy *ulpi;
 	struct usb_phy u_phy;
 	bool is_legacy_phy;
-	bool is_ulpi_phy;
+	enum usb_phy_interface phy_type;
 	struct gpio_desc *reset_gpio;
 	struct reset_control *pad_rst;
 	bool wakeup_enabled;
-- 
2.51.0

