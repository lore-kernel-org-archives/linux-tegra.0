Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8857E1FF7D2;
	Wed,  5 Feb 2025 17:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777024; cv=none; b=P8nnqqOD9RSvg6Rar1EPC9C2Imnq+hjK+cABi+o2auJ7SPtF3DKhWgj+rh7xfuaVUcxiwMQ98s+eEruh/jCFG0s8Su+nC9YvCVtxTESj5SSUaAtwEgKA3QO4vsOew0YdgO3/M5zbbb7Dj7pacLV21E6nynIEebT/zCV/8NQQhaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777024; c=relaxed/simple;
	bh=EiNdON9cm+MX5lIaJtnb6hNSWywyjDZ9VMZ/IxzTsBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PdG9rsNstyEcfdQVh7sE0MNX/jskPy2yttNKgAt/S0Qv0faDhcvxcsU0oNcL1zIjA5I+y0U5SGtRCijP9AuCumt5JGc+Vy2VIa9luyJhS3vZCZ2foSb/NmjYSN0L2978VMLc9ubT43ECh0P3v+mocpUTVdxW09xujXVoWkiqsnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m3BdGgBj; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m3BdGgBj"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C77B944431;
	Wed,  5 Feb 2025 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADMq925cEy05Cc6K5mkAOhORlXojEuc/58XwgKOicIg=;
	b=m3BdGgBj48O04zpaSjmpW+0eiPk53s66/OFNJkaX0gRggd0re9ghKNJ3+oe3K0rhCx7olw
	Ra/6kwjK2iTzGsU6R38LqYyaeE66Kp0RPZqnpZjDZCqDc/FVJHxWWuTYhttE0rmkZWj6IE
	i0XsmVEohT2B5LHXYx7Qrfun8rSrhYN0e/PfHNiCuq5VHYaQ+g5ZZB3HU/P5nanK9mfVFx
	rcdSrzr38Mdm4RAjkwzJGYrDuxgBTz099RkpCUVEifBbUpMjXBy16+tvpjs9YXeyKZkJDB
	kLflUbbwK5HREqrGrTIdjwSSkyHWSTKeD58Q5TVWPTlazyM4MXpN6R6MDN9bng==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 05 Feb 2025 18:36:52 +0100
Subject: [PATCH v7 7/9] usb: xhci: change xhci_resume() parameters to
 explicit the desired info
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-s2r-cdns-v7-7-13658a271c3c@bootlin.com>
References: <20250205-s2r-cdns-v7-0-13658a271c3c@bootlin.com>
In-Reply-To: <20250205-s2r-cdns-v7-0-13658a271c3c@bootlin.com>
To: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
 Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleevhfekueefvdekgfehhffgudekjeelgfdthedtiedvtdetteegvdeileeiuefhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrdelvdgnpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhon
 hdrohhrghdprhgtphhtthhopehprgifvghllhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrrdgthhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

Previous signature was:

        int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg);

Internally, it extracted two information out of the message:
 - whether we are after hibernation: msg.event == PM_EVENT_RESTORE,
 - whether this is an auto resume: msg.event == PM_EVENT_AUTO_RESUME.

First bulletpoint is somewhat wrong: driver wants to know if the device
did lose power, it doesn't care about hibernation per se. Knowing that,
refactor to ask upper layers the right questions: (1) "did we lose
power?" and, (2) "is this an auto resume?". Change the signature to:

        int xhci_resume(struct xhci_hcd *xhci, bool power_lost,
                        bool is_auto_resume);

The goal is to allow some upper layers (cdns3-plat) to tell us when
power was lost after system-wise suspend.

Note that lost_power is ORed at the start of xhci_resume() to
xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend. It is
simpler to keep those checks inside of xhci_resume() instead of doing
them at each caller of xhci_resume().

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/host/xhci-histb.c |  2 +-
 drivers/usb/host/xhci-pci.c   |  8 +++++---
 drivers/usb/host/xhci-plat.c  | 10 +++++-----
 drivers/usb/host/xhci-tegra.c |  2 +-
 drivers/usb/host/xhci.c       | 19 ++++++++-----------
 drivers/usb/host/xhci.h       |  2 +-
 6 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/xhci-histb.c b/drivers/usb/host/xhci-histb.c
index 8a7d46dae62c8c9d7691d453ea6f9c1a70a73310..02396c8721dca3f080c0eea4e0386cbe9ae384f0 100644
--- a/drivers/usb/host/xhci-histb.c
+++ b/drivers/usb/host/xhci-histb.c
@@ -355,7 +355,7 @@ static int __maybe_unused xhci_histb_resume(struct device *dev)
 	if (!device_may_wakeup(dev))
 		xhci_histb_host_enable(histb);
 
