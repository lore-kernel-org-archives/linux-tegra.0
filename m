Received: from smtp2.tecnico.ulisboa.pt (smtp2.tecnico.ulisboa.pt [193.136.128.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57765366557;
	Tue, 27 Jan 2026 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527221; cv=none; b=BMCwzSEFwnzi9F65/4jVQNYZJl4OfQhGYlfITyvpAQ3sjlJBr0+JWUfqbBeL+HnI1IqUKu3T+0UXgH6Po/jQdp5JZZmY4Jkkb9MhKHdfT6vrHWRpkhA8GbuQEUn413WupkKabCuTq8S2jRkBnnHYLY4//LTpZTpt160z3NFT8pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527221; c=relaxed/simple;
	bh=GuLPCfskwTOvgnNKi9cjUvTBN+Sa7OELObnaGrhYDbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPlWJeTFIsM982+ZOskfxRQ/0sYG7tBAj0/ry2lxQ27sMPs2KigAofBxaOD24vgdfLOsTHaakt4boXaHG/WM8EHRFPFdX+aYSjqpywg13QLt5XYPMLeFsPyZu9ELev/GYyAqIj/ddJcEYJ4XGNpLQBkNyHjIVmyUE3bp8+O8PQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=iTejJR7s; arc=none smtp.client-ip=193.136.128.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="iTejJR7s"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp2.tecnico.ulisboa.pt (Postfix) with ESMTP id 29FDE2453EF;
	Tue, 27 Jan 2026 15:12:12 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp2.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp2.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id cj4eJioOxVXt; Tue, 27 Jan 2026 15:12:09 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp2.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8F1842453EE;
	Tue, 27 Jan 2026 15:12:09 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1769526729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xywWPSSJeE7/ySdTQdTarvhlOsXV6YLbYuG11kBglJk=;
	b=iTejJR7ssu6Khd9Vy/t+HAZNg4cQxLMgC4YrSCh3yQdxm2qcjcdkGpkrKtUDAhQkKK+hWn
	zQJjyQ+8h3rk590gvVuXgvFfgVwJIam98AcyRN0LAkG7JGhEhPk+hi+6oxk5Zro/+cm/Cn
	GpnpUwv8Fl7TgZI5D6wVeEhb6Vg1OAPGmuahdXVQdXxu3JikAledM688Gor0fmglrbe2p/
	dd1ssMlqUmyK8QJeO4j5PLIMRYyzqp7sBWfSkxVJeAe4InCz6ErJkvI+07tkqJvr7Nuzfw
	SeT+lKvXbm7/7XaYwtM12/EfvEtRP3LiG47Mvu+Gp9t8YzdF8/MDNYs19HQb5Q==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 3BCF13600DD;
	Tue, 27 Jan 2026 15:12:09 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Tue, 27 Jan 2026 15:11:51 +0000
Subject: [PATCH v2 5/6] phy: tegra: xusb: Move .set_mode() to a shared
 location
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-diogo-tegra_phy-v2-5-787b9eed3ed5@tecnico.ulisboa.pt>
References: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
In-Reply-To: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769526726; l=4781;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=GuLPCfskwTOvgnNKi9cjUvTBN+Sa7OELObnaGrhYDbU=;
 b=171OfqnYPDcvwBjDnd3uexeGnD/275rBxLptc7VCceMdyqH3G9pYLltePOUhLvDE/JFrmg5BC
 9KRdkzGVpL/Bj47BLUyGu1Qak6q8Na62KgkTC7pz+it7dKavNRvImEB
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

As both Tegra210 and Tegra186 can have a common XUSB .set_mode()
implementation move it to a location where it can be used by both
platforms. Move Tegra210 to this common implementation.

While at it fix a typo in a comment.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
v1->v2:
- New patch
---
 drivers/phy/tegra/xusb-tegra210.c | 43 +--------------------------------------
 drivers/phy/tegra/xusb.c          | 40 ++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h          |  2 ++
 3 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index be03a17afd7e..14e24296641b 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -1910,47 +1910,6 @@ static int tegra210_xusb_padctl_id_override(struct tegra_xusb_padctl *padctl,
 	return 0;
 }
 
-static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
-				      int submode)
-{
-	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
-	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
-	struct tegra_xusb_usb2_port *port = tegra_xusb_find_usb2_port(padctl,
-								lane->index);
-	int err = 0;
-
-	mutex_lock(&padctl->lock);
-
-	dev_dbg(&port->base.dev, "%s: mode %d", __func__, mode);
-
-	if (mode == PHY_MODE_USB_OTG) {
-		if (submode == USB_ROLE_HOST) {
-			tegra210_xusb_padctl_id_override(padctl, true);
-
-			err = regulator_enable(port->supply);
-		} else if (submode == USB_ROLE_DEVICE) {
-			tegra210_xusb_padctl_vbus_override(padctl, true);
-		} else if (submode == USB_ROLE_NONE) {
-			/*
-			 * When port is peripheral only or role transitions to
-			 * USB_ROLE_NONE from USB_ROLE_DEVICE, regulator is not
-			 * be enabled.
-			 */
-			if (port->role == USB_ROLE_HOST)
-				regulator_disable(port->supply);
-
-			tegra210_xusb_padctl_id_override(padctl, false);
-			tegra210_xusb_padctl_vbus_override(padctl, false);
-		}
-
-		port->role = submode;
-	}
-
-	mutex_unlock(&padctl->lock);
-
-	return err;
-}
-
 static int tegra210_usb2_phy_power_on(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
@@ -2174,7 +2133,7 @@ static const struct phy_ops tegra210_usb2_phy_ops = {
 	.exit = tegra210_usb2_phy_exit,
 	.power_on = tegra210_usb2_phy_power_on,
 	.power_off = tegra210_usb2_phy_power_off,
-	.set_mode = tegra210_usb2_phy_set_mode,
+	.set_mode = tegra_xusb_usb2_phy_set_mode,
 	.owner = THIS_MODULE,
 };
 
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 0443465bcf50..2327275740f8 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -770,6 +770,46 @@ bool tegra_xusb_usb2_port_wait_role_none(struct tegra_xusb_padctl *padctl, int i
 }
 EXPORT_SYMBOL_GPL(tegra_xusb_usb2_port_wait_role_none);
 
+int tegra_xusb_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra_xusb_usb2_port *port = tegra_xusb_find_usb2_port(padctl,
+								lane->index);
+	int err = 0;
+
+	mutex_lock(&padctl->lock);
+
+	dev_dbg(&port->base.dev, "%s: mode %d", __func__, mode);
+
+	if (mode == PHY_MODE_USB_OTG) {
+		if (submode == USB_ROLE_HOST) {
+			tegra_xusb_padctl_set_id_override(padctl, true);
+
+			err = regulator_enable(port->supply);
+		} else if (submode == USB_ROLE_DEVICE) {
+			tegra_xusb_padctl_set_vbus_override(padctl, true);
+		} else if (submode == USB_ROLE_NONE) {
+			/*
+			 * When port is peripheral only or role transitions to
+			 * USB_ROLE_NONE from USB_ROLE_DEVICE, regulator is not
+			 * enabled.
+			 */
+			if (port->role == USB_ROLE_HOST)
+				regulator_disable(port->supply);
+
+			tegra_xusb_padctl_set_id_override(padctl, false);
+			tegra_xusb_padctl_set_vbus_override(padctl, false);
+		}
+
+		port->role = submode;
+	}
+
+	mutex_unlock(&padctl->lock);
+
+	return err;
+}
+
 static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
 {
 	struct tegra_xusb_port *port = &usb2->base;
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 08053a730d54..36cc87ae757e 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -501,6 +501,8 @@ struct tegra_xusb_lane *tegra_xusb_find_lane(struct tegra_xusb_padctl *padctl,
 					     const char *name,
 					     unsigned int index);
 
+int tegra_xusb_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode);
+
 #if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_SOC)
 extern const struct tegra_xusb_padctl_soc tegra124_xusb_padctl_soc;
 #endif

-- 
2.52.0

