Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5681F3FBEAC
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507863; cv=none; b=FLXgrNpWRy9DURqvbEiMDtvwjr0l1J6CiNHtEmkd2WN35+SmLCSKpZY5QsB86qQgjB5kTXEnKRc2IgFLFHJAL3a7Zb33mFFVZzRDq8vi3zRJwZc46if5+IH61JzSSAxUYnrR9us4mBb12VyRQCSWGFQjp7wJyj4UVBCfpG1/CME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507863; c=relaxed/simple;
	bh=DQcI0kwaHzVx7Qs6ED7T70odRLTczs+nCkruvRLsQN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDA1oNGjgRN8kco99E0q9VJ2jQ7WGB25h6TkLTbHQAPmTfDHs/L+pAuffpcUspBkVvIR+7GeU/b51HE33MMNLFk+iOanhM0JEEtAzD4gCBIWoHpi0eCynnxr9DX3tECbrX9LLJb9ViBtSqSzRS71uIKMR8fbnnbqAVQgYWd/ISM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzkNX5Qe; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzkNX5Qe"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so7861269a12.2
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507852; x=1779112652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rESskTJRprzdwEOE8g7SuHaYWt4FLnX54fziSgA+Tro=;
        b=MzkNX5QeTKOBfizYW6LUoupYsvm+tm+79R2q9zn/BWeZGhieb33g4NSTpKXH6zl6MY
         qezJp57iRz9YJtYwQ96WdoSp/1xGLk3/3HgEBkIPWf0KaqxJ+ILQuLYu0AF33enorKQP
         lUzqVI6fQFpr1fEjP4TnfpuW4RLG38QxSxFpkx86k+Vf88p4kCLe8maW2z2ZMdeX9Qku
         r09Hu56Q6Y8GBkyF7ymRsYJLVjLMKNp1zX42McX4l88P5w3TvYSWL9BKHqidEj59cfhe
         lIKMQjXWy3XrFHAhTXShnfOWACh/Rm8CsQh/Xhxr7XMrhR0dHeKHv7YEbZHRrQI91O3L
         2W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507852; x=1779112652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rESskTJRprzdwEOE8g7SuHaYWt4FLnX54fziSgA+Tro=;
        b=sMoD7sXRoaEM8dTC/7QdcqadxgAC7QPDyVMob4N3MaAmVTn4jIts+1b46qkHtT0b7x
         FgMsByIi0lM2KBdbr32VASessNaFxB46XZS9ljxrqnXYsfJ5kzImFVDCI9gj0JG/MVxQ
         84rGhlmfPW50S3JrcmXQygbe8ZN51YKr9VWwpzCttEA+MnExL2m0BHkh1FcbDCXY1VBf
         FWZB1BPolQ1Oxj5wFCt/J2aR3wDHVVlVixBl6NuH6N53+wGDhQOZ34ygDkqPd5H9jKlq
         5vUPs3M7Wlx/HeEhk/3ITg/ZOIIJQPQWHn28PB4ZRl/Y63Tb4dW0ykiFGRRmt5oaZMWd
         y4FQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Bxr+NomPgWaDUk3kGhcdXQrSktwSkQLszgfSECGQJi87nTyqPeZu8c4Fq4ktKwHaau89n0txua3xmKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4Zolt/ZRfcyOE90rM2V7lwiAEMCfLjl4JtwXJb/8JpngSb0Z
	yUcPQ2KE8c1avHSHoXZif+D4pW9JhNef+9jgW04RPdC9p8ZAuV7zG2r/
X-Gm-Gg: Acq92OGZKSfyx7znvGPwVAmXvgB20Pa9531oOlnLX/crco/LWD0NnM3e3cKHicU7iWf
	irrx7Dj1VlQsnMNEHjyhGVllWdCbR2JRd1MJV/p/4RurmpmmZaZoSew7/DvH6CSFcK1ebJMLFJ4
	Y/E4Cv5RpSCq6Ruq7/3Hw5cuQicAMuePRFw/nubfk3Ud9JhgfP3qB3ILdATIE1IFhXUVAGzAkby
	HBGnPlWuAjnVG7O8l0cANuM25vo9wNLx2Cn4mcCeQ0nJWHD7k281NzFsI6erS8fC3UH8Y1Ubhu2
	RrS+9nhnPLUTyb/V/OlFhwW6lBEOOkHAMnoSe3apPg/NKIiOiVZ74QTxP5KvxwhU4Wd67EiqHMX
	yWKZyemvpfCWHM+Awo33y54/Uji9SmNzW7mVK2uRWUvs1uPBLO2mikHn8QMmoq8BDLK/z0XLRcC
	/gFtgNc/SWjiCx
