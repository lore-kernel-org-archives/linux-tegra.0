Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410392FB969;
	Sun,  1 Mar 2026 02:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330548; cv=none; b=DdYPvdUDBcKCK68eWEDpvRfyQODn7vrm1Vim8h7hCo6TSBv4U7rXYlHrko5j1BJoR5TyMTiiE9pm+HYVkAeUuO60B/MDvFBCSOBMksQYE4cC3cMP2fjdl7vk4Uiuugd+n6hGkGnfR+SzFpjPCMMnIWkm4R3js40BQwH01/7a1rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330548; c=relaxed/simple;
	bh=KmH3hkbiOh3+edAF/MqRkL0Vdzpm6Hb8w7j2lmfhbv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A91mmqI2P0pFl941+MNiXD5qxhPJ9UZchhtzW4ctiKl1fcywEgmY5ZupV7ruSpu2s1IZ/P3GE9CksAbmyFdw5PEbGXQ2E5wAy+AQOYJy1XGRlB701oCLyn9+d6HfqV+UJXU3ZEwbXvOdnBYDz+NEU6alGVm4qCTMZG/HTiuYzKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAPZj5WU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAPZj5WU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B428C19421;
	Sun,  1 Mar 2026 02:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330548;
	bh=KmH3hkbiOh3+edAF/MqRkL0Vdzpm6Hb8w7j2lmfhbv8=;
	h=From:To:Cc:Subject:Date:From;
	b=JAPZj5WU4nLeT5NQtrZCDDLsUMYbgaZH3wLo8HBaYNVGYP4YpPbcbS9NtDqlRkPvy
	 akt7e8vumhjGg3His2mEDWcPWVRvE+eL1c3yWUY1iep/VM1Ha8qgkrF8h+liMABMgz
	 I/ap88qlif9tjf1WGv2j7WxX+ZF0Mo0RPxA6xbZ6/SCJLW7eLwQQaKZw2JOeJyn3tI
	 WGm+yu4Gt0HdPx3gCo9WTxbL3vKQhIMjeJHhWiAamcNlUCDo3IWyc9czMsGiSRWbss
	 STNgkvuzTh21+K7WY0argdmsBfKP5Y0AGg/6Ri9Ik/Pl76UHafVML/P1UoXqge8tbe
	 yukmORmZJHyBQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haotienh@nvidia.com
Cc: stable <stable@kernel.org>,
	Wayne Chang <waynec@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: FAILED: Patch "usb: gadget: tegra-xudc: Add handling for BLCG_COREPLL_PWRDN" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:02:25 -0500
Message-ID: <20260301020226.1730162-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 1132e90840abf3e7db11f1d28199e9fbc0b0e69e Mon Sep 17 00:00:00 2001
From: Haotien Hsu <haotienh@nvidia.com>
Date: Sat, 24 Jan 2026 01:31:21 +0800
Subject: [PATCH] usb: gadget: tegra-xudc: Add handling for BLCG_COREPLL_PWRDN

The COREPLL_PWRDN bit in the BLCG register must be set when the XUSB
device controller is powergated and cleared when it is unpowergated.
If this bit is not explicitly controlled, the core PLL may remain in an
incorrect power state across suspend/resume or ELPG transitions.
Therefore, update the driver to explicitly control this bit during
powergate transitions.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Cc: stable <stable@kernel.org>
Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Link: https://patch.msgid.link/20260123173121.4093902-1-waynec@nvidia.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 9d2007f448c04..7f7251c10e952 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3392,17 +3392,18 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 {
 	u32 val, imod;
 
+	val = xudc_readl(xudc, BLCG);
 	if (xudc->soc->has_ipfs) {
-		val = xudc_readl(xudc, BLCG);
 		val |= BLCG_ALL;
 		val &= ~(BLCG_DFPCI | BLCG_UFPCI | BLCG_FE |
 				BLCG_COREPLL_PWRDN);
 		val |= BLCG_IOPLL_0_PWRDN;
 		val |= BLCG_IOPLL_1_PWRDN;
 		val |= BLCG_IOPLL_2_PWRDN;
-
-		xudc_writel(xudc, val, BLCG);
+	} else {
+		val &= ~BLCG_COREPLL_PWRDN;
 	}
+	xudc_writel(xudc, val, BLCG);
 
 	if (xudc->soc->port_speed_quirk)
 		tegra_xudc_limit_port_speed(xudc);
@@ -3953,6 +3954,7 @@ static void tegra_xudc_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_xudc_powergate(struct tegra_xudc *xudc)
 {
 	unsigned long flags;
+	u32 val;
 
 	dev_dbg(xudc->dev, "entering ELPG\n");
 
@@ -3965,6 +3967,10 @@ static int __maybe_unused tegra_xudc_powergate(struct tegra_xudc *xudc)
 
 	spin_unlock_irqrestore(&xudc->lock, flags);
 
+	val = xudc_readl(xudc, BLCG);
+	val |= BLCG_COREPLL_PWRDN;
+	xudc_writel(xudc, val, BLCG);
+
 	clk_bulk_disable_unprepare(xudc->soc->num_clks, xudc->clks);
 
 	regulator_bulk_disable(xudc->soc->num_supplies, xudc->supplies);
-- 
2.51.0




