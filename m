Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7879227B95;
	Thu,  4 Sep 2025 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003579; cv=none; b=gKTEJyZnXRTI3xGsIs25j+zYo95QVuqMQGJhiU72hjAFHRXC5MGJ4emo+owcvdQPgl/KZjSsoiEA6ivzuVhJJv1+2Oj4N5BUDasFJpzSIlYnhwyJpeYhN8TNx5jgz5FpDVnz+icBgJIpZCJZzRnRIRWO7/mDpQOPE8nGmrhobGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003579; c=relaxed/simple;
	bh=BaAGfeQaAKs7B2ACzamAP8RPce0xgQQ+zJgluZDNbWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qrg5R8BYxfb4nS7t1lS/2N/M9suSNIwl6Mzu8Nh4OT9tBIR5LDsV94mrSgByrLK6+EvHMr3s2pALa9cOPwv9hDqaqex8exfaYmN1yLOh9T08xxDtlN0Nwa+yLSJ4a+yQg2LueTWoC14bd9m4bb98zfKLM4B1LiZ5gtSMZ2ILZ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiuNB67r; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiuNB67r"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-560888dc903so1463487e87.2;
        Thu, 04 Sep 2025 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757003576; x=1757608376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlcAnNmmBdS5rCcBXjg8aSWdj0F+Loo7qwi2N0yukVs=;
        b=XiuNB67rdkCCgzP5FpZLMO52OqrskH5awkfYQjigpjMg9AGkYqw/oLok8LlTbV/wkC
         YhTxq/ri9ODceyf9aSSKv7WOGicUEbdEwqAVFHRqEExnz1Pap9VVxGKgSbSsJeVDv2qM
         oOaUFRDgx6VXwNPuPau9amW0GMk067FWi1h2jO3z6qRkzmXraGcEun99zfPMdF7zF8Vb
         dvQ/vKnDPNsqUTJY7j61ojHVOTZ2EX16+4kD4gdWEhUaN9RQw6wk3rf5eeKazcqxEyIz
         tHz9JrStnMmlJfwLS+pXU4cBCkR2a1DKt6k6B7yiUbFU+RSMx3tCBMMXJSJQY1DRLRP3
         gtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003576; x=1757608376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlcAnNmmBdS5rCcBXjg8aSWdj0F+Loo7qwi2N0yukVs=;
        b=irY0nhM6YV35iAawlwfrweShkvt0T6eQMi+lKuegBycy4fTRZA0yWCGzaxyyc07HDp
         R4t6M6kh7F69+gZHYmqImWYO0bFtVVAmrYxjGmC42HJad8jC0DPZcXAgZ8SauuLkXMky
         yK4i+kciYfKGmiSD7smzNASdTHwYQPrlEFOadaueuI/km4Gs3goOwixZT4IG9SAA+w4i
         YUYB5Gxj+Eaw1jqn6VdjYcxKBbb/0ZWWso+ZgN11IjWewfqBk4UD8gyaWHyMQWrwWiz/
         /k5G71iseWiGS5tNkkaQpVQ2oAklB+48IE11PWO4QafcTsUKpLFajGgNflATAojRttEp
         a5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUFzHAaRophnaQbdop3VlJ2y8GCgEgaMLbUXT4oFHz1qReM4PRs89kuzqqkU0y9HIAYIZa8bTqUFg7AC+Q=@vger.kernel.org, AJvYcCW8ZazU6OynWmHh4RlwZutU7pbJxPlbNBdMmQPzZgOJ3vfqPQZkjKvf116JF3XiplksyXy/popc3OpQ1eg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLLgRHDep+4/IfhTbpr+1pMavnv/Nmngkn1bcQLcSQbrGog8Gv
	hLbZbGsbmM/2UEqtQeLijbJ4eiGedwhHP8qBpt77OGec9zNunY4jaZk7
X-Gm-Gg: ASbGncv2MezKu3WsvUhrt/pchooRQ4MGcy2JQPbQhEuxyPyOM57vvBfVihHrUZe3vTF
	OVVT0CEf/XSderBOkQKnB0zyt1Vew6vL/9fAQsG8WqnJf+fxj0nqSrKHAtsnmhhZhIYNQbqzFDR
	aTgnLD2Ufb6LLWKwUNAtbbTfWjiBB0kFwbaKjpD9YALXjugf9bxvRwJtjUlIR6uY/euoCKnpjv0
	t+WiYUWYp1xWhmGP6bOAthSRdCaPJYtCIoyc6fN69pNV3nMCxd32QdKYcP6wtRnDaVZXlZdYwhp
	u+sJB3IFdFaNOZ6uj2LA7WPDA6E6TE8aWDY4UJuts3cQPUnaDComtrpnNiROzhQsSfoxoPRsfey
	uSx40m0DRqTcQSqyYjCoM0AYt