X-Received: by 2002:a05:6402:455a:b0:66a:8002:fe17 with SMTP id 4fb4d7f45d1cf-67ef09a34a1mr5628664a12.13.1778507852037;
        Mon, 11 May 2026 06:57:32 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:31 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 4/6] net: usb: Add Infineon XMM6260 Baseband modem support
Date: Mon, 11 May 2026 16:56:59 +0300
Message-ID: <20260511135703.62470-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
for smartphones, data cards, and Machine-to-Machine (M2M) applications.
The modem is usually connected via the application processor's USB line
in HSIC mode; however, to work properly, the modem must control this line

Dmesg with modem appearing on LG Optimus Vu (P895):

[    9.427014] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    9.431488] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
[    9.457197] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    9.460370] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.16
[    9.468470] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    9.475597] usb usb1: Product: EHCI Host Controller
[    9.480508] usb usb1: Manufacturer: Linux 6.16.0+ ehci_hcd
[    9.485913] usb usb1: SerialNumber: ci_hdrc.1
[    9.490862] hub 1-0:1.0: USB hub found
[    9.494005] hub 1-0:1.0: 1 port detected
[    9.657191] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    9.844726] usb 1-1: New USB device found, idVendor=1519, idProduct=0020, bcdDevice=12.74
[    9.850530] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    9.857594] usb 1-1: Product: HSIC Device
[    9.861606] usb 1-1: Manufacturer: Comneon
[    9.865627] usb 1-1: SerialNumber: 0123456789
[    9.908739] cdc_acm 1-1:1.0: ttyACM0: USB ACM device

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/net/usb/Kconfig            |  15 ++
 drivers/net/usb/Makefile           |   1 +
 drivers/net/usb/baseband-xmm6260.c | 335 +++++++++++++++++++++++++++++
 3 files changed, 351 insertions(+)
 create mode 100644 drivers/net/usb/baseband-xmm6260.c

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 52a5c0922c79..503f24a3cfa6 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -642,4 +642,19 @@ config USB_RTL8153_ECM
 	  CONFIG_USB_RTL8152 is not set, or the RTL8153 device is not
 	  supported by r8152 driver.
 
+config USB_NET_XMM6260
+	tristate "Infineon XMM626X Baseband HSPA/HSUPA modem"
+	depends on GPIOLIB && OF && USB_CHIPIDEA
+	help
+	  Select this if you want to use an Infineon XMM626X modem, found in
+	  devices such as the LG Optimus 4X P880, LG Optimus Vu P895, Samsung
+	  Galaxy S II (GT-I9100), and Galaxy Nexus (GT-I9250). This driver
+	  handles the modem configuration and provides a stable way to expose
+	  the modem's USB interface. To establish a connection, you will first
+	  need a userspace program to send the correct commands to the modem
+	  through its CDC ACM port, as well as a DHCP client.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called baseband-xmm6260.
+
 endif # USB_NET_DRIVERS
diff --git a/drivers/net/usb/Makefile b/drivers/net/usb/Makefile
index 4964f7b326fb..ffa532c7d7d6 100644
--- a/drivers/net/usb/Makefile
+++ b/drivers/net/usb/Makefile
@@ -42,3 +42,4 @@ obj-$(CONFIG_USB_NET_CDC_MBIM)	+= cdc_mbim.o
 obj-$(CONFIG_USB_NET_CH9200)	+= ch9200.o
 obj-$(CONFIG_USB_NET_AQC111)	+= aqc111.o
 obj-$(CONFIG_USB_RTL8153_ECM)	+= r8153_ecm.o
