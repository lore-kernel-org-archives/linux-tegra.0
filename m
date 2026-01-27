Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B00535D5E0;
	Tue, 27 Jan 2026 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526746; cv=none; b=lCVrjZ2S4AJ/jVgr/DBmcNLim5xSEhEpJ6JKSzY5IsXFdF9+xsO5uscGW4wx6nHIZk7KK0QSWjH04UTot8SSNYfkVjewIzNMOeNHS9jvB4vY/Wu2cpbJhIY9rIHEFIoy1DZ9Y1BhPvEr6VMxklXCv8u5sGLFeYAdL3ceG/y2FOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526746; c=relaxed/simple;
	bh=xJHxYT+TadYewpoKOTjiaran92WN2DeuJBljdTuOCy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEv63y79tYKvE85gA5QW6gX/nJ6t4sG0ftSymx/XSynaY7dZfgKi8QRsIjjFwyPsudmzxRmqenU6BFzVTB61/Eq+iQjaFnXfjKGVdN/0rQ6lFkf2Kt+sOuXsX0e3vcewFiyJBJE4D9Dy/37tguMChCzKYcnm5uvzB3FnM1vsYY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=i3t8NFHO; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="i3t8NFHO"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E152F6002307;
	Tue, 27 Jan 2026 15:12:12 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id bTCuZ5QEIXsH; Tue, 27 Jan 2026 15:12:10 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D6DFE6000257;
	Tue, 27 Jan 2026 15:12:09 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1769526729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZcC7nVQPcaOVfYrZtm+vknrQUeM733TEL9ACJo10WQ=;
	b=i3t8NFHOtmH/eAyaSjIfAFwqblPVHBbcBsCy7WEwCTlp9jNJ6X/IQuMKuiZ+S7KjI5zfYS
	GNFV/MnGGz39XEwTZggQy1rN8DhRc1ttTIyQcJ3Iut3WnNhrREOn4ZWVF81EFfhIGr/Ewq
	B+FFDTYC9W445sZkkcQ4SCo0OwV38BSF6pfCEroVOiHhFKwWJCJA2x7PB+YYsRa4mEVTrJ
	XAGVTFWfedWHq8GC3MY/O61+Mlzt7JqW24dzUI9XEZnGJGtCrumjfE8qdDbpAyVnFrT1LG
	RbNc1gFBQNE9XGBqoWEA+RHA2pyGH2XOzS3nwvYZn4w5EeHqMiY/N14Xmj8lxA==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 8711E3600A6;
	Tue, 27 Jan 2026 15:12:09 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Tue, 27 Jan 2026 15:11:52 +0000
