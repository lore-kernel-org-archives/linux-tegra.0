Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507CE272E56;
	Thu,  4 Dec 2025 21:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764884228; cv=none; b=jNPGM2lpKwHCXFZSfaM7rh49qhGnq4Exne/vdbQ7mqOgGivSRzit3BSEPvLRuT+QnHs6zaxPg8VP13RbFO1gzShvV5or+BFg+Utryy6l7xpMPNi6wNwhDmYFf7+ICnDLWlvAWrmX0TZEMeoz5X2R56V72dxLkorhKBFBeZhtZZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764884228; c=relaxed/simple;
	bh=xf9W8khExmmglhR6CvPAqUspKha+T1FNlzX8AdCnkQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNZixVaW/0PIUA4uYeRDtT+0FK3ux/59ZfyrSa2Qe2/19eFalkDrUfh2UQJATkbdTjYSJ5ePlzEhm0/pMbFyCuCE8z3sCzpUXukwpR7Z/g2hzm/iAQvJpwl2DsX5RtIudsBOX+rba9R46+Mb7H6KLXAbOhbfdpbTL4FVlqDl8UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=TK9PQ+fq; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="TK9PQ+fq"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 93A0C6007C12;
	Thu,  4 Dec 2025 21:27:30 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id r-KcAZ9WELtN; Thu,  4 Dec 2025 21:27:28 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 285216007C27;
	Thu,  4 Dec 2025 21:27:26 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1764883646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gws7bqKRyNKCnBdDeWO44Ug9p/AFQeyiuCwnVQuZ3wk=;
	b=TK9PQ+fqy2nXv1tk7PhT4zhyVoHMNwKwQHm2sl5asqJWaSlpZI96R11Q8p4SAx+/lZsWVL
	TvcrelBK7FtCGqJ5aEDCtzTwcmromNjXWP7XHrmmnGUc4VlytBigoVvMWcORtrtSWoiZ+P
	UDQ5uaxhzD8ugS7o3vfuLweqCVviyb2cfqVT0mABJ+RFV4OoePuBb8Vh1jmmuJV/0GS8Bt
	ytYSist3DiXaO0leJbS8MjXWUs48W0BHXu2/Q8B4kby4jvFj6XRDD03NCSdLMlu4g9Yd/e
	HX4o1tsnccODznC2ZJoFIyS55u86kmusyg6CvVPNHiv9pzHJlfSgmOyPuJZB2Q==
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 001E836013C;
	Thu,  4 Dec 2025 21:27:25 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 04 Dec 2025 21:27:19 +0000
Subject: [PATCH 3/5] phy: tegra: xusb: Fix ordering issue when switching
 roles on USB2 ports
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251204-diogo-tegra_phy-v1-3-51a2016d0be8@tecnico.ulisboa.pt>
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
In-Reply-To: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764883644; l=4982;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=xf9W8khExmmglhR6CvPAqUspKha+T1FNlzX8AdCnkQg=;
 b=aQSppPE/K65eVVqVi1Ey+4rSDItbToDQShSiE2nBqNvkn3KPbsWhZVXUa9fVOUzkdsXDnS/Xd
 ygSs1457/IIC6VfJjPQFWDkQiKxUn++DiE89U/n761OxxibJyW4ousi
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The current implementation of USB2 role switching on Tegra relies on
whichever the previous USB controller driver was using the PHY to first
"yield" it back to USB_ROLE_NONE before the next controller configures
it for the new role. However, no mechanism to guarantee this ordering
was implemented, and currently, in the general case, the configuration
functions tegra_xhci_id_work() and tegra_xudc_usb_role_sw_work() end up
running in the same order regardless of the transition being HOST->DEVICE
or DEVICE->HOST, leading to one of these transitions ending up in a
non-working state due to the new configuration being clobbered by the
previous controller driver setting USB_ROLE_NONE after the fact.

