Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF735CBCA;
	Tue, 27 Jan 2026 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527312; cv=none; b=VADZUgXS+DO4iOt47EzZs558y6zufHQgN/QHk5Re41WCSdGHuI8HtDK4aoyeyiZjBXtVz0Q3MhGKDvlEnbk+5S1OYrCbZ4J48LYVxhicc26qSH4YlWBGDLJSTJ3jqy/KMJ1jhTKhqGvzZIriNo8qwpObq80SfwpuA8ZEEm3FrEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527312; c=relaxed/simple;
	bh=tPxLgImUSfLaPO0hTIiojepsSdUOwrfSQUsTniiVYsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwgYO+NSqKBVPL+dR3RVhEAJD9ml8/0UVT2ZdSd2X3+LittwoumIDCQd634grmGHsvS7z6QDJE87jQA7ffKtZba6R8c3WM0ByH4vk7DtgjputsgI+LPMrFf6F+rOctPrt/K6PsmgZyq9ToUAWfK7/79SPNEk58yu+FEiZIWvr/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=CNBbIwBk; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="CNBbIwBk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 5DB75600086A;
	Tue, 27 Jan 2026 15:12:11 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id lWw2rW8RwuwY; Tue, 27 Jan 2026 15:12:09 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id ABE236002307;
	Tue, 27 Jan 2026 15:12:08 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1769526728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V0ixqb1WmQNGUgreQanqk1a+bFFp4h/i7hFLQvfziag=;
	b=CNBbIwBkCSTZbT4CWZdM+DSeMHTH1ylUgotr24CkI9OfQDo7P8woRbtOVCMKcMhihTYR0t
	DnIvtnzoa59ivt8UzQhGJj+H+7XSPePszgZSFFwEUGu18G/acDw5NPPjFquLr4uyABWT8A
	2pvJ4ZScImp5XJc9kv7HL1Q6iFJcKsa888VKEkI5k6DsMt+/2u53ajsihZupsjyrO/8ynZ
	2jZhwmD8wV+ks0wwRlK3ILVUWzbB6z2qr5w4Q5H6tOZ4m8lJbWJs+eP1gogJCNP32d8+aT
	iTRiisQp2+vnaMxicF9005WfDJ2WrauyZsml6nAE5Cy9PqgZ22midOLfCIweyw==
Received: from [192.168.2.110] (unknown [148.63.39.39])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 586353600FC;
	Tue, 27 Jan 2026 15:12:08 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Tue, 27 Jan 2026 15:11:48 +0000
Subject: [PATCH v2 2/6] usb: xhci: tegra: Remove redundant mutex when
 setting phy mode
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-diogo-tegra_phy-v2-2-787b9eed3ed5@tecnico.ulisboa.pt>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769526725; l=1033;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=tPxLgImUSfLaPO0hTIiojepsSdUOwrfSQUsTniiVYsM=;
 b=aaqsA3rbn08ZXBt45VmehvpQaYP+AdUvjAwXu//GfD98G9fWXZi5Z+r+bS6F+oCyZKHlHf3l6
 0amw7mlT1pPDbSPq6fAIxwDEDeCDafVvh0VFU/BPG10byRsmRFvz3tg
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

As the PHY subsystem already synchronizes concurrent accesses to a PHY
instance with a core-internal mutex remove the driver specific mutex
synchronization.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
v1->v2:
- New patch
---
 drivers/usb/host/xhci-tegra.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 8b492871d21d..927861ca14f2 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1357,15 +1357,11 @@ static void tegra_xhci_id_work(struct work_struct *work)
 
 	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra->host_mode));
 
-	mutex_lock(&tegra->lock);
-
 	if (tegra->host_mode)
 		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
 	else
 		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
 
-	mutex_unlock(&tegra->lock);
-
 	tegra->otg_usb3_port = tegra_xusb_padctl_get_usb3_companion(tegra->padctl,
 								    tegra->otg_usb2_port);
 

-- 
2.52.0

