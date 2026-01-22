Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874102C3254
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094715; cv=none; b=OChwXHz5p6+xhG/LhkQrHTd5f7fJwvQqC6kQ7ImPWuT4lPd+T0hOSNBGu5ZYA8u6TejcLEekSsaupBLbNhO3Q6KOkTZ5UNE5/YCzWv0M7yVPFWjKUR+cbDL/1IwBIWFqaWPGQDpcGlrzPU0pxGqpcpMSZNUmfzGofwRgZ/nKr2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094715; c=relaxed/simple;
	bh=Dalp9JKi9nYaLgLeQTdmZa2HRLGvhzfShJ2gOCw/juM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABIEUhfnYHYLG+AiI5k0OIvQAIjdMes1QG1FWqUpWWOagAZc6zNJWigokeN2EIAb84DXc6/J5zxByb4oIb9otVIDqdUr9vHKpcu/E/gAE8VP75lYnOoVLj3TO948wnZ5SDTP7smm6/xSDlKLrItYQ+9GFCxK/mqPbZ0sVZ73MnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUEluEla; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUEluEla"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso6511025e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 07:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769094712; x=1769699512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajF+9IIPti7bTMujtf2+9NWft5TDbxjTIxiEYSTjvHI=;
        b=BUEluEla2hQMsL49vKAI7RHU/Vgr6/lLubR9ZVi8XsYjtkGCKfZvYjM2HmNiZpT39x
         xuLtnikRaYw4GfihodqB1mqIJVQBTyEgg8nRfLVBdv4QZOPGuBv145+ZhA1gTWiHYGz9
         /0IOYPmW5GzMpA3sNDujhMATE81zAk429aF+hQd/YqjUgAP1ERkQDyMqePkbp3E6mykY
         huAaCxqC3mQy5POQWoP7CTC3tT8UWgGZ48XNogOXkApK2y8okgx8twpPvRvIWKDK7ycz
         UsQ3BT9Q/WnT6xUjSHLZfu9hSZUaePXEAM+3oxuUFafDrK9mUQx5deNv7l2aCcBdSEmq
         TRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094712; x=1769699512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajF+9IIPti7bTMujtf2+9NWft5TDbxjTIxiEYSTjvHI=;
        b=OVdIEvFU0BL60dhenVRyHePuu7QuOVXv+J/COcNamjVfXPnVX1STURIashRvpf4vMq
         u2yhHdASZiPJj0OcSPUQ4sAiw4m5VxXbo6Y1/u/W0L5WMlZJxbH2Rv+IO3Y9M4vMmW+N
         7yNn1O2p2DstQdBs62j2BoyBMpQAi4WMRr0Qrx+887tAa5xGdlX4mPHlYg994vhPaVax
         HKH2NDKQS9UZTt2emqcsEIEFdvbi4WWGMV4dQcH8OtDEE0D5xU/xUk+M8EE9Y7WJOVcS
         JpasqFfx6S23x+mCxmHouMSwiEHu128rkMXsvlO+grfp8JG7Gu4g9KycaJyBYyxICGU9
         OWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+kFWswOwh1j4ukwyaX9Na9v/CUa/d4HuXkGp5OFImPH8rhJhxKKGLYJnf3U4wY8FqoYMqU8+517PR9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlNI87coEf0FdcN9VKNbcXbUMAEdmaZpBabO8xTB/KwbJtZtD
	w9lnWg5B1FsWAx4Aan5DwZdxrdKfhQce8fsIXwAxZ4GwebZFdfMPq5Pr
X-Gm-Gg: AZuq6aKiE2vjKcMZQYgDDe09LNXUJ4VI6tAPTa54N0gBbBGngU7DsDiUj/e995SWc+L
	fk59xMtqcGkJG3HSJI7OpeN1w8K4peXlLX9ok2PmOlWUN33iW9rhZjw1Jvj0Dwi/cjW5uPhLElK
	lbyXWtk/e1WY8rDzaQsrqljUvmOOkgrlUQs4sQOkl+APFa85JNXliUKeQer9FjzztSnrJ0ns0+r
	qq8wLi+M1+anr1Oijv0bFdcQhv4WLCachuAVkFgOqURcx6HIYrci/YNkvdce6vBl3a0/kqu+ugF
	gFLd7volP7QjzO4taHGiHPHorVROJX/rEZL324XEiU3VMlh2XZqBruac4qAQ5aOWclWGHDMXb5y
	OM8mRyAfEYSGuuEBqhCc/WmNu6uCNGX2oLyJKGpYD3CFygNVN/w96gtSAIOlxi4THm8y+9gKtk7
	v0
X-Received: by 2002:a05:600d:6450:10b0:477:58af:a91d with SMTP id 5b1f17b1804b1-480215e1ad9mr236546925e9.5.1769094711457;
        Thu, 22 Jan 2026 07:11:51 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804704b4e6sm74861705e9.7.2026.01.22.07.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:11:51 -0800 (PST)
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
Subject: [PATCH v3 1/2] usb: phy: tegra: use phy type directly
Date: Thu, 22 Jan 2026 17:11:24 +0200
Message-ID: <20260122151125.7367-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122151125.7367-1-clamor95@gmail.com>
References: <20260122151125.7367-1-clamor95@gmail.com>
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
 drivers/usb/phy/phy-tegra-usb.c   | 51 +++++++++++++++++++------------
 include/linux/usb/tegra_usb_phy.h |  2 +-
 2 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 1f527fcb42f6..afa5b5535f92 100644
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
 
@@ -836,15 +845,24 @@ static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
 
 static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
 {
-	int err;
+	int err = 0;
 
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