-	return xhci_resume(xhci, PMSG_RESUME);
+	return xhci_resume(xhci, false, false);
 }
 
 static const struct dev_pm_ops xhci_histb_pm_ops = {
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2d1e205c14c60959ccbac5c2a6f0bda48f841b2a..755438cb398058fef6049494c81f58af451c9332 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -802,8 +802,10 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 
 static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 {
-	struct xhci_hcd		*xhci = hcd_to_xhci(hcd);
-	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+	bool power_lost = msg.event == PM_EVENT_RESTORE;
+	bool is_auto_resume = msg.event == PM_EVENT_AUTO_RESUME;
 
 	reset_control_reset(xhci->reset);
 
@@ -834,7 +836,7 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
-	return xhci_resume(xhci, msg);
+	return xhci_resume(xhci, power_lost, is_auto_resume);
 }
 
 static int xhci_pci_poweroff_late(struct usb_hcd *hcd, bool do_wakeup)
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ff813dca2d1d3045b07e8dd23b9760a337d4122e..7c2d7c4e601188ab721fd22c338456ca8100240b 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -479,7 +479,7 @@ static int xhci_plat_suspend(struct device *dev)
 	return 0;
 }
 
-static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
+static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 {
 	struct usb_hcd	*hcd = dev_get_drvdata(dev);
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
@@ -501,7 +501,7 @@ static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
 	if (ret)
 		goto disable_clks;
 
-	ret = xhci_resume(xhci, pmsg);
+	ret = xhci_resume(xhci, power_lost, false);
 	if (ret)
 		goto disable_clks;
 
@@ -522,12 +522,12 @@ static int xhci_plat_resume_common(struct device *dev, struct pm_message pmsg)
 
 static int xhci_plat_resume(struct device *dev)
 {
-	return xhci_plat_resume_common(dev, PMSG_RESUME);
+	return xhci_plat_resume_common(dev, false);
 }
 
 static int xhci_plat_restore(struct device *dev)
 {
-	return xhci_plat_resume_common(dev, PMSG_RESTORE);
+	return xhci_plat_resume_common(dev, true);
 }
 
 static int __maybe_unused xhci_plat_runtime_suspend(struct device *dev)
@@ -548,7 +548,7 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
 	struct usb_hcd  *hcd = dev_get_drvdata(dev);
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 
-	return xhci_resume(xhci, PMSG_AUTO_RESUME);
+	return xhci_resume(xhci, false, true);
 }
 
 const struct dev_pm_ops xhci_plat_pm_ops = {
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 107a95b595413bea8a0017867497c48a47c7eaae..b5c362c2051d70f6d51f0f7367d78b6af3150bad 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2287,7 +2287,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 	if (wakeup)
 		tegra_xhci_disable_phy_sleepwalk(tegra);
 
-	err = xhci_resume(xhci, is_auto_resume ? PMSG_AUTO_RESUME : PMSG_RESUME);
+	err = xhci_resume(xhci, false, is_auto_resume);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
 		goto disable_phy;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 45653114ccd7fcc4a1c6872e749c660d4cab705f..c544ae00a954af631cc1c4b14404d0126313a9f7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -990,16 +990,14 @@ EXPORT_SYMBOL_GPL(xhci_suspend);
  * This is called when the machine transition from S3/S4 mode.
  *
  */
-int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
+int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 {
-	bool			hibernated = (msg.event == PM_EVENT_RESTORE);
 	u32			command, temp = 0;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
 	int			retval = 0;
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
 	bool			suspended_usb3_devs = false;
-	bool			reinit_xhc = false;
 
 	if (!hcd->state)
 		return 0;
@@ -1018,10 +1016,10 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 
 	spin_lock_irq(&xhci->lock);
 
-	if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
-		reinit_xhc = true;
+	if (xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
+		power_lost = true;
 
-	if (!reinit_xhc) {
+	if (!power_lost) {
 		/*
 		 * Some controllers might lose power during suspend, so wait
 		 * for controller not ready bit to clear, just as in xHC init.
@@ -1061,12 +1059,12 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 	/* re-initialize the HC on Restore Error, or Host Controller Error */
 	if ((temp & (STS_SRE | STS_HCE)) &&
 	    !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
-		reinit_xhc = true;
-		if (!xhci->broken_suspend)
+		if (!power_lost)
 			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
+		power_lost = true;
 	}
 
-	if (reinit_xhc) {
+	if (power_lost) {
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				!(xhci_all_ports_seen_u0(xhci))) {
 			del_timer_sync(&xhci->comp_mode_recovery_timer);
@@ -1164,8 +1162,7 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
 
 		pending_portevent = xhci_pending_portevent(xhci);
 
-		if (suspended_usb3_devs && !pending_portevent &&
-		    msg.event == PM_EVENT_AUTO_RESUME) {
+		if (suspended_usb3_devs && !pending_portevent && is_auto_resume) {
 			msleep(120);
 			pending_portevent = xhci_pending_portevent(xhci);
 		}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8c164340a2c35099cedd081558236df3b1b5d14c..086b9843f10e315e471c1a1bdd10bacd8e5f8cda 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1870,7 +1870,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id);
 int xhci_ext_cap_init(struct xhci_hcd *xhci);
 
 int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup);
-int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg);
+int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume);
 
 irqreturn_t xhci_irq(struct usb_hcd *hcd);
 irqreturn_t xhci_msi_irq(int irq, void *hcd);

-- 
2.48.1