+obj-$(CONFIG_USB_NET_XMM6260)	+= baseband-xmm6260.o
diff --git a/drivers/net/usb/baseband-xmm6260.c b/drivers/net/usb/baseband-xmm6260.c
new file mode 100644
index 000000000000..658f5351fab7
--- /dev/null
+++ b/drivers/net/usb/baseband-xmm6260.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2011 NVIDIA Corporation
+ * Copyright (C) 2023 Svyatoslav Ryhel <clamor95@gmail.com>
+ */
+
+#include <linux/array_size.h>
+#include <linux/devm-helpers.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/rfkill.h>
+#include <linux/usb.h>
+
+#define BASEBAND_XMM_INIT_DELAY		5000
+
+#define BASEBAND_PRODUCT_ID_XMM6260	0x0020
+#define BASEBAND_VENDOR_ID_COMNEON	0x1519
+
+enum ipc_ap_wake_state {
+	IPC_AP_WAKE_IRQ_READY,
+	IPC_AP_WAKE_INIT1,
+	IPC_AP_WAKE_INIT2,
+	IPC_AP_WAKE_L,
+	IPC_AP_WAKE_H,
+	IPC_AP_WAKE_UNINIT,
+};
+
+struct baseband_xmm_data {
+	struct device *dev;
+	struct rfkill *rfkill_dev;
+	struct phy *mphy;
+
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *enable_gpio;
+
+	struct gpio_desc *ipc_cp_gpio;
+	struct gpio_desc *ipc_ap_gpio;
+
+	struct regulator *vbat_supply;
+
+	struct delayed_work modem_work;
+	struct notifier_block nb;
+
+	enum ipc_ap_wake_state ap_state;
+
+	bool powered; /* tracks usb bus state */
+	bool inited; /* tracks modem state */
+};
+
+static int baseband_xmm_usb_notifier_call(struct notifier_block *nb,
+					  unsigned long action, void *data)
+{
+	struct baseband_xmm_data *priv =
+		container_of(nb, struct baseband_xmm_data, nb);
+	struct usb_device *udev = data;
+	u16 product = le16_to_cpu(udev->descriptor.idProduct);
+	u16 vendor = le16_to_cpu(udev->descriptor.idVendor);
+
+	switch (action) {
+	case USB_DEVICE_ADD:
+		/* Infineon XMM6260 ID 1519:0020 */
+		if (vendor == BASEBAND_VENDOR_ID_COMNEON &&
+		    product == BASEBAND_PRODUCT_ID_XMM6260) {
+			cancel_delayed_work_sync(&priv->modem_work);
+			priv->inited = true;
+		}
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static void baseband_xmm_reset(struct baseband_xmm_data *priv)
+{
+	int ret;
+
+	ret = regulator_enable(priv->vbat_supply);
+	if (ret)
+		dev_err(priv->dev, "failed to enable vbat power supply\n");
+
+	gpiod_set_value_cansleep(priv->enable_gpio, 0);
+	msleep(50);
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	msleep(200);
+	gpiod_set_value_cansleep(priv->reset_gpio, 0);
+
+	msleep(50);
+
+	/* falling edge trigger to CP */
+	gpiod_set_value_cansleep(priv->enable_gpio, 1);
+	usleep_range(50, 100);
+	gpiod_set_value_cansleep(priv->enable_gpio, 0);
+	msleep(20);
+}
+
+static int baseband_xmm_set_block(void *data, bool blocked)
+{
+	struct baseband_xmm_data *priv = data;
+
+	if (blocked) {
+		if (priv->inited && priv->powered) {
+			phy_power_off(priv->mphy);
+
+			msleep(500);
+
+			gpiod_set_value_cansleep(priv->reset_gpio, 1);
+			regulator_disable(priv->vbat_supply);
+
+			priv->powered = false;
+			priv->inited = false;
+		}
+	} else {
+		if (priv->inited)
+			return 0;
+
+		priv->ap_state = IPC_AP_WAKE_IRQ_READY;
+		baseband_xmm_reset(priv);
+
+		priv->powered = false;
+		priv->inited = false;
+	}
+
+	return 0;
+}
+
+static const struct rfkill_ops baseband_xmm_rfkill_ops = {
+	.set_block = baseband_xmm_set_block,
+};
+
+static void baseband_xmm_work(struct work_struct *work)
+{
+	struct baseband_xmm_data *priv =
+		container_of(work, struct baseband_xmm_data, modem_work.work);
+
+	switch (priv->ap_state) {
+	case IPC_AP_WAKE_INIT1:
+		if (priv->powered)
+			return;
+
+		phy_power_on(priv->mphy);
+		priv->powered = true;
+		break;
+
+	case IPC_AP_WAKE_INIT2:
+		priv->ap_state = IPC_AP_WAKE_IRQ_READY;
+
+		phy_power_off(priv->mphy);
+
+		priv->powered = false;
+		priv->inited = false;
+
+		msleep(500);
+		break;
+
+	default:
+		break;
+	}
+};
+
+static irqreturn_t baseband_hostwake_interrupt(int irq, void *dev_id)
+{
+	struct baseband_xmm_data *priv = dev_id;
+	int state = gpiod_get_value(priv->ipc_ap_gpio);
+
+	switch (priv->ap_state) {
+	case IPC_AP_WAKE_IRQ_READY:
+		if (!state) {
+			priv->ap_state = IPC_AP_WAKE_INIT1;
+			schedule_delayed_work(&priv->modem_work, 0);
+		}
+
+		break;
+
+	case IPC_AP_WAKE_INIT1:
+		if (state) {
+			priv->ap_state = IPC_AP_WAKE_INIT2;
+			schedule_delayed_work(&priv->modem_work,
+					      msecs_to_jiffies(BASEBAND_XMM_INIT_DELAY));
+		}
+
+		break;
+
+	default:
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int baseband_xmm_probe(struct platform_device *pdev)
+{
+	struct baseband_xmm_data *priv;
+	struct device *dev = &pdev->dev;
+	unsigned long irqflags;
+	int irq, ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	platform_set_drvdata(pdev, priv);
+
+	priv->vbat_supply = devm_regulator_get(dev, "vbat");
+	if (IS_ERR(priv->vbat_supply))
+		return dev_err_probe(dev, PTR_ERR(priv->vbat_supply),
+				     "failed to get vbat regulator\n");
+
+	/* Own modem gpios */
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(priv->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	priv->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(priv->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->enable_gpio),
+				     "failed to get enable GPIO\n");
+
+	/* CP - AP connections */
+	priv->ipc_cp_gpio = devm_gpiod_get_optional(dev, "cp-wake",
+						    GPIOD_OUT_LOW);
+	if (IS_ERR(priv->ipc_cp_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->ipc_cp_gpio),
+				     "failed to get CP wake GPIO\n");
+
+	priv->ipc_ap_gpio = devm_gpiod_get_optional(dev, "ap-wake", GPIOD_IN);
+	if (IS_ERR(priv->ipc_ap_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->ipc_ap_gpio),
+				     "failed to get AP wake GPIO\n");
+
+	/* Modem PHY */
+	priv->mphy = devm_phy_optional_get(dev, NULL);
+	if (IS_ERR(priv->mphy))
+		return dev_err_probe(dev, PTR_ERR(priv->mphy),
+				     "failed to get modem PHY");
+
+	/*
+	 * Strting from ver 1145 modem starts in READY state. AP wake
+	 * interrupt keeps low util CP starts to initiate HSIC hw. AP
+	 * wake interrupt goes up during CP HSIC init and then it goes
+	 * down when CP HSIC is ready.
+	 */
+	priv->ap_state = IPC_AP_WAKE_IRQ_READY;
+	priv->inited = false;
+
+	devm_delayed_work_autocancel(dev, &priv->modem_work, baseband_xmm_work);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get IRQ\n");
+
+	/*
+	 * Systems using device tree should set up interrupt via DT,
+	 * the rest will use the default edge both interrupt.
+	 */
+	irqflags = dev->of_node ? 0 : IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
+
+	ret = devm_request_threaded_irq(dev, irq, NULL,
+					&baseband_hostwake_interrupt,
+					IRQF_ONESHOT | irqflags,
+					"modem-hostwake", priv);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register IRQ %d\n", irq);
+
+	priv->rfkill_dev = rfkill_alloc("xmm-modem", dev, RFKILL_TYPE_WWAN,
+					&baseband_xmm_rfkill_ops, priv);
+	if (priv->rfkill_dev) {
+		ret = rfkill_register(priv->rfkill_dev);
+		if (ret < 0) {
+			rfkill_destroy(priv->rfkill_dev);
+			return dev_err_probe(dev, ret,
+					     "failed to register WWAN rfkill\n");
+		}
+	} else {
+		return dev_err_probe(dev, PTR_ERR(priv->rfkill_dev),
+				     "failed to allocate WWAN rfkill\n");
+	}
+
+	priv->nb.notifier_call = baseband_xmm_usb_notifier_call;
+	usb_register_notify(&priv->nb);
+
+	baseband_xmm_reset(priv);
+	priv->powered = false;
+
+	return 0;
+}
+
+static void baseband_xmm_remove(struct platform_device *pdev)
+{
+	struct baseband_xmm_data *priv = platform_get_drvdata(pdev);
+
+	rfkill_unregister(priv->rfkill_dev);
+	rfkill_destroy(priv->rfkill_dev);
+
+	usb_unregister_notify(&priv->nb);
+	phy_power_off(priv->mphy);
+
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	regulator_disable(priv->vbat_supply);
+}
+
+static const struct of_device_id baseband_xmm_match[] = {
+	{ .compatible = "infineon,xmm6260" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, baseband_xmm_match);
+
+static struct platform_driver baseband_xmm_driver = {
+	.driver = {
+		.name = "baseband-xmm6260",
+		.of_match_table = baseband_xmm_match,
+	},
+	.probe = baseband_xmm_probe,
+	.remove = baseband_xmm_remove,
+};
+module_platform_driver(baseband_xmm_driver);
+
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Baseband Infineon XMM6260 driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0