Fix this by introducing a helper that waits for the USB2 port’s current
role to become USB_ROLE_NONE and add it in the configuration functions
above before setting the role to either USB_ROLE_HOST or
USB_ROLE_DEVICE. The specific parameters of the helper function are
choices that seem reasonable in my testing and have no other basis.

This was tested on a Tegra210 platform (Smaug). However, due to the similar
approach in Tegra186 it is likely that not only this problem exists there
but that this patch also fixes it.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/phy/tegra/xusb.c            | 23 +++++++++++++++++++++++
 drivers/usb/gadget/udc/tegra-xudc.c |  4 ++++
 drivers/usb/host/xhci-tegra.c       | 15 ++++++++++-----
 include/linux/phy/tegra/xusb.h      |  1 +
 4 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index c89df95aa6ca..e05c3f2d1421 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -740,6 +740,29 @@ static void tegra_xusb_parse_usb_role_default_mode(struct tegra_xusb_port *port)
 	}
 }
 
+bool tegra_xusb_usb2_port_wait_role_none(struct tegra_xusb_padctl *padctl, int index)
+{
+	struct tegra_xusb_usb2_port *usb2 = tegra_xusb_find_usb2_port(padctl,
+								      index);
+	int retries = 5;
+
+	if (!usb2) {
+		dev_err(&usb2->base.dev, "no port found for USB2 lane %u\n", index);
+		return false;
+	}
+
+	do {
+		if (usb2->role == USB_ROLE_NONE)
+			return true;
+
+		usleep_range(50, 60);
+	} while (retries--);
+
+	dev_err(&usb2->base.dev, "timed out waiting for USB_ROLE_NONE");
+
+	return false;
+}
+
 static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
 {
 	struct tegra_xusb_port *port = &usb2->base;
diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 0c38fc37b6e6..72d725659e5f 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -698,8 +698,12 @@ static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
 
 static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 {
+	int port = tegra_xusb_padctl_get_port_number(xudc->curr_utmi_phy);
 	int err;
 
+	if (!tegra_xusb_usb2_port_wait_role_none(xudc->padctl, port))
+		return;
+
 	pm_runtime_get_sync(xudc->dev);
 
 	tegra_phy_xusb_utmi_pad_power_on(xudc->curr_utmi_phy);
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 9c69fccdc6e8..9944593166a3 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1352,18 +1352,23 @@ static void tegra_xhci_id_work(struct work_struct *work)
 	struct tegra_xusb_mbox_msg msg;
 	struct phy *phy = tegra_xusb_get_phy(tegra, "usb2",
 						    tegra->otg_usb2_port);
+	enum usb_role role = USB_ROLE_NONE;
 	u32 status;
 	int ret;
 
 	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra->host_mode));
 
-	mutex_lock(&tegra->lock);
 
-	if (tegra->host_mode)
-		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
-	else
-		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
+	if (tegra->host_mode) {
+		if (!tegra_xusb_usb2_port_wait_role_none(tegra->padctl,
+							 tegra->otg_usb2_port))
+			return;
 
+		role = USB_ROLE_HOST;
+	}
+
+	mutex_lock(&tegra->lock);
+	phy_set_mode_ext(phy, PHY_MODE_USB_OTG, role);
 	mutex_unlock(&tegra->lock);
 
 	tegra->otg_usb3_port = tegra_xusb_padctl_get_usb3_companion(tegra->padctl,
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
index 6ca51e0080ec..a0d3d5b7cf33 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -33,5 +33,6 @@ int tegra_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padctl, st
 int tegra_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl, struct phy *phy);
 int tegra_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl, struct phy *phy);
 bool tegra_xusb_padctl_remote_wake_detected(struct tegra_xusb_padctl *padctl, struct phy *phy);
+bool tegra_xusb_usb2_port_wait_role_none(struct tegra_xusb_padctl *padctl, int index);
 
 #endif /* PHY_TEGRA_XUSB_H */

-- 
2.52.0