X-Google-Smtp-Source: AGHT+IHJOlDysoKYtju5cDgODBCngzT0gBpjiMOYyqfkFAGwFs7bp3t+j7pZgI5Q/sbu3/ktuou6eA==
X-Received: by 2002:a05:6512:4202:b0:560:932a:c3c7 with SMTP id 2adb3069b0e04-560932ac4cemr855919e87.13.1757003575648;
        Thu, 04 Sep 2025 09:32:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad45889sm1272978e87.138.2025.09.04.09.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:32:55 -0700 (PDT)
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
Subject: [PATCH v1 1/2] usb: phy: tegra: use phy type directly
Date: Thu,  4 Sep 2025 19:32:37 +0300
Message-ID: <20250904163238.238105-2-clamor95@gmail.com>
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

Refactor to directly use enum usb_phy_interface to determine the PHY mode.
This change is in preparation for adding support for HSIC mode.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 55 +++++++++++++++++++------------
 include/linux/usb/tegra_usb_phy.h |  2 +-
 2 files changed, 35 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index e7b178e8fbaa..d3c29af1217c 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -871,10 +871,19 @@ static int tegra_usb_phy_power_on(struct tegra_usb_phy *phy)
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
 
@@ -893,10 +902,19 @@ static int tegra_usb_phy_power_off(struct tegra_usb_phy *phy)
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
 
@@ -915,7 +933,7 @@ static void tegra_usb_phy_shutdown(struct usb_phy *u_phy)
 	usb_phy_set_wakeup(u_phy, false);
 	tegra_usb_phy_power_off(phy);
 
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmip_pad_close(phy);
 
 	regulator_disable(phy->vbus);
@@ -1101,7 +1119,7 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 		goto disable_clk;
 	}
 
-	if (!phy->is_ulpi_phy) {
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI) {
 		err = utmip_pad_open(phy);
 		if (err)
 			goto disable_vbus;
@@ -1118,7 +1136,7 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 	return 0;
 
 close_phy:
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmip_pad_close(phy);
 
 disable_vbus:
@@ -1136,7 +1154,7 @@ void tegra_usb_phy_preresume(struct usb_phy *u_phy)
 {
 	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
 
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmi_phy_preresume(phy);
 }
 EXPORT_SYMBOL_GPL(tegra_usb_phy_preresume);
@@ -1145,7 +1163,7 @@ void tegra_usb_phy_postresume(struct usb_phy *u_phy)
 {
 	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
 
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmi_phy_postresume(phy);
 }
 EXPORT_SYMBOL_GPL(tegra_usb_phy_postresume);
@@ -1155,7 +1173,7 @@ void tegra_ehci_phy_restore_start(struct usb_phy *u_phy,
 {
 	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
 
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmi_phy_restore_start(phy, port_speed);
 }
 EXPORT_SYMBOL_GPL(tegra_ehci_phy_restore_start);
@@ -1164,7 +1182,7 @@ void tegra_ehci_phy_restore_end(struct usb_phy *u_phy)
 {
 	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
 
-	if (!phy->is_ulpi_phy)
+	if (phy->phy_type == USBPHY_INTERFACE_MODE_UTMI)
 		utmi_phy_restore_end(phy);
 }
 EXPORT_SYMBOL_GPL(tegra_ehci_phy_restore_end);
@@ -1193,8 +1211,6 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 	struct resource *res;
 	int err;
 
-	tegra_phy->is_ulpi_phy = false;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!res) {
 		dev_err(&pdev->dev, "Failed to get UTMI pad regs\n");
@@ -1369,7 +1385,6 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct tegra_usb_phy *tegra_phy;
-	enum usb_phy_interface phy_type;
 	struct reset_control *reset;
 	struct gpio_desc *gpiod;
 	struct resource *res;
@@ -1431,8 +1446,8 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	phy_type = of_usb_get_phy_mode(np);
-	switch (phy_type) {
+	tegra_phy->phy_type = of_usb_get_phy_mode(np);
+	switch (tegra_phy->phy_type) {
 	case USBPHY_INTERFACE_MODE_UTMI:
 		err = utmi_phy_probe(tegra_phy, pdev);
 		if (err)
@@ -1458,8 +1473,6 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		break;
 
 	case USBPHY_INTERFACE_MODE_ULPI:
-		tegra_phy->is_ulpi_phy = true;
-
 		tegra_phy->clk = devm_clk_get(&pdev->dev, "ulpi-link");
 		err = PTR_ERR_OR_ZERO(tegra_phy->clk);
 		if (err) {
@@ -1499,7 +1512,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 
 	default:
 		dev_err(&pdev->dev, "phy_type %u is invalid or unsupported\n",
-			phy_type);
+			tegra_phy->phy_type);
 		return -EINVAL;
 	}
 
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index b4b55dd11ced..101da5f53815 100644
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
2.48.1

