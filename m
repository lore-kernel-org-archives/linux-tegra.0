Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437DE35FF58;
	Tue, 27 Jan 2026 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527312; cv=none; b=Ilsev150w7fEibjL5qcS7GHulMj7hdHmovCB7y1Xh3X0dWSgoE92TotKBKnihvWMXUN3zJigKbcqwQxlpG2RyjZAz/HqiErLDojUEA6C7T1LqY7AJxtynFE8UASVFySC9lJ205gElWpW4zmg5JoiKYfpio3xMRFrvwS+G7Dk1TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527312; c=relaxed/simple;
	bh=WZilSxlFB7epi0aPRUnYdCJn7ILjtGGF0QOrx/FScJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbE7lhAxNxOxKCSuf3RV3z74ILDxZLxzrjLQOYIq8snxegMyiXHm7R6OTT3+oGuR4KjDOkhYv8NeDJuJf56psnBXJ1VS+Rfpz5/4N+jHSAPwp7aASW77doZzfVm9u4iR0R7hw+9vX87dZKbRujc8suPy4lqAw00jqaW0+7MvScc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=PR+4ap7F; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="PR+4ap7F"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id A531860020E3;
	Tue, 27 Jan 2026 15:12:11 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id CJAPZUso6mnf; Tue, 27 Jan 2026 15:12:09 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 42DC76001422;
	Tue, 27 Jan 2026 15:12:09 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1769526729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/MLeeQxVGvcYKcpkt+rdaf/nImropKuqiiYGTIb9iQ=;
	b=PR+4ap7FX9KspWZ5Myo2psscS0GjMZ8ksEebCwXWvbA6dT2OO+NPjokdW9UFGlwvYmz+3f
	rWZWh6rbToRgZQgT6+jWcJ84uUertGtTcfPBGCcd1uebT3unx+TzrJJaSBN0sqPhy8keOU
	AQ+Csjy5+UycPAivuaExuV04Sgq7x/MLbzo+AyiHfEM2ONkZNqxiJYXfDiigxVK/tDIcH2
	TajDVegaJcRyAZSdag6jAKqJd3hppgJr4ux0KFUJgaHZdWeuGCVbGmMruSBJRHcupAU1ua
	PqXhAXRjbuhToekUbO5RyJrOGee8S8/efEYZ1gP/ftQr6RApJcNspxEmjAZLQA==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id E8B233600FE;
	Tue, 27 Jan 2026 15:12:08 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Tue, 27 Jan 2026 15:11:50 +0000
Subject: [PATCH v2 4/6] phy: tegra: xusb: Add ID override support to padctl
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-diogo-tegra_phy-v2-4-787b9eed3ed5@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769526725; l=3173;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=WZilSxlFB7epi0aPRUnYdCJn7ILjtGGF0QOrx/FScJY=;
 b=SSX8pTTLSNB0iUI793ypY55f5XwsHkMKA2+nJ6SI4/PlZVfdJhQvieS+7RfQ7kdaY/2sVln/A
 1RYoYqcVBaUBBpo9i50imMu9Ol455+Ouqm1fNHW0BLrb+6sp7EWlayS
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

In preparation to move the XUSB PHY .set_mode() callback into a common
implementation introduce a generic id_override callback in
tegra_xusb_padctl_ops that delegates to a SoC-specific implementation
and register Tegra210 with the new callback.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
v1->v2:
- New patch
---
 drivers/phy/tegra/xusb-tegra210.c |  1 +
 drivers/phy/tegra/xusb.c          | 10 ++++++++++
 drivers/phy/tegra/xusb.h          |  1 +
 include/linux/phy/tegra/xusb.h    |  2 ++
 4 files changed, 14 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 3abdf0182d67..be03a17afd7e 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -3262,6 +3262,7 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
 	.usb3_set_lfps_detect = tegra210_usb3_set_lfps_detect,
 	.hsic_set_idle = tegra210_hsic_set_idle,
 	.vbus_override = tegra210_xusb_padctl_vbus_override,
+	.id_override = tegra210_xusb_padctl_id_override,
 	.utmi_port_reset = tegra210_utmi_port_reset,
 };
 
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 03fd6269fdbe..0443465bcf50 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1498,6 +1498,16 @@ int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
 }
 EXPORT_SYMBOL_GPL(tegra_xusb_padctl_set_vbus_override);
 
+int tegra_xusb_padctl_set_id_override(struct tegra_xusb_padctl *padctl,
+							bool val)
+{
+	if (padctl->soc->ops->id_override)
+		return padctl->soc->ops->id_override(padctl, val);
+
+	return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_set_id_override);
+
 int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 273af147dfd3..08053a730d54 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -411,6 +411,7 @@ struct tegra_xusb_padctl_ops {
 	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
 				    unsigned int index, bool enable);
 	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
+	int (*id_override)(struct tegra_xusb_padctl *padctl, bool set);
 	int (*utmi_port_reset)(struct phy *phy);
 	void (*utmi_pad_power_on)(struct phy *phy);
 	void (*utmi_pad_power_down)(struct phy *phy);
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
index a0d3d5b7cf33..116d0c6609cb 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -21,6 +21,8 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 					   unsigned int port, bool enable);
 int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
 					bool val);
+int tegra_xusb_padctl_set_id_override(struct tegra_xusb_padctl *padctl,
+				      bool val);
 void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy);
 void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy);
 int tegra_phy_xusb_utmi_port_reset(struct phy *phy);

-- 
2.52.0