Subject: [PATCH v2 6/6] phy: tegra: xusb: Move T186 .set_mode() to common
 implementation
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-diogo-tegra_phy-v2-6-787b9eed3ed5@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769526726; l=4050;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=xJHxYT+TadYewpoKOTjiaran92WN2DeuJBljdTuOCy4=;
 b=gaXGWJCSZfLtbD9smDMa7VQ2DugogGFT2gb4MjcM5WKZvEh96PE0vSbkt8/rnsGicaYnaDmwo
 i+3AaC7EUlrCCSYfmE13tj6KQbGjysGrDqpcx4hAp/S8sTOHnXmZi0F
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Move the Tegra186 PHY .set_mode() callback to a common implementation.
In order to do this first revert cefc1caee9dd.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
v1->v2:
- New patch
---
 drivers/phy/tegra/xusb-tegra186.c | 73 ++++++---------------------------------
 1 file changed, 10 insertions(+), 63 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index bec9616c4a2e..bf678829245d 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -786,15 +786,13 @@ static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
 }
 
 static int tegra186_xusb_padctl_id_override(struct tegra_xusb_padctl *padctl,
-					    struct tegra_xusb_usb2_port *port, bool status)
+					    bool status)
 {
-	u32 value, id_override;
-	int err = 0;
+	u32 value;
 
 	dev_dbg(padctl->dev, "%s id override\n", status ? "set" : "clear");
 
 	value = padctl_readl(padctl, USB2_VBUS_ID);
-	id_override = value & ID_OVERRIDE(~0);
 
 	if (status) {
 		if (value & VBUS_OVERRIDE) {
@@ -805,68 +803,16 @@ static int tegra186_xusb_padctl_id_override(struct tegra_xusb_padctl *padctl,
 			value = padctl_readl(padctl, USB2_VBUS_ID);
 		}
 
-		if (id_override != ID_OVERRIDE_GROUNDED) {
-			value &= ~ID_OVERRIDE(~0);
-			value |= ID_OVERRIDE_GROUNDED;
-			padctl_writel(padctl, value, USB2_VBUS_ID);
-
-			err = regulator_enable(port->supply);
-			if (err) {
-				dev_err(padctl->dev, "Failed to enable regulator: %d\n", err);
-				return err;
-			}
-		}
+		value &= ~ID_OVERRIDE(~0);
+		value |= ID_OVERRIDE_GROUNDED;
 	} else {
-		if (id_override == ID_OVERRIDE_GROUNDED) {
-			/*
-			 * The regulator is disabled only when the role transitions
-			 * from USB_ROLE_HOST to USB_ROLE_NONE.
-			 */
-			err = regulator_disable(port->supply);
-			if (err) {
-				dev_err(padctl->dev, "Failed to disable regulator: %d\n", err);
-				return err;
-			}
-
-			value &= ~ID_OVERRIDE(~0);
-			value |= ID_OVERRIDE_FLOATING;
-			padctl_writel(padctl, value, USB2_VBUS_ID);
-		}
+		value &= ~ID_OVERRIDE(~0);
+		value |= ID_OVERRIDE_FLOATING;
 	}
 
-	return 0;
-}
-
-static int tegra186_utmi_phy_set_mode(struct phy *phy, enum phy_mode mode,
-				      int submode)
-{
-	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
-	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
-	struct tegra_xusb_usb2_port *port = tegra_xusb_find_usb2_port(padctl,
-								lane->index);
-	int err = 0;
-
-	mutex_lock(&padctl->lock);
+	padctl_writel(padctl, value, USB2_VBUS_ID);
 
-	dev_dbg(&port->base.dev, "%s: mode %d", __func__, mode);
-
-	if (mode == PHY_MODE_USB_OTG) {
-		if (submode == USB_ROLE_HOST) {
-			err = tegra186_xusb_padctl_id_override(padctl, port, true);
-			if (err)
-				goto out;
-		} else if (submode == USB_ROLE_DEVICE) {
-			tegra186_xusb_padctl_vbus_override(padctl, true);
-		} else if (submode == USB_ROLE_NONE) {
-			err = tegra186_xusb_padctl_id_override(padctl, port, false);
-			if (err)
-				goto out;
-			tegra186_xusb_padctl_vbus_override(padctl, false);
-		}
-	}
-out:
-	mutex_unlock(&padctl->lock);
-	return err;
+	return 0;
 }
 
 static int tegra186_utmi_phy_power_on(struct phy *phy)
@@ -1017,7 +963,7 @@ static const struct phy_ops utmi_phy_ops = {
 	.exit = tegra186_utmi_phy_exit,
 	.power_on = tegra186_utmi_phy_power_on,
 	.power_off = tegra186_utmi_phy_power_off,
-	.set_mode = tegra186_utmi_phy_set_mode,
+	.set_mode = tegra_xusb_usb2_phy_set_mode,
 	.owner = THIS_MODULE,
 };
 
@@ -1578,6 +1524,7 @@ static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.suspend_noirq = tegra186_xusb_padctl_suspend_noirq,
 	.resume_noirq = tegra186_xusb_padctl_resume_noirq,
 	.vbus_override = tegra186_xusb_padctl_vbus_override,
+	.id_override = tegra186_xusb_padctl_id_override,
 	.utmi_pad_power_on = tegra186_utmi_pad_power_on,
 	.utmi_pad_power_down = tegra186_utmi_pad_power_down,
 };

-- 
2.52.0

