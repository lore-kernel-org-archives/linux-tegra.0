Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3630360729;
	Tue, 27 Jan 2026 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527313; cv=none; b=JpRWzjsfrf6Ni4IOxdxf144+nacr3Ho7a7yM5CKTpwoPc7nL4+yz8S8C/wcrn9VvnT6Y43XHlAxQEkIo4ZtGCf77XKIwepcffUhfVIL+yRs8SVgAPxBP4u6bhNVDqRmvYgO5kiwkGeVyZxP+U5/jywCuW7fehhvyfwYr7v1jjv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527313; c=relaxed/simple;
	bh=vcYmsrJOWfPzE+KTUK50ZYnuiBcAecSsYwnN4BaRBo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdEreUnFN+B8kxvEASyL+RUJJtxzIQhWDDkCAJ0e/muoHgPgCEk71sfwfeitAQ735xmb82gPBbr/F4JBLDOyDSJ6DFj7kNSfxwQYSAmvCnWmVu86AHmivR/RAajl68gK9kCkn/UNxQDrRrQWNuZ9QX/lNBvmJPkFf6IKvBH8erQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=S+gdGUao; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="S+gdGUao"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 4A4476000877;
	Tue, 27 Jan 2026 15:12:11 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id C_c04pEVdt2E; Tue, 27 Jan 2026 15:12:09 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id F05BB60022EA;
	Tue, 27 Jan 2026 15:12:08 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1769526729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4NnWV6yd5QghHP/nbiwEc5aw4U9XE9qIaLHOxudmmY=;
	b=S+gdGUaopdDzGGNligYh4mVmJKcPzKNJdzjZptEmtljoeDPaYPxH77vn+nR3qpmBms6Xx3
	c7rEehUnD7tbZvbRJ4DWH+c3bGk//ZnCwGa5xDCka/AyMI1uYQrgH1vaATcpZpoifaeXzc
	YQjIZcZzlmSz3tWxf9HsUK2GFCz8vVswykEKxB7tts2hWzQ5BIyT4ws/qBO8w+ZfvSGeB5
	4VBmCnrnI94nQUn5Qij2/LRlB/LT28s051FGbsl8kvjjul6p06MdOArWchZX4j/Fsz7sAf
	i7DCDBu/iqqDX+Ohuo6aoVFsm5poh3qnFZQGC3ffGFVCbr2WdsGAs23dKVTWzg==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A3C653600FD;
	Tue, 27 Jan 2026 15:12:08 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Tue, 27 Jan 2026 15:11:49 +0000
Subject: [PATCH v2 3/6] phy: tegra: xusb: Fix ordering issue when switching
 roles on USB2 ports
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-diogo-tegra_phy-v2-3-787b9eed3ed5@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769526725; l=5656;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=vcYmsrJOWfPzE+KTUK50ZYnuiBcAecSsYwnN4BaRBo0=;
 b=SeiFWe/6BZMApaQ1jOCui6fb/63JZz31FZUD6Y7pNti/dVjxS+hyP4rKQrJfQWBuuF1zXjxwh
 wnpOx/K0UfqDhJM0carsgtjF45QM9m7QBw1pBBHzqa4mxDXYqShN+OF
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
USB_ROLE_DEVICE.

The specific parameters of the helper function were determined based on
my testing on a Tegra210 platform, Smaug, with some extra slack added in.
With these parameters I never observed any timeout in role switching.

As mentioned, this was tested on a Tegra210 platform. However, due to the
similar approach in Tegra186 it is likely that not only this problem exists
there but that this patch also fixes it.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
v1->v2:
- Edit commit message and add code comment explaining origin of wait
  parameters in tegra_xusb_usb2_port_wait_role_none()
- Export tegra_xusb_usb2_port_wait_role_none()
- Fix NULL pointer dereference in error message
- Remove extra blank line
---
 drivers/phy/tegra/xusb.c            | 30 ++++++++++++++++++++++++++++++
 drivers/usb/gadget/udc/tegra-xudc.c |  4 ++++
 drivers/usb/host/xhci-tegra.c       | 14 ++++++++++----
 include/linux/phy/tegra/xusb.h      |  1 +
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index c89df95aa6ca..03fd6269fdbe 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -740,6 +740,36 @@ static void tegra_xusb_parse_usb_role_default_mode(struct tegra_xusb_port *port)
 	}
 }
 
+/*
+ * Helper function that waits for the port's role to become USB_ROLE_NONE. As the
+ * TRMs do not specify how long the transition is expected to take the sleep duration
+ * and number of retries were determined empirically on a Tegra210 platform, with some
+ * extra slack added in.
+ */
+bool tegra_xusb_usb2_port_wait_role_none(struct tegra_xusb_padctl *padctl, int index)
+{
+	struct tegra_xusb_usb2_port *usb2 = tegra_xusb_find_usb2_port(padctl,
+								      index);
+	int retries = 5;
+
+	if (!usb2) {
+		dev_err(padctl->dev, "no port found for USB2 lane %u\n", index);
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
+EXPORT_SYMBOL_GPL(tegra_xusb_usb2_port_wait_role_none);
+
 static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
 {
 	struct tegra_xusb_port *port = &usb2->base;
diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 9d2007f448c0..24b0a9ce75d9 100644
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
index 927861ca14f2..b51afb4036b5 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1352,15 +1352,21 @@ static void tegra_xhci_id_work(struct work_struct *work)
 	struct tegra_xusb_mbox_msg msg;
 	struct phy *phy = tegra_xusb_get_phy(tegra, "usb2",
 						    tegra->otg_usb2_port);
+	enum usb_role role = USB_ROLE_NONE;
 	u32 status;
 	int ret;
 
 	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra->host_mode));
 
-	if (tegra->host_mode)
-		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
-	else
-		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
+	if (tegra->host_mode) {
+		if (!tegra_xusb_usb2_port_wait_role_none(tegra->padctl,
+							 tegra->otg_usb2_port))
+			return;
+
+		role = USB_ROLE_HOST;
+	}
+
+	phy_set_mode_ext(phy, PHY_MODE_USB_OTG, role);
 
 	tegra->otg_usb3_port = tegra_xusb_padctl_get_usb3_companion(tegra->padctl,
 								    tegra->otg_usb2_port);
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

