Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B0F1FC7EA;
	Wed,  5 Feb 2025 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777021; cv=none; b=CNwDY20t9TCe3JLTUX1cvt3hMMU06+hWc78Vbqxww+2Qo7e4dZ1XPTPo7ixe9jfrvSc/ZAs5EEtANdrNaV5sym3lIOqscQodUFzjjG5o7rIurhI14Qb7mYOwaAIF3PJTtEKGtswXhfWIhikXYvi/nHjGrXXPhRUBaDoJjjaFRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777021; c=relaxed/simple;
	bh=7vAooUGUGwbstMos/UXojSzP5BR6u1QlNcZwvfKyxqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hy7fbL/NNtMc+M72+GXNoL96jmnOpFSq+jmfFa6xLajekxEIBaWg+IQkwGeK2yPb0jCDE9HYYP9gExQtqCNKXDoQKTLO4KzdjPA35WuP50i96rTaTKouvp0F/t53n33I3E+3IwOgg83eYLWgA20GHOtk7RAz8BJkEG5nBwtg/u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GLo9Hfxv; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GLo9Hfxv"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FCEA43433;
	Wed,  5 Feb 2025 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXYQcikTtcRhtswqqr9n2TtVIwWIphQC2x5GRcAOW+0=;
	b=GLo9HfxvwG0j09dtXuQb6eS15ktA+Wwu4QhmKyo45ntCxZm9N0D7/N9bmBqcHyaNha2R4D
	/4nDwDLZYaN3WjuMYv1HdIj4N7dsimtPQOuH0qAEKDnAk4ffUDtwuQrQq7AanO4jBYMWHF
	ALEuS/adUqvO7i96TZ4gMA0TCTK9gXLa+XOrqsCR/8VH8Ak4JU/J49OBeia900XA6uNGNC
	gF7Jyrr9P0Uo/kc+Dzdx4p1zAUEJgWMX9O4NRIhngnTyrUokB+x1mdHv1rnv96I+xQHhsM
	+JcnSWsSx/0RVxx1RMhUQ9FG9Dkhz/Z+WSQVPahVO4DjNvAAuCgOYuLS7fxomQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 05 Feb 2025 18:36:47 +0100
Subject: [PATCH v7 2/9] usb: xhci: tegra: rename `runtime` boolean to
 `is_auto_runtime`
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-s2r-cdns-v7-2-13658a271c3c@bootlin.com>
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

Unify naming convention: use `is_auto_runtime` in xhci-tegra, to be in
phase with (future) drivers/usb/host/xhci.c.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/host/xhci-tegra.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 22dc86fb5254731fdf1c81e0c4e9dd201e8a1526..107a95b595413bea8a0017867497c48a47c7eaae 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2162,11 +2162,11 @@ static void tegra_xhci_program_utmi_power_lp0_exit(struct tegra_xusb *tegra)
 	}
 }
 
-static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
+static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
 	struct device *dev = tegra->dev;
-	bool wakeup = runtime ? true : device_may_wakeup(dev);
+	bool wakeup = is_auto_resume ? true : device_may_wakeup(dev);
 	unsigned int i;
 	int err;
 	u32 usbcmd;
@@ -2232,11 +2232,11 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
 	return err;
 }
 
-static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
+static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
 	struct device *dev = tegra->dev;
-	bool wakeup = runtime ? true : device_may_wakeup(dev);
+	bool wakeup = is_auto_resume ? true : device_may_wakeup(dev);
 	unsigned int i;
 	u32 usbcmd;
 	int err;
@@ -2287,7 +2287,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 	if (wakeup)
 		tegra_xhci_disable_phy_sleepwalk(tegra);
 
-	err = xhci_resume(xhci, runtime ? PMSG_AUTO_RESUME : PMSG_RESUME);
+	err = xhci_resume(xhci, is_auto_resume ? PMSG_AUTO_RESUME : PMSG_RESUME);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
 		goto disable_phy;

-- 
2.48.1

